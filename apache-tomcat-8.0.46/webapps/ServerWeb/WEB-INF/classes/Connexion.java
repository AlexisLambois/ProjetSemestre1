import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/Connexion")
public class Connexion extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Connection con=null;
		ResultSet rs=null;
		HttpSession session = req.getSession(true);
		boolean trouve = false;
		
		try {

			// enregistrement du driver
			Class.forName("org.postgresql.Driver");

			// connexion a la base
			con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres","postgres","root");

			// execution de la requete
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM personne WHERE login='" + req.getParameter("login") + "' AND mdp='" + req.getParameter("mdp") + "'";
			rs = stmt.executeQuery(query);
			trouve = rs.next();
			
			if(trouve){
				query = "UPDATE personne SET nbconnec=" + (rs.getInt("nbconnec")+1) + "WHERE login='"+req.getParameter("login")+"'";
				stmt.executeUpdate(query);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
				if(trouve){
					res.sendRedirect("../html_css/accueil.jsp");
					session.setAttribute("compte", req.getParameter("login"));
				}else{
					res.sendRedirect("../html_css/index.jsp?auth=false");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
