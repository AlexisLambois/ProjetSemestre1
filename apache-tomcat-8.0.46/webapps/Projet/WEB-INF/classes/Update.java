import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/Update")
public class Update extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		Connection con=null;
		ResultSet rs=null;
		HttpSession session = req.getSession(true);
		boolean valide=false; 
		String cause = "";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		try {

			// enregistrement du driver
			Class.forName("org.postgresql.Driver");

			// connexion a la base
			con = DriverManager.getConnection("jdbc:postgresql://psqlserv/da2i","lamboisa","moi");

			// execution de la requete
			Statement stmt = con.createStatement();
			
			String nom = req.getParameter("nom");
			String prenom = req.getParameter("prenom");
			String adresse = req.getParameter("adresse");
			String mdp = req.getParameter("passwd");
			String mail = req.getParameter("mail");
			String date = req.getParameter("date_naissance");
			System.out.println(date);
			java.util.Date temp = formatter.parse(date);
			System.out.println(temp.toLocaleString());
			java.sql.Date finale = new java.sql.Date(temp.getYear(),temp.getMonth(),temp.getDate());
			
			boolean nom_valide = (nom.matches("^[a-zA-Z]*$") && nom!="null");
			boolean prenom_valide = (prenom.matches("^[a-zA-Z]*$") && prenom!="null");
			boolean adresse_valide = (adresse!="null");
			boolean mdp_valide = (mdp!="null");
			boolean mail_valide = (mail.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$"));
			valide = nom_valide && prenom_valide && adresse_valide && mdp_valide && mail_valide;
			
			if(valide){
				String query = "UPDATE client SET nom='"+nom+"',prenom='"+prenom+"',adresse='"+adresse+"',mdp='"+mdp+"',datenaissance='"+finale+"' WHERE cno='"+session.getAttribute("id_client")+"'";
				stmt.executeUpdate(query);
			}else{
				if(!nom_valide){
					cause+= "Nom invalide : Ne doit contenir que des caractères alphabétiques";
				}
				if(!prenom_valide){
					cause+= "Prenom invalide : Ne doit contenir que des caractères alphabétiques";
				}
				if(!adresse_valide){
					cause+= "Adresse invalide";
				}
				if(!mdp_valide){
					cause+= "Mot de passe invalide";
				}
				if(!mail_valide){
					cause+= "Mail invalide : Doit être du type : texte@texte.texte";
				}
				session.setAttribute("cause", cause);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
				if(valide){
					res.sendRedirect("../html_css/fiche_client.jsp?modif=true");
				}else{
					res.sendRedirect("../html_css/fiche_client.jsp?modif=false");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}