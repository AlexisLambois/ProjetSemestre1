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

	<link href="./calendar/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="./calendar/css/bootstrap-datetimepicker.css" rel="stylesheet" media="screen">

	<script type="text/javascript" src="./calendar/js/jquery-1.8.3.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="./calendar/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./calendar/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="./calendar/js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>

	<link href="final.css" rel="stylesheet">
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
						<div class="form-group">
                			<label class="col-md-2 control-label">Date de départ</label>
                			<div class="input-group date form_datetime col-md-5" data-date-format="dd MM yyyy HH:ii:ss p">
                    			<input class="form-control" id="dateDep" type="text" value="" readonly>
                   	 			<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                			</div>
           				</div>
           				<div class="form-group">
                			<label class="col-md-2 control-label">Date de retour</label>
                			<div class="input-group date form_datetime col-md-5" data-date-format="dd MM yyyy HH:ii:ss p">
                    			<input class="form-control" id="dateRet" type="text" value="" readonly>
                   	 			<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
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

		$('.form_datetime').datetimepicker({
	        language:  'fr',
	        autoclose: true,
	        todayBtn: true,
	        pickerPosition: "bottom-left",
	        minuteStep : 15,
	        startDate: dateNow
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

			var dateDep = new Date(document.getElementById("dateDep").value);
			var dateRet = new Date(document.getElementById("dateRet").value);
			dateDep.setSeconds(00);
			dateRet.setSeconds(00);
			var value1 = null;
			var value2 = null;

			tab.forEach(function(element){
				if(element.valueOf() == (document.getElementById("trajet1").value).valueOf()){
					value1 = element;
				}
				if(element.valueOf() == (document.getElementById("trajet2").value).valueOf()){
					value2 = element;
				}
			});
			var dateValide = (compareDate(dateDep,dateRet) == -1);

			if( value1 != "" && value2 != "" && dateDep != "" && dateRet != "" && value1 != null && value2 != null && dateValide ){

				document.location.href=".././servlet/Search?dateDep="+dateDep.toLocaleString("fr-FR", {hour12: false})+"&dateRet="+dateRet.toLocaleString("fr-FR", {hour12: false})+"&gare1="+value1+"&gare2="+value2;
				//document.location.href=".././servlet/Search?dateDep="+dateDep.toLocaleString("fr-FR", {hour12: false})+"&dateRet="+dateRet.toLocaleString("fr-FR", {hour12: false})+"&gare1=Paris-Bercy&gare2=St-Florentin-Vergigny";
			}else{

				document.getElementById("error").hidden = false;

			}
		}

	</script>

</body>

</html>
