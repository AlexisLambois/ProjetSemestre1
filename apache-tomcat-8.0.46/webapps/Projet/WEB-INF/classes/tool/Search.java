package tool;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import tool.BddTools;
@WebServlet("/servlet/Search")
public class Search extends HttpServlet {


	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		HttpSession session = req.getSession(true);
	    session.setAttribute("gare1", req.getParameter("gare1"));
	    session.setAttribute("gare2", req.getParameter("gare2"));

		/***** Variables *****/

		BddTools t = null;
		Date date = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String stop_id1 = null;
		String stop_id2 = null;
		ArrayList<ArrayList<String>> trajet_id = null;
		LinkedHashMap<String,String> has = new LinkedHashMap<>();
		ArrayList<String> finale = new ArrayList<>();
		String query = "";
		String temp = "";
		int cpt = 0;
		
		try {

			/**** Parse de Date de string dd/mm/yyyy a Date YYYY-mm-dd ****/

			date = sdf.parse(parseDate((String)req.getParameter("date")));

			t = new BddTools("da2i");

			/**** Recuperation des num de gare ****/

			stop_id1 = t.toString("SELECT stop_id FROM stops WHERE name='"+req.getParameter("gare1")+"' LIMIT 1;");
			stop_id2 = t.toString("SELECT stop_id FROM stops WHERE name='"+req.getParameter("gare2")+"' LIMIT 1;");

			/**** Parse pour obtenir que les numeros ****/

			stop_id1 = getDigit(stop_id1);
			stop_id2 = getDigit(stop_id2);
			
			/**** Recuperation des ids de trajet qui sont commun aux deux arrets ( DIRECT ) ****/
			
			query = "SELECT trajet_id FROM temporaly_data WHERE gare1 LIKE '%"+stop_id1+"%' AND gare2 LIKE '%"+stop_id2+"%'";
			
			trajet_id = t.getRequest(query);
			
			String day = (String)sdf.format(date);
			sdf = new SimpleDateFormat("EEEE",Locale.ENGLISH);
			String day_name = (String)sdf.format(date).toLowerCase();
			session.setAttribute("date", day);
			
			if( trajet_id.size() == 0 ) {
				
				do {
					
					cpt++;
					
					query = "SELECT td1.trajet_id,td2.gare1,td2.trajet_id";
					
					for(int i = 0 ; i < cpt-1 ; i++) {
						query+= ",td"+(i+3)+".gare1,td"+(i+3)+".trajet_id";
					}
					
					query+= " FROM temporaly_data as td1";
					
					for( int i = 0 ; i < cpt ; i++) {
						query+=" INNER JOIN temporaly_data as td"+(i+2)+" ON td"+(i+1)+".gare2=td"+(i+2)+".gare1";
					}
					
					query+=" WHERE td1.gare1 LIKE '%"+stop_id1+"%' AND td"+(cpt+1)+".gare2 LIKE '%"+stop_id2+"%'";
					
					trajet_id = t.getRequest(query);
					
				}while( trajet_id.size() == 0 && cpt <= 2);
				
				query+=" AND td1.trajet_id IN ( SELECT trajet_id FROM trajet WHERE service_id IN ( SELECT service_id FROM calendar WHERE "+day_name+"=1 AND start_date<'"+day+"' AND end_date>'"+day+"' ))";
				query+=" AND td"+(cpt+1)+".trajet_id IN ( SELECT trajet_id FROM trajet WHERE service_id IN ( SELECT service_id FROM calendar WHERE "+day_name+"=1 AND start_date<'"+day+"' AND end_date>'"+day+"'));";
		
				trajet_id = t.getRequest(query);
				
				for(ArrayList<String> list:trajet_id) {
	
					switch (req.getParameter("select")){
						case "0":
							if( has.get(list.get(0)) == null ) {
								query = "SELECT arrival_time FROM stop_times WHERE trajet_id='"+list.get(0)+"' AND stop_id LIKE '%"+stop_id1+"%' AND arrival_time > '"+req.getParameter("temps")+"'";
								temp = t.toString(query);
							}else{
								temp = has.get(list.get(0));
							}
							
							has.put(list.get(0),temp);
							
							if( !temp.equals("") ) {						
								
								query = "SELECT arrival_time FROM stop_times WHERE trajet_id='"+list.get(2)+"' AND stop_id LIKE '%"+list.get(1)+"%' AND arrival_time > '"+temp.substring(0,temp.length()-2)+"'";
								temp = t.toString(query);
								
								if( !temp.equals("") ) {
									finale.add(list.get(0)+"%"+list.get(1)+"%"+list.get(2));
								}
								
							}
							
							break;
						case "1":
						    query=" AND trajet_id IN ( SELECT trajet_id FROM stop_times WHERE stop_id LIKE '%"+stop_id2+"%' AND arrival_time > '"+req.getParameter("temps")+"')";
						    break;
						case "2":
						    query=" AND trajet_id IN ( SELECT trajet_id FROM stop_times WHERE stop_id LIKE '%"+stop_id1+"%' AND arrival_time < '"+req.getParameter("temps")+"')";
						    break;
						case "3":
						    query=" AND trajet_id IN ( SELECT trajet_id FROM stop_times WHERE stop_id LIKE '%"+stop_id2+"%' AND arrival_time < '"+req.getParameter("temps")+"')";
						    break;
					}
					
				}
				
			}else{
				
				query+=" AND trajet_id IN ( SELECT trajet_id FROM trajet WHERE service_id IN (SELECT service_id FROM calendar WHERE "+day_name+"=1 AND start_date < '"+day+"' AND end_date > '"+day+"')) ";
				
				switch (req.getParameter("select")){
					case "0":
						query+=" AND trajet_id IN ( SELECT trajet_id FROM stop_times WHERE stop_id LIKE '%"+stop_id1+"%' AND arrival_time > '"+req.getParameter("temps")+"')";
						break;
					case "1":
					    query+=" AND trajet_id IN ( SELECT trajet_id FROM stop_times WHERE stop_id LIKE '%"+stop_id2+"%' AND arrival_time > '"+req.getParameter("temps")+"')";
					    break;
					case "2":
					    query+=" AND trajet_id IN ( SELECT trajet_id FROM stop_times WHERE stop_id LIKE '%"+stop_id1+"%' AND arrival_time < '"+req.getParameter("temps")+"')";
					    break;
					case "3":
					    query+=" AND trajet_id IN ( SELECT trajet_id FROM stop_times WHERE stop_id LIKE '%"+stop_id2+"%' AND arrival_time < '"+req.getParameter("temps")+"')";
					    break;
				}
				
				trajet_id = t.getRequest(query);
				
				for(ArrayList<String> list:trajet_id) {
					finale.add(list.get(0));
				}
				
			}

			session.setAttribute("res",finale);

		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			t.fermer();
		}

		res.sendRedirect("../html_css/search.jsp");

	}

	String parseDate(String date){
		return date.substring(6,10)+"-"+date.substring(3,5)+"-"+date.substring(0,2);
	}

	String getDigit(String phrase) {
		Pattern pattern = Pattern.compile("[0-9]+");
		Matcher m = pattern.matcher(phrase);
		m.find();
		return (String)m.group();
	}
}
