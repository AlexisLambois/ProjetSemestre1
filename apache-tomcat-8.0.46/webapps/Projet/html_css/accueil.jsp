<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Projet</title>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.util.*"%>
	<script type="text/javascript" src="main.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<link href="final.css" rel="stylesheet">
	<script src="js-webshim/minified/polyfiller.js"></script> 
</head>

<body>

	<header class="backGroundHeader">
		<nav class="menuAccueilHeader">
			<div class="containerMenu">
				<div class="logoMenuAccueil">
					<img src="images/logo.png">
				</div>
				<div class="lienMenuAccueil">
					<a href="inscription.jsp"><button>CREER UN COMPTE</button></a>
					<a href="connection.jsp"><button>SE CONNECTER</button></a>
					<a href="#">AIDE</a>
				</div>
			</div>
		</nav>
		<div class="containerHeader">
			<div class="pageAccueilRecherche">
				<h1>Réservez vos billets de train</h1>
				<h3>Voyagez avec nous</h3>
				<div class="formulaire_trajet" >
					<form>
						<h1>Votre trajet</h1>
						<div class="champsForm">
							<input onkeyup="search(this)" onclick="search(this)" id="trajet1" type="text" placeholder="Ville de départ"><br>
							<input onkeyup="search(this)" onclick="search(this)" id="trajet2" type="text" placeholder="Ville d'arrivée"/><br>
						</div>
						<div class="champsForm">
							<div class="form-row">
			        			<label for="min">Date Départ</label><br>
			       				<input class="min-today dateDep" id="min" type="date" placeholder="YYYY-MM-DD" data-date-split-input="false" />
	    					</div>
	    					<br>
							<div class="form-row">
						        <label for="min">Date Retour</label><br>
						        <input class="min-today dateRet" id="min" type="date" placeholder="YYYY-MM-DD" data-date-split-input="false" />
				    		</div>
						</div>
						<input type="button" onclick="send()" value="Valider">
						<span id="error" hidden>Mauvaise entré</span>
					</form>
				</div>
			</div>
			<div id="choixRep" hidden>
				<h1> Les gares</h1>
				<div id="liste">
				</div>
			</div>
		</div>
	</header>
	
	<script language="JavaScript">

		<%
			ArrayList<String> list = new ArrayList<>();
			Connection con=null;
			
			try {
				
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://psqlserv/da2i","lamboisa","moi");
				Statement stmt = con.createStatement();
				
				String query = "SELECT CONCAT_WS('-',nom,ville,gno) FROM gare";
			
				ResultSet rs = stmt.executeQuery(query);
				
				while( rs.next() ){
					list.add(rs.getString(1));
				}
				
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
		
		var tab=new Array();
		
		<% for( int i=0 ; i<list.size() ; i++ ){ %>
			tab[<%= i %>] = "<%= list.get(i) %>";
		<% } %>
		
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
					temp = temp + "<li onclick=\"recup(this,"+object.id+")\"><a>" +  element.substring(0, element.lastIndexOf("-")) + "</a></li>";
				}
			});
			temp = temp + "</ul>";
			
			$(temp).appendTo(document.getElementById("liste"));
			
		}
		
		function send(){
			var idgare1;
			var idgare2;
			var dateDep = (document.getElementsByClassName("dateDep")[0].value);
			var dateRet = (document.getElementsByClassName("dateRet")[0].value);
			
			tab.forEach(function(element){
				if( element.includes(document.getElementById("trajet1").value) ){
					idgare1 = element.substring(element.lastIndexOf("-")+1);
				}
				if( element.includes(document.getElementById("trajet2").value) ){
					idgare2 = element.substring(element.lastIndexOf("-")+1);
				}
			});
			
			var dateValide = (compareDate(dateDep,dateRet) == -1);

			if( document.getElementById("trajet1").value != "" && document.getElementById("trajet2").value != "" && dateDep !="" && dateArr !="" && idgare1 != undefined && idgare2 != undefined && dateValide ){
				
				window.location.href = "http://localhost:8080/Projet/html_css/search.jsp?idgare1="+idgare1+"&idgare2="+idgare2+"&dateDep="+dateDep+"&dateRet="+dateRet;
			
			}else{
				
				document.getElementById("error").hidden = false;
				
			}
		}
		
	</script>

</body>

</html>