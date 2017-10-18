<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html5>

<html>
	<head>
		<title>Test Accueil</title>
		<link href="style.css" rel="stylesheet">
	</head>	
	<body class="bodyAccueil">
		<header class="backGroundHeader">
			<!-- DEBUT MENU -->
			<nav class="menuAccueilHeader">
				<div class="containerMenu">
					<!-- <div class="logoMenuAccueil">
						<img src="images/">
					</div>-->
					<div class="lienMenuAccueil">
	                       <a><button>CREER UN COMPTE</button></a>
	                       <a><button>SE CONNECTER</button></a>
	                       <a href="#">AIDE</a>
					</div>
				</div>
			</nav>
			<!-- FIN MENU -->
			<div class="containerHeader">
				<!-- DEBUT PAGE RECHERCHE -->
				<div class="pageAccueilRecherche">
					<h1>Réservez vos billets de train</h1>
					<h3>Voyagez avec nous</h3>
					<div class="formulaire_trajet" >
						<form  id="form1">
							<h1>Votre trajet</h1>
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
				</div>
				<!-- FIN PAGE RECHERCHE -->
				<!-- DEBUT PAGE BILLET -->
				<div class="pageAccueilBillet">
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
				</div>
				<!-- FIN PAGE BILLET -->
			</div>
		</header>
		<script type="text/javascript" src="JavaScript.js"></script>
	</body>
</html>