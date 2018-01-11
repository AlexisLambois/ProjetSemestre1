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

  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

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
							<a href="connection.jsp?page=accueil"><button>SE CONNECTER</button></a>
				<% }else{ %>
							<a href=""><button>MON PANIER</button></a>
							<a href=".././servlet/Deconnexion?page=accueil"><button>DECONNECTION</button></a>
				<% } %>
			</div>
		</div>
	</nav>
	<div class="choix_trajet">
		<h1>Trajet dans le panier de : <%out.print(session.getAttribute("id_client"));%></h1>
		<%
		
			BddTools t = null;
			String[] tab;
			String[] tab_temp;
			String query = "";
			LinkedHashMap<String,String> has = new LinkedHashMap<>();
			
			try{
				
				t = new BddTools("da2i");
				
				ArrayList<ArrayList<String>> panier =  (ArrayList<ArrayList<String>>)session.getAttribute("panier");
				
				for( ArrayList<String> list : panier ){
					
					tab = list.get(1).split("%");
					
					if( tab.length == 3 ){
						
						query = t.toString("SELECT name,arrival_time FROM stop_times AS st INNER JOIN stops AS s ON st.stop_id=s.stop_id WHERE trajet_id='"+tab[0]+"';");
						
						String[] tab2 = query.split("\\?");
						has = new LinkedHashMap<>();
						
						for(int j = 0 ; j < tab2.length ; j++){
							tab_temp = (tab2[j].split("%"));
							has.put(tab_temp[0],tab_temp[1]);
						}
						
						out.print("<div class=\"trajet_clic\">");
						out.print("<h2>Trajet n°"+list.get(0)+" : </h2>");
						out.print("<p>Départ : gare <span class=\"souligner_gras\">" + has.keySet().toArray()[0] + "</span> à <span class=\"souligner_gras\">" + has.get( has.keySet().toArray()[0]) + "</span><br>" );
						out.print("Arrivée : gare <span class=\"souligner_gras\">" + has.keySet().toArray()[has.size()-1] + "</span> à <span class=\"souligner_gras\">" + has.get( has.keySet().toArray()[has.size()-1]) + "</span><br>");
						out.print("Votre gare de départ : gare <span class=\"souligner_gras\">" + tab[1] + "</span> à <span class=\"souligner_gras\">" + has.get(tab[1]) + "</span><br>");
						out.print("Votre gare de arrivée : gare <span class=\"souligner_gras\">" + tab[2] + "</span> à <span class=\"souligner_gras\">" + has.get(tab[2]) + "</span></p>");
						out.print("</div>");
						
					}else{
						
						query = t.toString("SELECT name,arrival_time FROM stop_times AS st INNER JOIN stops AS s ON st.stop_id=s.stop_id WHERE st.trajet_id='"+tab[0]+"';");
						
						String[] tab2 = query.split("\\?");
						has = new LinkedHashMap<>();
						
						for(int j = 0 ; j < tab2.length ; j++){
							tab_temp = (tab2[j].split("%"));
							has.put(tab_temp[0],tab_temp[1]);
						}
						
						query = t.toString("SELECT name,arrival_time FROM stop_times AS st INNER JOIN stops AS s ON st.stop_id=s.stop_id WHERE st.trajet_id='"+tab[2]+"';");
						LinkedHashMap<String,String> has2 = new LinkedHashMap<>();
						tab2 = query.split("\\?");
						
						for(int j = 0 ; j < tab2.length ; j++){
							tab_temp = (tab2[j].split("%"));
							has2.put(tab_temp[0],tab_temp[1]);
						}
						
						query = t.toString("SELECT name FROM stops WHERE stop_id='"+tab[1]+"';");
						query = query.substring(0,query.length()-2);
						
						out.print("<div class=\"trajet_clic\">");
						out.print("<h2>Trajet n°"+list.get(0)+" : </h2>");
						out.print("<p> Prendre train direction : <span class=\"souligner_gras\">" + has.keySet().toArray()[has.keySet().toArray().length-1] + "</span><br>");
						out.print("&nbsp Gare de départ : gare <span class=\"souligner_gras\">" + tab[3] + "</span> à <span class=\"souligner_gras\">" + has.get(tab[3]) + "</span><br>");
						out.print("&nbsp Descendre gare : <span class=\"souligner_gras\">" + query + "</span> à <span class=\"souligner_gras\">" + has.get(query) + "</span><br>");
						out.print("Continuer train direction : <span class=\"souligner_gras\">" + has2.keySet().toArray()[has2.keySet().toArray().length-1] + "</span><br>");
						out.print("&nbsp Reprendre gare : <span class=\"souligner_gras\">" + query + "</span> à <span class=\"souligner_gras\">" + has2.get(query) + "</span><br>");
						out.print("&nbsp Gare d'arrivée : gare <span class=\"souligner_gras\">" + tab[4] + "</span> à <span class=\"souligner_gras\">" + has2.get(tab[4]) + "</span></p>");
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
	  
	</script>

</body>

</html>
