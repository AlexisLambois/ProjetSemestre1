package tool;
import java.io.IOException;
import java.util.*;
import java.sql.*;
import java.text.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/Panier")
public class Panier extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		BddTools t = null;
		HttpSession session = req.getSession(true);
		String query = "";
		ArrayList<ArrayList<String>> list;
		ArrayList<ArrayList<String>> finale = new ArrayList<>();
		
		try {
			
			t = new BddTools("da2i");
			
			query = "SELECT rno,trajet_id,date_expiration FROM reservation WHERE pseudo='"+session.getAttribute("id_client")+"';";
			
			list = t.getRequest(query);
			
			for( ArrayList<String> data : list ) {
				
				String[] tab = data.get(2).split("%");
				
				if( time_depasse( tab[0],tab[1] ) ){
					finale.add(data);
				}else {
					query = "DELETE FROM reservation WHERE rno="+data.get(0)+";";
					t.Delete(query);
				}
				
			}
			
			session.setAttribute("panier",finale);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				res.sendRedirect("../html_css/panier.jsp");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public boolean time_depasse(String heure,String date) {
		String actual_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String test_time = date+" "+heure;
		Timestamp ts = Timestamp.valueOf(actual_time);
		Timestamp ts1 = Timestamp.valueOf(test_time);
		
		if( ts.compareTo(ts1) >= 0 ) {
			return false;
		}
		
		return true;
	}
}
