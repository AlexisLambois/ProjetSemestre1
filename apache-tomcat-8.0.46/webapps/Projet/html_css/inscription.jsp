<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="fr">
<head>

	<title>Projet</title>
	<link href="final.css" rel="stylesheet">
</head>
<body>
	
	<div class="formulaire_connection_inscription">

		<form method="POST" action=".././servlet/Inscription">
			
			<div class="champ">
				<label>Nom :</label><br/>
				<input type="text" name="nom"><br/>
			</div>
			<div class="champ">
				<label>Adresse mail :</label>
				<input type="email"id="mail" name="mail"><br/>
			</div>
			<div class="champ">
				<label>Mot de Passe :</label> 
				<input type="password" name="passwd"><br/>
			</div>
			<div class="champ">
				<label>Confirmation de Mot de Passe :</label> 
				<input type="password" name="passwd2"><br/>
			</div>
			<input type="submit" class="button">

		</form>

	</div>
	
</body>
</html>