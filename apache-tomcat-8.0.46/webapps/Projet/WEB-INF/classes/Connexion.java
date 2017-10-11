import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/Connexion")
public class Connexion extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Connection con=null;
		boolean find = false;
		HttpSession session = req.getSession(true);
		ResultSet rs = null;
		
		try {

			// enregistrement du driver
			Class.forName("org.postgresql.Driver");

			// connexion a la base
			con = DriverManager.getConnection("jdbc:postgresql://psqlserv/da2i","lamboisa","moi");
			
			// execution de la requete
			Statement stmt = con.createStatement();
			String query = "SELECT cno FROM client WHERE mail='" + req.getParameter("mail") + "' AND mdp='" + req.getParameter("passwd") + "'";
			
			rs = stmt.executeQuery(query);
			find = rs.next();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
				if(find){
					res.sendRedirect("../html_css/fiche_client.jsp");
					session.setAttribute("id_client", rs.getString(1));
				}else{
					res.sendRedirect("../html_css/index.jsp?auth=false");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
