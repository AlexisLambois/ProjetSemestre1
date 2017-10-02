package Commande;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class Panier {
	
	HashMap<String,Integer> m = new HashMap<String,Integer>();
	
	public String toHtml(){
		String res = "<table border=1 >";
		for (Map.Entry<String,Integer> e : m.entrySet()) {
			res = res + "<tr><td>" + e.getKey() + "</td><td>" + e.getValue() + "</td></tr>";
		}
		return res + "</table>";
	}
	
	public int prixGlobal(){
		int i  = 0;
		Connection con = null;
		try{
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres","postgres","root");
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM produit";
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()){
				if(m.containsKey(rs.getString("nom"))){
					i= i + (m.get(rs.getString("nom"))*rs.getInt("prix"));
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return i;
	}
	
	public void ajouter(String libelle){
		if(m.containsKey(libelle)){
			m.put(libelle, m.get(libelle)+1);
		}else{
			m.put(libelle, 1);
		}
	}
	
	public void clear(){
		m.clear();
	}
	
	public void sauver(Connection con){
		SimpleDateFormat formater = new SimpleDateFormat("dd/MM//yy HH:mm:ss");
		Date date = new Date();
		try{
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres","postgres","root");
			Statement stmt = con.createStatement();
		
			for (Map.Entry<String,Integer> e : m.entrySet()) {
				String query = "INSERT INTO commande(datecommande,id,qute) VALUES('"+formater.format(date.getTime())+"','"+e.getKey()+"',"+e.getValue()+")";
				stmt.executeUpdate(query);
			}
			
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

}
