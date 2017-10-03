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
			
			String nom = req.getParameter("nom");
			String mail = req.getParameter("mail");
			String passwd = req.getParameter("passwd");
			String passwd2 = req.getParameter("passwd2");
			
			String query = "SELECT cno FROM client WHERE mail='" + mail + "'";
			ResultSet rs = stmt.executeQuery(query);
			
			if(!rs.next()){
				if( ( passwd.equals(passwd2) ) && (nom.matches("^[a-zA-Z]*$")) && (mail.matches("^[a-zA-Z0-9_]*@[a-z]*.$")) ){
					query = "INSERT INTO client(nom,mail,mdp) VALUES('"+nom+"','"+mail+"','"+passwd+"')";
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
