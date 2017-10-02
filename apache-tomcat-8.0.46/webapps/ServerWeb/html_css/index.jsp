<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<title>Serveur de Test</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link href="style.css" rel="stylesheet">
</head>
<body>

	<div class="page-header">
		<h1>Bienvenue</h1>
	</div>

	<!-- Formulaire de inscription -->

	<table class="tab_co">
		<tr>
			<th><h2>S'inscrire ?</h2></th>
		</tr>
		<form method="POST" action=".././servlet/Inscription">
			<tr>
				<td><label for="login" class="control-label">Login :</label>
					<input type="text" class="control-input" id="inscr_false" name="login" required>
				</td>
			</tr>
			<tr>
				<td><label for="mdp" class="control-label">Mot de Passe :</label>
				<input type="password" class="control-input" id="inscr_false" name="mdp" required></td>
			</tr>
			<tr>
				<td><label for="login" class="control-label">Confirmation de Mot de Passe :</label>
				<input type="password" class="control-input" id="inscr_false" name="mdp2" required></td>
			</tr>
			<tr>
				<td><input type="submit" class="button"></td>
			</tr>
		</form>
	</table>
	
	<!-- Vérification de réussite -->
	
	<%if(request.getParameter("inscr")!=null && !(request.getParameter("inscr").equals("0"))) {%>
		<style>#inscr_false{border: 2px solid red;}</style>
		<center><h3>
			Erreur identifiants Cause :
			<%if(request.getParameter("inscr").equals("1")){out.print(" Mot de passe 1 et 2 non-identique");}%>
			<%if(request.getParameter("inscr").equals("2")){out.print(" Caractères non-alphanumérique du login");}%>
			<%if(request.getParameter("inscr").equals("3")){out.print(" Login déjà existant");}%>
		</h3></center>
	<%}%>
	<%if(request.getParameter("inscr")!=null && request.getParameter("inscr").equals("0")){%>
		<center><h3>Inscription réussie, Vous pouvez vous connecter !</h3></center>
		<style>#auth_false{border: 2px solid green;}</style>
	<%}%>
	
	<!-- Formulaire de connection -->
	
	<table class="tab_co">
		<tr>
			<th><h2>Déjà Inscrit ?</h2></th>
		</tr>
		<form method="POST" action=".././servlet/Connexion">
			<tr>
				<td><label for="login" class="control-label">Login :</label>
				<input type="text" class="control-input" id="auth_false" name="login" required></td>
			</tr>
			<tr>
				<td><label for="mdp" class="control-label">Mot de Passe :</label>
				<input type="password" class="control-input" id="auth_false" name="mdp" required></td>
			</tr>
			<tr>
				<td><input type="submit" class="button"></td>
			</tr>
		</form>
	</table>
	
	<!-- Vérification de réussite -->
	
	<%if (request.getParameter("auth") != null) {%><style>#auth_false{border: 2px solid red;}</style><center><h3>Erreur identifiants</h3></center><%}%>

</body>
</html>