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
		boolean valide=false; 
		String cause = "";
		
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
			
			boolean nom_valide = (nom.matches("^[a-zA-Z]*$") && nom!="null");
			boolean prenom_valide = (prenom.matches("^[a-zA-Z]*$") && prenom!="null");
			boolean adresse_valide = (adresse!="null");
			boolean mdp_valide = (mdp!="null");
			boolean mail_valide = (mail.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$"));
			
			if(nom_valide && prenom_valide && adresse_valide && mdp_valide && mail_valide){
				String query = "UPDATE personne SET login='" + req.getParameter("login") + "',mdp='"+req.getParameter("mdp")+"',adresse='"+req.getParameter("adresse")+"' WHERE login='"+session.getAttribute("compte")+"'";
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