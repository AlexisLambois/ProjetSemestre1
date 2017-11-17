package tool;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import tool.BddTools;
@WebServlet("/servlet/Search")
public class Search extends HttpServlet {
	
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession(true);
//	    //session.setAttribute("gare1", req.getParameter("gare1"));
//	    //session.setAttribute("gare2", req.getParameter("gare2"));
	    session.setAttribute("gare1", "Paris-Bercy");
	    session.setAttribute("gare2", "St-Florentin-Vergigny");
//	    session.setAttribute("dateDep", req.getParameter("dateDep"));
//	    session.setAttribute("dateRet", req.getParameter("dateRet"));
		
		/***** Variables *****/
		
		BddTools t = null;
		Date date1 = null;
		Date date2 = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String stop_id1 = null;
		String stop_id2 = null;
		ArrayList<ArrayList<String>> trajet_id = null;
		HashMap<String,String> service_dispo = new HashMap<>();
		ArrayList<String> res_trajet = new ArrayList<>();
		
		try {
			
			/**** Parse de Date de string dd/mm/yyyy a Date YYYY-mm-dd ****/ 
			
			date1 = sdf.parse(parseDate((String)req.getParameter("dateDep")));
			date2 = sdf.parse(parseDate((String)req.getParameter("dateRet")));
		
			t = new BddTools("da2i");
			
			/**** Recuperation des num de gare ****/
			
			stop_id1 = t.toString("SELECT stop_id FROM stops WHERE name='"+req.getParameter("gare1")+"' LIMIT 1;");
			stop_id2 = t.toString("SELECT stop_id FROM stops WHERE name='"+req.getParameter("gare2")+"' LIMIT 1;");
			
			/**** Parse pour obtenir que les numeros ****/
		
			stop_id1 = getDigit(stop_id1);
			stop_id2 = getDigit(stop_id2);
			
			/**** Recuperation des ids de trajet qui sont commun aux deux arrets  ****/
			
			trajet_id = t.getRequest("SELECT st1.trajet_id FROM stop_times as st1 INNER JOIN stop_times as st2 ON st1.trajet_id=st2.trajet_id WHERE st1.stop_id LIKE'%"+stop_id1+"%' AND st2.stop_id LIKE '%"+stop_id2+"%';");
			
			/**** Recuperation des ids de service qui correspondent aux trajet  ****/
			
			String temp = "";
			
			for(ArrayList<String> list: trajet_id){
				temp = getDigit( t.toString("SELECT service_id FROM trajet WHERE trajet_id='"+list.get(0)+"';") );
				service_dispo.put(temp,"");
			}

			/**** Recuperation des disponibilites de service qui correspondent aux trajet  ****/
		
			for (String key : service_dispo.keySet()) {
				temp = t.toString("SELECT monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date FROM calendar WHERE service_id='"+key+"';");
				service_dispo.put(key,temp);
			}
			
			/**** Tri des trajet non disponible ****/
			
			int index1 = getOrdinalCalendar(date1);
			Date date_temp1 = null;
			Date date_temp2 = null;
			int cpt = 0;
			String[] tab_temp = null;
			
			for (String value : service_dispo.values()) {
				
				if( value != "" ) {
					
					 tab_temp = (value.substring(0,value.length()-2)).split("%");
					 date_temp1 = sdf.parse(tab_temp[7]);
					 date_temp2 = sdf.parse(tab_temp[8]);
					 if( tab_temp[index1].equals("1") && date1.after(date_temp1) && date1.before(date_temp2) ) {
						 res_trajet.add(trajet_id.get(cpt).get(0));
					 }	 
				}
				cpt++;
			}
			
			int num_seq1 = 0;
			int num_seq2 = 0;
			
			for ( int i = 0 ; i < res_trajet.size() ; i++ ) {
				num_seq1 = Integer.parseInt(getDigit(t.toString("SELECT num_sequence FROM stop_times WHERE trajet_id='"+res_trajet.get(i)+"' AND stop_id LIKE '%"+stop_id1+"%';")));
				num_seq2 = Integer.parseInt(getDigit(t.toString("SELECT num_sequence FROM stop_times WHERE trajet_id='"+res_trajet.get(i)+"' AND stop_id LIKE '%"+stop_id2+"%';")));
				if( num_seq1 > num_seq2 ) {
					res_trajet.remove(i);
				}
			}
			
			 session.setAttribute("res",res_trajet);
			
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