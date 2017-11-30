package tool;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/Connexion")
public class Connexion extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		BddTools t = null;
		boolean find = false;
		HttpSession session = req.getSession(true);
		ResultSet rs = null;
		
		try {

			t = new BddTools("da2i");
			rs = t.toResult("SELECT pseudo FROM client WHERE pseudo='" + req.getParameter("pseudo") + "' AND mdp='" + req.getParameter("passwd") + "'");

			find = rs.next();
	
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(find){
					res.sendRedirect("../html_css/"+req.getParameter("page")+".jsp");
					session.setAttribute("id_client", rs.getString(1));
				}else{
					res.sendRedirect("../html_css/connection.jsp?auth=false");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
