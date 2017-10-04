<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
	<head>
		<title>Test</title>
		<link href="style.css" rel="stylesheet">
	</head>
	<body style="background-color: grey">
	
	<div class="formulaire_trajet" id="form1">
			<form action="">
				<h1>Votre trajet</h1>
				
				<div class="champsForm">
					<input class="trajet" type="text" name="villeDep" placeholder="Ville de départ"><br>
					<input class="trajet" type="text" name="villeArrivee" placeholder="Ville d'arrivée"/><br>
				</div>
				
				<div class="champsForm">
					<input class="date" type="text" name="aller" placeholder="Aller"><br>
					<input class="date" type="text" name="retour" placeholder="Retour"/><br>
				</div>
				
				<input type="submit" value="Valider">
			</form>
		</div>
		
		<div class="formulaire_trajet" id="form2">
			<form action="">
				<h1>Votre trajet</h1>
				
				<div class="champsForm">
					<input class="trajet" type="text" name="villeDep" placeholder="Ville de départ"><br>
					<input class="trajet" type="text" name="villeArrivee" placeholder="Ville d'arrivée"/><br>
				</div>
				
				<div class="champsForm">
					<input class="date" type="text" name="aller" placeholder="Aller"><br>
					<input class="date" type="text" name="retour" placeholder="Retour"/><br>
				</div>
				
				<input type="submit" value="Valider">
			</form>
		</div>
		<script type="text/javascript" src="JavaScriptTest.js"></script>
	</body>

</html>