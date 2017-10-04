package Requete;
import java.sql.*;
import java.util.ArrayList;
public class Requetage{
	
	private java.sql.Connection con = null;
	private ResultSet rs = null;
	private String query;
	
	public Requetage(String query) throws SQLException{
		
		this.query = query;
		
		try {

			// enregistrement du driver
			Class.forName("org.postgresql.Driver");
			// connexion a la base
			con = DriverManager.getConnection("jdbc:postgresql://psqlserv/da2i","lamboisa","moi");
			
		}catch(Exception e){
			e.printStackTrace();
			con.close();
		}
		
	}
	
	public void execute(){
		
		try {
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(query);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public String toListe(String colonne) throws SQLException{
		String res = "<ul>";
		
		while ( rs.next() ) {
			res+= "<li>"+rs.getString(colonne)+"</li>";
		}

		return res+"</ul>";
	}
	
	public String toListe() throws SQLException{
		String res = "<ul>";
		
		while ( rs.next() ) {
			res+= "<li>"+rs.getString(1)+"</li>";
		}

		return res+"</ul>";
	}
	
	public String toTable(ArrayList<String> liste_colonne) throws SQLException{
		String res = "<table>";
		
		while ( rs.next() ) {
			res+="<tr>";
			for (String string : liste_colonne) {
				res+="<td>"+rs.getString(string)+"</td>";
			}
			res+="</tr>";
		}

		return res+"</table>";
	}
	
	public String toTable() throws SQLException{
		String res = "<table>";
		ResultSetMetaData md = rs.getMetaData();
		
		while ( rs.next() ) {
			res+="<tr>";
			for (int i = 0 ; i < md.getColumnCount() ; i++) {
				res+="<td>"+rs.getString(md.getColumnLabel(i))+"</td>";
			}
			res+="</tr>";
		}

		return res+"</table>";
	}

}