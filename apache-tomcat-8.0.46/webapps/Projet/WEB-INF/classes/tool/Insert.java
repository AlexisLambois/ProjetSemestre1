package tool;
import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/Insert")
public class Insert extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		BddTools t = null;
		HttpSession session = req.getSession(true);
		String query = "";
		String temp = "";
		ArrayList<String> list = new ArrayList<>();
		String[] tab_temp = req.getParameter("object").split(",");
		
		try {
			
			t = new BddTools("da2i");
			
			if( tab_temp.length == 4 ) {
				query = "SELECT arrival_time FROM stop_times INNER JOIN stops ON stops.stop_id=stop_times.stop_id WHERE trajet_id='"+tab_temp[0]+"' AND name='"+tab_temp[2]+"';";
			}else {
				query = "SELECT arrival_time FROM stop_times WHERE trajet_id='"+tab_temp[2]+"' AND stop_id='"+tab_temp[1]+"';";
			}

			list = t.getRequests(query);
			for( int i = 0 ; i < tab_temp.length-1 ; i++ ) {
				temp+= tab_temp[i] + "%";
			}
			
			query="INSERT INTO reservation(pseudo,trajet_id,date_expiration) VALUES('"+session.getAttribute("id_client")+"','"+temp+"','"+list.get(0)+"%"+tab_temp[tab_temp.length-1]+"');";
			
			t.Insert(query);
	
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				res.sendRedirect("../html_css/search.jsp");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
