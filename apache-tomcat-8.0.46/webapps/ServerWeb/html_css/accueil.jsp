<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="fr">
<head>
<%@ page import="Commande.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<meta charset="UTF-8">
<title>Serveur de Test</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<link href="style.css" rel="stylesheet">
</head>
<body>

	<div class="menu">
		<div class="block">
			<ul>
				<li>
					<div class="menu_a">
						<a href="accueil.jsp">Accueil</a>
					</div>
				</li>
				<li>
					<div class="menu_a">
						<a href="vente.jsp">Catalogue</a>
					</div>
				</li>
				<li>
					<div class="menu_a">
						<a href="#">Panier</a>
					</div>
				</li>
				<li>
					<div class="menu_a">
						<a href="#">Lien 4</a>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="page-header">
		<h1>
			Bienvenue
			<%
			out.print(session.getAttribute("compte"));
		%>
			!
		</h1>
	</div>

		<%
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres", "postgres", "root");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("Select * from personne WHERE login='" + session.getAttribute("compte") + "'");
				rs.next();
		%>
		<table class="tab_info" border:0px;>
			<form method='POST' action='.././servlet/Update'>
				<tr>
					<td><label>Login : </label>
					<input type='text' name='login' value='<% out.print(rs.getString("login"));%>'></td>
				</tr>
				<tr>
					<td><label>Mot de passe : </label>
					<input type='text' name='mdp' value='<% out.print(rs.getString("mdp"));%>'></td>
				</tr>
				<tr>
					<td><label>Adresse : </label>
					<input type='text' name='adresse' value='<% out.print(rs.getString("adresse"));%>'></td>
				</tr>
				<tr>
					<td><label>Nombre de connexion : </label>
					<p><% out.print(rs.getString("nbconnec"));%></p></td>
				</tr>
				<tr><td><button type='submit' class='btn btn-primary'>Mettre à jour</button></td></tr>
			</form>
		</table>
		
		<%if(request.getParameter("modif")!=null && request.getParameter("modif").equals("false")){%>
			<center><h3>Modification erronée ! Cause : Le login existe déjà !</h3></center>
		<%}else if(request.getParameter("modif")!=null && request.getParameter("modif").equals("true")){%>
			<center><h3>Modification réussie !</h3></center>
		<%}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					con.close();
				}
			%>
</body>
</html>