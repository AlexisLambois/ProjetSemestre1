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
			<input type="submit" value="Cr�er un compte">
		</th>
	</table>
	<div class="hautDePageAccueil">
		<label><h1>R�servez vos billets de train</h1></label>
		<label><h3>Voyagez avec nous</h3></label>
		<div class="formulaire_trajet">
			<form action="">
				<table class="">
					<th>Votre trajet</th>			
				</table>
				<div class="champsForm">
					<input type="text" name="villeDep" placeholder="Ville de d�part"><br>
					<input type="text" name="villeArrivee" placeholder="Ville d'arriv�e"/><br>
				</div>
				<div class="champsForm">
					<input type="text" name="aller" placeholder="Aller"><br>
					<input type="text" name="retour" placeholder="Retour"/><br>
				</div>
				<input type="submit" value="Valider" class="boutonForm">
			</form>
		</div>
	</div>
	<table>
		<tr>
			<td class="image1"><img alt="" src="train2.jpg"></td>
			<td class="tdText">
				<h1>C'est simple et c'est tout</h1>
				<h3>Consultez les horaires de train et le prix des billets</h3>
			</td>
		</tr>
		<tr>
			<td class="tdText">test2</td>
		</tr>
	</table>
	

</body>
</html>