import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/Inscription")
public class Inscription extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Connection con=null;
		
		try {

			// enregistrement du driver
			Class.forName("org.postgresql.Driver");

			// connexion a la base
			con = DriverManager.getConnection("jdbc:postgresql://psqlserv/da2i","lamboisa","moi");
			
			// execution de la requete
			Statement stmt = con.createStatement();
			
			String query = "SELECT cno FROM client WHERE mail='" + req.getParameter("mail") + "'";
			ResultSet rs = stmt.executeQuery(query);
			
			if(!rs.next()){
				if( ( req.getParameter("mdp").equals(req.getParameter("mdp2")) ) && (req.getParameter("nom").matches("^[a-zA-Z0-9_]*$")) ){
					query = "INSERT INTO client(nom,mail,mdp) VALUES('"+req.getParameter("nom")+"','"+req.getParameter("mail")+"','"+req.getParameter("mdp")+"')";
					stmt.executeUpdate(query);
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
				res.sendRedirect("../html_css/index.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
