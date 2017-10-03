<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Projet</title>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.util.*"%>
</head>
<body>
	<%
		Connection con = null
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost/postgres", "postgres", "root");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from client WHERE cno='" + session.getAttribute("compte") + "'");
			rs.next();
	%>
	<table>
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