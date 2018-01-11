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
	<%@ page import="tool.BddTools"%>

	<script type="text/javascript" src="main.js"></script>
	<script src="js-webshim/minified/polyfiller.js"></script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script type="text/javascript" src="picker/src/wickedpicker.js"></script>
	<link rel="stylesheet" type="text/css" href="picker/src/wickedpicker.css" />

	<link href="final.css" rel="stylesheet">
</head>

<body>

	<header class="backGroundHeader">
		<nav class="menuAccueilHeader">
			<div class="containerMenu">
				<div class="logoMenuAccueil">
					<a href="accueil.jsp"><img src="images/logo.png"></a>
				</div>
				<div class="lienMenuAccueil">
		<% if(session.getAttribute("id_client") == null ){ %>
					<a href="inscription.jsp"><button>CREER UN COMPTE</button></a>
					<a href="connection.jsp?page=accueil"><button>SE CONNECTER</button></a>
		<% }else{ %>
					<a href=".././servlet/Panier"><button>MON PANIER</button></a>
					<a href=".././servlet/Deconnexion?page=accueil"><button>DECONNECTION</button></a>
		<% } %>
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
							<div class="form-group">
								<label>Date : </label>
	                			<div>
	                    			<input type="text" id="datepicker">
	                			</div>
	           				</div>
	           				<SELECT id="select" name="avant_apres" size="1">
	                			<option value="0" >Partir après
	                			<option value="1" >Arrivee après
	                			<option value="2" >Partir avant
	                			<option value="3" >Arrivee avant
                			</SELECT>
                			<div class="form-group">
                				<label>Heure : </label>
	                			<div>
	                    			<input type="text" id="timepicker">
	                			</div>
	           				</div>
                		</div>
						<input type="button" onclick="send()" value="Valider">
						<span id="error" hidden>Mauvaise entré</span>
					</form>
				</div>
				<div id="choixRep" hidden>
					<h1> Les gares</h1>
					<div id="liste">
					</div>
				</div>
			</div>
		</div>
	</header>
	<script language="JavaScript">
	  
		var dateNow = new Date();
		$('#timepicker').wickedpicker({
			 twentyFour: true,
			 title: 'Heure',
			 now: '0:00'
		});
	    $("#datepicker").datepicker({
	    	firstDay: 1,
	    	monthNames: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
	    	dayNamesMin: ['D','L', 'M', 'M', 'J', 'V', 'S'],
	    	weekHeader: 'Sem.',
	    	dateFormat: 'yy-mm-dd',
	        minDate: dateNow
	    });

		<%
			ArrayList<ArrayList<String>> list = null;
			BddTools t = null;

			try {

        t = new BddTools("da2i");
        list = t.getRequest("SELECT DISTINCT name FROM stops ORDER BY name");

			}catch(Exception e) {
    	   e.printStackTrace();
    	}finally{
    	   t.fermer();
    	}

		%>

		var tab=new Array();

		<% for( int i=0 ; i<list.size() ; i++ ){ %>
	     tab[<%= i %>] = "<%= list.get(i).get(0) %>";
		<% } %>

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
				if(element.includes(object.value)){
					temp = temp + "<li onclick=\"recup(this,"+object.id+")\"><a>" + element + "</a></li>";
				}
			});
			temp = temp + "</ul>";

			$(temp).appendTo(document.getElementById("liste"));

		}

		function send(){
			
			var value1 = null;
			var value2 = null;
			var temps = replaceAll(document.getElementById("timepicker").value," ","");
			var select = document.getElementById( "select" );
			select = ( select.options[ select.selectedIndex ].value );

			tab.forEach(function(element){
				if(element.valueOf() == (document.getElementById("trajet1").value).valueOf()){
					value1 = element;
				}
				if(element.valueOf() == (document.getElementById("trajet2").value).valueOf()){
					value2 = element;
				}
			});

			if( value1 != "" && value2 != "" && value1 != null && value2 != null && document.getElementById("datepicker").value != ""){
				var date = new Date(document.getElementById("datepicker").value);
				date.setSeconds(00);
				document.location.href=".././servlet/Search?date="+date.toLocaleString("fr-FR", {hour12: false})+"&gare1="+value1+"&gare2="+value2+"&temps="+temps+"&select="+select;
			
			}else{

				document.getElementById("error").hidden = false;

			}
		}
		
		function replaceAll(str, find, replace) {
		    return str.replace(new RegExp(find, 'g'), replace);
		}

	</script>

</body>

</html>
