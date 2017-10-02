import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/Inscription")
public class Inscription extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Connection con=null;
		int inserer = 0;
		
		
		try {

			// enregistrement du driver
			Class.forName("org.postgresql.Driver");

			// connexion a la base
			con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres","postgres","root");

			// execution de la requete
			Statement stmt = con.createStatement();
			
			if( !req.getParameter("mdp").equals(req.getParameter("mdp2")) ){
				inserer=1;
			}
			if(!req.getParameter("login").matches("^[a-zA-Z0-9_]*$")){
				inserer=2;
			}
			
			String query = "SELECT * FROM personne WHERE login='" + req.getParameter("login") + "'";
			ResultSet rs = stmt.executeQuery(query);
			
			if( rs.next() ){
				inserer=3;
			}
			
			if(inserer == 0){
				query = "INSERT INTO personne(login,mdp) VALUES('"+req.getParameter("login")+"','"+req.getParameter("mdp")+"')";
				stmt.executeUpdate(query);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
				if(inserer!=0){
					res.sendRedirect("../html_css/index.jsp?inscr="+inserer);
				}else{
					res.sendRedirect("../html_css/index.jsp?inscr=0");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
