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
		ArrayList<ArrayList<String>> trajet_id_dispo = new ArrayList<>();
		ArrayList<String> finale = new ArrayList<>();

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
			
			String temp = "";
			int cpt = 0;
			boolean trouve = false;
			
			/**** Recuperation des ids de trajet qui sont commun aux deux arrets ( DIRECT ) ****/

			trajet_id = t.getRequest("SELECT st1.trajet_id FROM stop_times as st1 INNER JOIN stop_times as st2 ON st1.trajet_id=st2.trajet_id WHERE st1.stop_id LIKE'%"+stop_id1+"%' AND st2.stop_id LIKE '%"+stop_id2+"%';");

			if( trajet_id.size() == 0 ) {
				
				cpt = 1;
				
				do {
					
					String query = "SELECT td1.trajet_id,td2.gare1,td2.trajet_id";
					
					for(int i = 0 ; i < cpt-1 ; i++) {
						query+= ",td"+(i+3)+".gare1,td"+(i+3)+".trajet_id";
					}
					
					query+= " FROM temporaly_data as td1";
					
					for( int i = 0 ; i < cpt ; i++) {
						query+=" INNER JOIN temporaly_data as td"+(i+2)+" ON td"+(i+1)+".gare2=td"+(i+2)+".gare1";
					}
					
					query+=" WHERE td1.gare1 LIKE '%87286401%' AND td"+(cpt+1)+".gare2 LIKE '%87286542%';";
					
					trajet_id = t.getRequest(query);
					
				}while( trajet_id.size() == 0 || cpt == 4);
				
			}
			
			String day = (String)sdf.format(date);
			sdf = new SimpleDateFormat("EEEE",Locale.ENGLISH);
			String day_name = (String)sdf.format(date).toLowerCase();
			
			for( ArrayList<String> obj: trajet_id ) {
				if( obj.size() == 1 ) {
					temp = "SELECT trajet_id\n" + 
							"FROM trajet\n" + 
							"WHERE trajet_id='"+obj.get(0)+"' AND service_id in (\n" + 
							"SELECT service_id\n" + 
							"FROM calendar\n" + 
							"WHERE "+day_name+"=1 AND start_date < '"+day+"' AND end_date > '"+day+"');";
				}else {
					
				}
				
				if() {
					
				}
			}
			
			/****
			
			res_trajet = vide;
			
			LinkedHashMap<String,String> has = new LinkedHashMap<>();
			
			for(int i = 0 ; i < res_trajet.size() ; i++){
				temp = t.toString("SELECT name,arrival_time FROM stop_times AS st INNER JOIN stops AS s ON st.stop_id=s.stop_id WHERE trajet_id='"+res_trajet.get(i)+"';");
				String[] tab = temp.split("\\?");
				has = new LinkedHashMap<>();
				for(int j = 0 ; j < tab.length ; j++){
					tab_temp = (tab[j].split("%"));
					has.put(tab_temp[0],tab_temp[1]);
				}
		
				switch (req.getParameter("select")) {
					case "0":
						if( compareTime( (has.get(req.getParameter("gare1")).substring(0,5)), req.getParameter("temps") ) == -1 ) {
							finale.add(res_trajet.get(i));
						}
						break;
					case "1":
						if( compareTime( (has.get(req.getParameter("gare2")).substring(0,5)), req.getParameter("temps") ) == -1 ) {
							finale.add(res_trajet.get(i));
						}
						break;
					case "2":
						if( compareTime( (has.get(req.getParameter("gare1")).substring(0,5)), req.getParameter("temps") ) == 1 ) {
							finale.add(res_trajet.get(i));
						}
						break;
					case "3":
						if( compareTime( (has.get(req.getParameter("gare2")).substring(0,5)), req.getParameter("temps") ) == 1 ) {
							finale.add(res_trajet.get(i));
						}
						break;
				}
			}
			
			session.setAttribute("res",finale);****/

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
	
	int compareTime(String time1, String time2){
		SimpleDateFormat parser = new SimpleDateFormat("HH:mm");
		try {
			Date date1 = parser.parse(time1);
			Date date2 = parser.parse(time2);
			if(date1.before(date2)) {
				return 1;
			}
			if(date1.after(date2)) {
				return -1;
			}
			return 0;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	String getDigit(String phrase) {
		Pattern pattern = Pattern.compile("[0-9]+");
		Matcher m = pattern.matcher(phrase);
		m.find();
		return (String)m.group();
	}

	int getOrdinalCalendar(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("EEEE",Locale.FRENCH);
		String day_name = (String)sdf.format(date);

		switch (day_name) {
			case "lundi":
				return 0;
			case "mardi":
				return 1;
			case "mercredi":
				return 2;
			case "jeudi":
				return 3;
			case "vendredi":
				return 4;
			case "samedi":
				return 5;
			case "dimanche":
				return 6;
		}

		return -1;
	}

}
