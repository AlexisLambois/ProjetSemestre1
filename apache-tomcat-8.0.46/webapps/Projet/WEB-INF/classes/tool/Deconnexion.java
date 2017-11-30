package tool;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/Deconnexion")
public class Deconnexion extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		HttpSession session = req.getSession(true);
		
		try {

			session.removeAttribute("id_client");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				res.sendRedirect("../html_css/"+req.getParameter("page")+".jsp");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
