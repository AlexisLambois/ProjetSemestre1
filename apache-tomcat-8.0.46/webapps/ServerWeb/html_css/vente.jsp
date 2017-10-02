<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="fr">
<head>
	<%@ page import="Commande.*"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.util.*"%>
	<meta charset="UTF-8">
	<title>Serveur de Test</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link href="style.css" rel="stylesheet">
</head>
<body>
	
		<div class="menu">
		<div class="block">
		<ul>
			<li>
				<div class="menu_a"><a href="accueil.jsp">Accueil</a></div>
			</li>
			<li>
				<div class="menu_a"><a href="vente.jsp">Catalogue</a></div>
			</li>
			<li>
				<div class="menu_a"><a href="#">Panier</a></div>
			</li>
			<li>
				<div class="menu_a"><a href="#">Lien 4</a></div>
			</li>
		</ul>
		</div>
	</div>
	
	<%
		Connection con =null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres","postgres","root");
			Statement stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from produit");
	%>
	<center> <table class="tab_affiche" border=1>
		<%while(rs.next()){%>
			<tr>
				<td>
					<%out.print(rs.getString("nom"));%>
				</td>
				<td>
					<%out.print(rs.getString("description"));%>
				</td>
				<td>
					<%out.print(rs.getString("prix"));%> euros
				</td>
				<td>
					<a href="<%out.print(rs.getString("urlimg"));%>"><img src="<%out.print(rs.getString("urlimg"));%>"></a>
				</td>
				<td>
					<a href="#?id=<%out.print(rs.getString("idproduit"));%>"><img class="plus" src="addition.png"></a>
				</td>
			</tr>
		<%}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		con.close();
	} 
	%>
	</table></center>
	
	
</body>
</html>