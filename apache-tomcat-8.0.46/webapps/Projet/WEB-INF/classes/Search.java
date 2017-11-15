
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/Search")
public class Search extends HttpServlet {
	
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
//		HttpSession session = req.getSession(true);
//	    //session.setAttribute("gare1", req.getParameter("gare1"));
//	    //session.setAttribute("gare2", req.getParameter("gare2"));
//	    session.setAttribute("gare1", "Paris-Bercy");
//	    session.setAttribute("gare2", "St-Florentin-Vergigny");
//	    session.setAttribute("dateDep", req.getParameter("dateDep"));
//	    session.setAttribute("dateRet", req.getParameter("dateRet"));
		
		/****** Variables *******/
		
		BddTools t = null;
		Date date1 = null;
		Date date2 = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		
		String stop_id1 = null;
		String stop_id2 = null;
		ArrayList<ArrayList<String>> trajet_id = null;
		ArrayList<ArrayList<String>> service_id = null;
		ArrayList<ArrayList<String>> dispo = null;
		
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
			
			service_id = new ArrayList<>();
			String temp="";
			ArrayList<String> list_temp = null;
			
			for(ArrayList<String> list: trajet_id){
				temp = t.toString("SELECT service_id FROM trajet WHERE trajet_id='"+list.get(0)+"';");
				list_temp = new ArrayList<String>();
				list_temp.add(getDigit(temp));
				service_id.add(list_temp);
			}
			
			/**** Recuperation des disponibilites de service qui correspondent aux trajet  ****/
			
			dispo = new ArrayList<>();
		
			for(ArrayList<String> list: service_id){
				temp = t.toString("SELECT monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date FROM calendar WHERE service_id='"+list.get(0)+"';");
				list_temp = new ArrayList<String>();
				list_temp.add(temp.substring(0,temp.length()-2));
				dispo.add(list_temp);
			}
			
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