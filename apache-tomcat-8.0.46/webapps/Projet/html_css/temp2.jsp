<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head >
	<title>Projet</title>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.util.*"%>
	<script src="main.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<link href="style.css" rel="stylesheet">
	<script src="js-webshim/minified/polyfiller.js"></script> 
</head>

<body class="styleBody">

	<table>
		<th>
			<input type="submit" value="Connexion" href="">
			<input type="submit" value="Créer un compte">
		</th>
	</table>
	
	<!-- HAUT DE PAGE ACCUEIL -->
	<div class="hautDePageAccueil">
		<h1>Réservez vos billets de train</h1>
		<h3>Voyagez avec nous</h3>	
	</div>
	
	<!--   FORMULAIRE TRAJET   -->
	<div class="formulaire_trajet">
		<form action="" class="ws-validate">
			<h1>Votre trajet</h1>
				
			<div class="champsForm">
				<input onkeyup="search(this)" onclick="search(this)" id="trajet1" type="text" name="villeDepart" placeholder="Ville départ" /><br><br>
				<input onkeyup="search(this)" onclick="search(this)" id="trajet2" type="text" name="villeArrivee" placeholder="Ville d'arrivée" /><br>
				<div id="listeVille"></div>
			</div>
			<div class="champsForm">
				<div class="form-row">
			        <label for="min">Date Départ</label><br>
			        <input class="min-today" id="min" type="date" placeholder="YYYY-MM-DD" data-date-split-input="false" />
	    		</div>
	    		<br>
				<div class="form-row">
			        <label for="min">Date Arrivé</label><br>
			        <input class="min-today" id="min" type="date" placeholder="YYYY-MM-DD" data-date-split-input="false" />
	    		</div>
    		</div>
			<input onclick="" type="button" value="Valider">
		</form>
	</div>
	<div id="choixRep" hidden="true">
	<h1> Les gares</h1>
	<div id="liste">
	</div>
	</div>
		<!-- FIN FORMULAIRE TRAJET -->
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
	
	<script language="JavaScript">

		<%
			String res = "<datalist id=\\\"ville\\\" >";
			ArrayList<String> list = new ArrayList<>();
			Connection con=null;
			
			try {
				
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://psqlserv/da2i","lamboisa","moi");
//				con = DriverManager.getConnection("jdbc:postgresql://localhost/da2i","lamboisa","moi");
				Statement stmt = con.createStatement();
				
				String query = "SELECT CONCAT_WS('-',nom,ville) FROM gare";
			
				ResultSet rs = stmt.executeQuery(query);
				
				while( rs.next() ){
					res+="<option value=\\\""+rs.getString(1)+"\\\">";
					list.add(rs.getString(1));
				}
				
				res+="</datalist>";
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		%>
		document.getElementById("listeVille").innerHTML="<%out.print(res);%>";
		
		var tab=new Array();
		
		<% for (int i=0; i<list.size(); i++) { %>
		tab[<%= i %>] = "<%= list.get(i) %>"; 
		<% } %>
		
		var string = "<ul>";
		tab.forEach(function(element) {
			string = string + "<li><a>" + element + "</a></li>";
		});
		string = string + "</ul>";
		
		initDate();
		
		document.onclick = function(e) {
			if(e.srcElement.id=="trajet1" || e.srcElement.id=="trajet2"){
				document.getElementById("choixRep").hidden=false;
			}else{
				document.getElementById("choixRep").hidden=true;
			}
		}
		
		function search(object){
			document.getElementById("liste").innerHTML = "";

			var temp = "<ul>";
			tab.forEach(function(element) {
				if(element.startsWith(object.value)){
					temp = temp + "<li onclick=\"recup(this,"+object.id+")\"><a>" + element + "</a></li>";
				}
			});
			temp = temp + "</ul>";
			
			$(temp).appendTo(document.getElementById("liste"));
			
		}
		
		function recup(string,id){
			document.getElementById(id.id).value=string.innerText;
		}
		
	</script>

</body>
</html>