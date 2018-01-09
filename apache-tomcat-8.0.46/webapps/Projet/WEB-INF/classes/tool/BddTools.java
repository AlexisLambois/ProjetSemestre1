package tool;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.*;

public class BddTools {
	
	Connection con = null;
	
	public BddTools( String base ){
		this.con = connecter(base);
	}
	
	public Connection connecter(String base){
		
		Connection con = null;

		try{
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://psqlserv/da2i","lamboisa","moi");
			//con = DriverManager.getConnection("jdbc:postgresql://localhost/da2i","lamboisa","moi");
			
		}catch(Exception e){
			e.printStackTrace();
			fermer();
		}
		return con;
	}
	
	public void fermer(){
		try{
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int nbLines(String table){
		try{
			String query = "SELECT count(*) FROM test";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			return rs.getInt(1);
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}
	}
	
	public ResultSet toResult(String requete){
		try{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(requete);
			return rs;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<ArrayList<String>> getRequest(String requete){
		
		ArrayList<ArrayList<String>> temp = new ArrayList<>();
		
		try{
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(requete);
			ResultSetMetaData md = rs.getMetaData();
//			
//			ArrayList<String> temp2 = new ArrayList<>();
//			for (int i = 1; i <= md.getColumnCount(); i++) {
//				temp2.add(md.getColumnName(i));
//			}
//			temp.add(temp2);
			
			ArrayList<String> donne = new ArrayList<>();
			while(rs.next()){
				donne = new ArrayList<>();
				for (int i = 1; i <= md.getColumnCount(); i++) {
					donne.add(rs.getString(i));
				}
				temp.add(donne);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			fermer();
			return null;
		}
		return temp;
		
	}
	
	public ArrayList<String> getRequests (String requete){
		
		ArrayList<String> temp = new ArrayList<>();
		
		try{
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(requete);
			ResultSetMetaData md = rs.getMetaData();
		
			while(rs.next()) {
				temp.add(rs.getString(1));
			}
			
		}catch(Exception e){
			e.printStackTrace();
			fermer();
			return null;
		}
		return temp;
		
	}
	
	public HashMap<String,String> getHash(String requete){
		
		HashMap<String,String> temp = new HashMap<>();
		
		try{
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(requete);
			ResultSetMetaData md = rs.getMetaData();
			
			while(rs.next()){
				String value = "";
				for (int i = 2; i <= md.getColumnCount(); i++) {
					value = value + "%" + rs.getString(i);
				}
				temp.put(rs.getString(1),value);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			fermer();
			return null;
		}
		return temp;
		
	}
	
	public String toString(String requete){
		
		String html = "";
		
		try{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(requete);
			ResultSetMetaData md = rs.getMetaData();
	
			while(rs.next()){
				for (int i = 1; i <= md.getColumnCount(); i++) {
					html+=rs.getString(i)+"%";
				}
				html+="?";
			}
		}catch(Exception e){
			e.printStackTrace();
			fermer();
		}
		
		return html;

	}
	
	public String toHtml(String requete){
		
		String html = "<table>";
		
		try{
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(requete);
			ResultSetMetaData md = rs.getMetaData();
	
			html+="<tr>";
			for (int i = 1; i <= md.getColumnCount(); i++) {
				html+="<th>"+(md.getColumnName(i))+"</th>";
			}
			html+="</tr>";
	
			while(rs.next()){
				html+="<tr>";
				for (int i = 1; i <= md.getColumnCount(); i++) {
					html+="<td>"+rs.getString(i)+"</td>";
				}
				html+="</tr>";
			}
		}catch(Exception e){
			e.printStackTrace();
			fermer();
		}
		
		return html;

	}
	
	public String describe(String table){
		String res = "";
		try{
			String query = "SELECT * FROM "+table;
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			ResultSetMetaData md = rs.getMetaData();
			res += "Nombre de colonne : "+ (md.getColumnCount()) + "\n";
			for (int i = 1; i <= md.getColumnCount(); i++) {
				res += "Colonne : " + (md.getColumnName(i) + " de type " + md.getColumnTypeName(i)) + "\n";
			}
		}catch(Exception e){
			e.printStackTrace();
			fermer();
			return null;
		}
		return res;
	}

}
