<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head >
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Projet</title>
	<link href="final.css" rel="stylesheet">
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="tool.BddTools"%>
	<script src="main.js"></script>
	<link href="final.css" rel="stylesheet">
</head>

<body>
	<nav class="menuAccueilHeader">
		<div class="containerMenu">
			<div class="logoMenuAccueil">
				<a href="accueil.jsp"><img src="images/logo.png"></a>
			</div>
			<div class="lienMenuAccueil">
				<% if(session.getAttribute("id_client") == null ){ %>
							<a href="inscription.jsp"><button>CREER UN COMPTE</button></a>
							<a href="connection.jsp?page=search"><button>SE CONNECTER</button></a>
				<% }else{ %>
							<a href=".././servlet/Panier"><button>MON PANIER</button></a>
							<a href=".././servlet/Deconnexion?page=search"><button>DECONNECTION</button></a>
				<% } %>
			</div>
		</div>
	</nav>
	<div class="choix_trajet">
	<h1>Trajet disponible pour aller de : <%out.print(session.getAttribute("gare1"));%> à <%out.print(session.getAttribute("gare2"));%></h1>
	<%
		BddTools t = null;

		try{

			t = new BddTools("da2i");

			ArrayList<String> tab_trajet_id =  (ArrayList<String>)session.getAttribute("res");

			String temp = "";
			String[] tab_temp = null;
			LinkedHashMap<String,String> has = new LinkedHashMap<>();

			for(int i = 0 ; i < tab_trajet_id.size() ; i++){
				
				String[] data = tab_trajet_id.get(i).split("\\%");
				
				if(data.length == 1){
			
					temp = t.toString("SELECT name,arrival_time FROM stop_times AS st INNER JOIN stops AS s ON st.stop_id=s.stop_id WHERE trajet_id='"+tab_trajet_id.get(i)+"';");
					
					String[] tab = temp.split("\\?");
					has = new LinkedHashMap<>();
					
					for(int j = 0 ; j < tab.length ; j++){
						tab_temp = (tab[j].split("%"));
						has.put(tab_temp[0],tab_temp[1]);
					}
					
					out.print("<div class=\"trajet_clic\" onclick=\"add('"+tab_trajet_id.get(i)+"%"+session.getAttribute("gare1")+"%"+session.getAttribute("gare2")+"%"+session.getAttribute("date")+"')\" >");
					out.print("<h2>Trajet n°"+(i+1)+" : </h2>");
					out.print("<p>Départ : gare <span class=\"souligner_gras\">" + has.keySet().toArray()[0] + "</span> à <span class=\"souligner_gras\">" + has.get( has.keySet().toArray()[0]) + "</span><br>" );
					out.print("Arrivée : gare <span class=\"souligner_gras\">" + has.keySet().toArray()[has.size()-1] + "</span> à <span class=\"souligner_gras\">" + has.get( has.keySet().toArray()[has.size()-1]) + "</span><br>");
					out.print("Votre gare de départ : gare <span class=\"souligner_gras\">" + session.getAttribute("gare1") + "</span> à <span class=\"souligner_gras\">" + has.get(session.getAttribute("gare1")) + "</span><br>");
					out.print("Votre gare de arrivée : gare <span class=\"souligner_gras\">" + session.getAttribute("gare2") + "</span> à <span class=\"souligner_gras\">" + has.get(session.getAttribute("gare2")) + "</span></p>");
					out.print("<span class=\"buy\"><img src=\"images/caddie.png\"></span>");
					out.print("</div>");
					
				}else{
					
					temp = t.toString("SELECT name,arrival_time FROM stop_times AS st INNER JOIN stops AS s ON st.stop_id=s.stop_id WHERE st.trajet_id='"+data[0]+"';");
					
					String[] tab = temp.split("\\?");
					has = new LinkedHashMap<>();
					
					for(int j = 0 ; j < tab.length ; j++){
						tab_temp = (tab[j].split("%"));
						has.put(tab_temp[0],tab_temp[1]);
					}
					
					temp = t.toString("SELECT name,arrival_time FROM stop_times AS st INNER JOIN stops AS s ON st.stop_id=s.stop_id WHERE st.trajet_id='"+data[2]+"';");
					LinkedHashMap<String,String> has2 = new LinkedHashMap<>();
					tab = temp.split("\\?");
					
					for(int j = 0 ; j < tab.length ; j++){
						tab_temp = (tab[j].split("%"));
						has2.put(tab_temp[0],tab_temp[1]);
					}
					
					temp = t.toString("SELECT name FROM stops WHERE stop_id='"+data[1]+"';");
					temp = temp.substring(0,temp.length()-2);
					out.print("<div class=\"trajet_clic\" onclick=\"add('"+tab_trajet_id.get(i)+"%"+session.getAttribute("gare1")+"%"+session.getAttribute("gare2")+"%"+session.getAttribute("date")+"')\" >");
					out.print("<h2>Trajet n°"+(i+1)+" : </h2>");
					out.print("<p> Prendre train direction : <span class=\"souligner_gras\">" + has.keySet().toArray()[has.keySet().toArray().length-1] + "</span><br>");
					out.print("&nbsp Gare de départ : gare <span class=\"souligner_gras\">" + session.getAttribute("gare1") + "</span> à <span class=\"souligner_gras\">" + has.get(session.getAttribute("gare1")) + "</span><br>");
					out.print("&nbsp Descendre gare : <span class=\"souligner_gras\">" + temp + "</span> à <span class=\"souligner_gras\">" + has.get(temp) + "</span><br>");
					out.print("Continuer train direction : <span class=\"souligner_gras\">" + has2.keySet().toArray()[has2.keySet().toArray().length-1] + "</span><br>");
					out.print("&nbsp Reprendre gare : <span class=\"souligner_gras\">" + temp + "</span> à <span class=\"souligner_gras\">" + has2.get(temp) + "</span><br>");
					out.print("&nbsp Gare d'arrivée : gare <span class=\"souligner_gras\">" + session.getAttribute("gare2") + "</span> à <span class=\"souligner_gras\">" + has2.get(session.getAttribute("gare2")) + "</span></p>");
					out.print("<span class=\"buy\"><img src=\"images/caddie.png\"></span>");
					out.print("</div>");
					
				}
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			t.fermer();
		}
	%>
	</div>
	<script language="JavaScript">
		function add(object){
			var r = confirm("Valider le ticket !");
			if (r == true) {
				if( "<%=session.getAttribute("id_client")%>" != "null" ){
					var tab = object.split("%");
					document.location.href=".././servlet/Insert?object="+tab;
				}else{
					alert("Vous n'êtes pas connecté ! ");
				}
			}
		}
	</script>
</body>
</html>
