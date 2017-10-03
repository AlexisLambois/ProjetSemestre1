<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Projet</title>
	<link href="style.css" rel="stylesheet">
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.util.*"%>
	<script src="main.js"></script>
</head>
<body>
	<input type="button" value="Disconnect" onclick="disco()">
	<%
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://psqlserv/da2i","lamboisa","moi");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from client WHERE cno='" + session.getAttribute("id_client") + "'");
			rs.next();
	%>
	<div class="formulaire_connection_inscription" >
		<form method='POST' action='.././servlet/Update'>
			<div class="champ">
				<label>Nom : </label><br>
				<input type='text' name='nom' value='<%out.print(rs.getString("nom"));%>'><br>
			</div>
			<div class="champ">
				<label>Prénom : </label>
				<input type='text' name='prenom' value='<%if(rs.getString("prenom")!=null){out.print(rs.getString("prenom"));}%>'><br>
			</div>
			<div class="champ">
				<label>Adresse : </label>
				<input type='text' name='adresse' value='<% if(rs.getString("adresse")!=null){out.print(rs.getString("adresse"));}%>'><br>
			</div>
			<div class="champ">
				<label>Mot de passe : </label>
				<input type="password" name='passwd' value='<% out.print(rs.getString("mdp"));%>'><br>
			</div>
			<div class="champ">
				<label>Adresse Mail : </label>
				<input type="email" name='mail' value='<% out.print(rs.getString("mail"));%>'><br>
			</div>
			<div class="champ">
				<label>Date de Naissance : </label>
				<input type="date" name='date_naissance' value='<%if(rs.getString("datenaissance")!=null){ out.print(rs.getString("datenaissance"));}%>'><br>
			</div>
			<input type="submit" class="button" value="Mettre à jour">
		</form>
	</div>
	
		<%
				if(request.getParameter("modif")!=null && request.getParameter("modif").equals("false")){
		%>
				<center><h3>Modification erronée ! Cause :<%out.print(session.getAttribute("cause"));%></h3></center>
		<%
				}else if(request.getParameter("modif")!=null && request.getParameter("modif").equals("true")){
		%>
				<center><h3>Modification réussie !</h3></center>
		<%		
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				con.close();
			}
		%>
</body>
</html>