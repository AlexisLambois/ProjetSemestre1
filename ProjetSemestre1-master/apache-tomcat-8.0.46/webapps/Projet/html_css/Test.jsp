<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
	<head>
		<title>Test</title>
		<link href="styleTest.css" rel="stylesheet">
	</head>
	<body>
	
	<div class="formulaire_trajet" >
			<form  id="form1">
				<h1>Votre trajet 1</h1>
				
				<div class="champsForm">
					<input class="trajet" type="text" name="villeDep" placeholder="Ville de départ"><br>
					<input class="trajet" type="text" name="villeArrivee" placeholder="Ville d'arrivée"/><br>
				</div>
				
				<div class="champsForm">
					<input class="date" type="text" name="aller" placeholder="Aller"><br>
					<input class="date" type="text" name="retour" placeholder="Retour"/><br>
				</div>
				
				<input type="button" onclick="truc()" value="Valider">
			</form>
		</div>
		
		<div class="formulaire_trajet" >
			<form  id="form2">
				<h1>Votre trajet 2</h1>
				
				<div class="champsForm">
					<input class="trajet" type="text" name="villeDep" placeholder="Ville de départ"><br>
					<input class="trajet" type="text" name="villeArrivee" placeholder="Ville d'arrivée"/><br>
				</div>
				
				<div class="champsForm">
					<input class="date" type="text" name="aller" placeholder="Aller"><br>
					<input class="date" type="text" name="retour" placeholder="Retour"/><br>
				</div>
				
				<input onclick="truc()" type="button" value="Valider">
			</form>
		</div>
		<script type="text/javascript" src="JSTest.js"></script>
		<script type="text/javascript">
		function truc(){
			console.log("sfd");
		}
		
// 		document.get ElementById("").onclick = function(e){
// 			console.log("coucou");	
// 		}
		
		</script>
	</body>

</html>