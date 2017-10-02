<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="fr">
<head>

	<title>Projet</title>
	<link href="style.css" rel="stylesheet">
<!-- <meta http-equiv="refresh" content="1" > -->
</head>
<body>

	<div class="formulaire_connection_inscription" >
	
		<form method="POST" action=".././servlet/Connexion">
		
			<div class="champ">
				<label for="mail">Adresse mail :</label>
				<input type="email"id="mail" name="mail" required><br/>
			</div>
			<div class="champ">
				<label for="mdp">Mot de Passe :</label>
				<input type="password" id="mdp" name="mdp" required><br/>
			</div>
			<input type="submit" class="button"><br/>
		</form>
		<a href="./inscription.jsp">Pas de compte ?</a>
		
	</div>
	
</body>
</html>