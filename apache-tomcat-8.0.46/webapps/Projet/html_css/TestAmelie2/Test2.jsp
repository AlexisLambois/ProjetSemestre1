<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
	<head>
		<title>Test Accueil</title>
		<link href="styleTest.css" rel="stylesheet">
	</head>
	<body class="bodyAccueil">
		<div id="pageAccueilRecherche">
			<div id="headerAccueil">
				<h1>HEADER Trajet</h1>
			</div>
			<h1>Réservez vos billets de train</h1>
			<h3>Voyagez avec nous</h3>
			
			
			<div class="formulaire_trajet" >
				<form  id="form1">
					<h1>form trajet</h1>
					
					<div class="champsForm">
						<input class="trajet" type="text" name="villeDep" placeholder="Ville de départ"><br>
						<input class="trajet" type="text" name="villeArrivee" placeholder="Ville d'arrivée"/><br>
					</div>
					
					<div class="champsForm">
						<input class="date" type="text" name="aller" placeholder="Aller"><br>
						<input class="date" type="text" name="retour" placeholder="Retour"/><br>
					</div>
					
					<input type="button" onclick="page()" value="Valider">
				</form>
			</div>

			<div class="formulaire_choix" >
				<form  id="form1">
					<h1>form choix</h1>
					
					<div class="champsForm">
						<input class="trajet" type="text" name="villeDep" placeholder="Ville de départ"><br>
						<input class="trajet" type="text" name="villeArrivee" placeholder="Ville d'arrivée"/><br>
					</div>
					
					<div class="champsForm">
						<input class="date" type="text" name="aller" placeholder="Aller"><br>
						<input class="date" type="text" name="retour" placeholder="Retour"/><br>
					</div>
					
					<input type="button" onclick="page()" value="Valider">
				</form>
			</div>
		</div><!-- fin pageAccueilRecherche -->
		
		<div id="pageAccueilBillet">
			<div id="headerAccueil">
				<h1>HEADER Billet</h1>
			</div>
			<h1>Votre trajet pour : [villeDepart] -> [villeArrivee]</h1>
			<div class="formulaire_billet" >
				<form  id="form2">
					<h1>form billet</h1>
					
					<div class="champsForm">
						<input class="trajet" type="text" name="villeDep" placeholder="Ville de départ"><br>
						<input class="trajet" type="text" name="villeArrivee" placeholder="Ville d'arrivée"/><br>
					</div>
					
					
					<div class="champsForm">
						<input class="date" type="text" name="aller" placeholder="Aller"><br>
						<input class="date" type="text" name="retour" placeholder="Retour"/><br>
					</div>
					
					<input type="button" onclick="page()" value="Valider">
				</form>
			</div>
		</div><!-- fin pageAccueilBillet -->
		
		<script type="text/javascript" src="JSTest.js"></script>
		<!--<script type="text/javascript">
		
		
		</script> -->
	</body>
</html>