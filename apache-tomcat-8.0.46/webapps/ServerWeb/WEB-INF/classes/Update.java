import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/Update")
public class Update extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Connection con=null;
		ResultSet rs=null;
		HttpSession session = req.getSession(true);
		boolean trouve=false; 
		
		try {

			// enregistrement du driver
			Class.forName("org.postgresql.Driver");

			// connexion a la base
			con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres","postgres","root");

			// execution de la requete
			Statement stmt = con.createStatement();
			String query = "SELECT login FROM personne WHERE login='"+req.getParameter("login")+"'";
			rs = stmt.executeQuery(query);
		
			trouve = rs.next() && !req.getParameter("login").equals(session.getAttribute("compte"));
			
			if(!trouve){
				query = "UPDATE personne SET login='" + req.getParameter("login") + "',mdp='"+req.getParameter("mdp")+"',adresse='"+req.getParameter("adresse")+"' WHERE login='"+session.getAttribute("compte")+"'";
				stmt.executeUpdate(query);
				session.setAttribute("compte", req.getParameter("login"));
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
				if(trouve){
					res.sendRedirect("../html_css/accueil.jsp?modif=false");
				}else{
					res.sendRedirect("../html_css/accueil.jsp?modif=true");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
