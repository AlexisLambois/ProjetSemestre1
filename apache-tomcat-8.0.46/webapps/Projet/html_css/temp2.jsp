<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head >
	<title>Projet</title>
	<link href="style.css" rel="stylesheet">
</head>

<body class="styleBody">
	<table>
		<th>
			<input type="submit" value="Connexion">
			<input type="submit" value="Créer un compte">
		</th>
	</table>
	<!-- HAUT DE PAGE ACCUEIL -->
	<div class="hautDePageAccueil">
		<h1>Réservez vos billets de train</h1>
		<h3>Voyagez avec nous</h3>
		
		<!--   FORMULAIRE TRAJET   -->
		<div class="formulaire_trajet">
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
		<!-- FIN FORMULAIRE TRAJET -->
		
	</div>
	<!-- FIN HAUT DE PAGE ACCUEIL -->
	
	<!--  TABLEAU
	<table>
		<tr>
			<td class="image1"><img alt="" src="images/train2.jpg"></td>
			<td class="tdText">
				<h1>C'est simple et c'est tout</h1>
				<h3>Consultez les horaires de train et le prix des billets</h3>
			</td>
		</tr>
		<tr>
			<td class="tdText">test2</td>
		</tr>
	</table>
	FIN DE TABLEAU-->

</body>
</html>