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
			System.out.println(con.toString());
			// execution de la requete
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM client";
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()){
				System.out.println(rs.getString(0));
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
