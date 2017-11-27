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
	<script type="text/javascript" src="./calendar/js/jquery-1.8.3.min.js" charset="UTF-8"></script>
	<link href="final.css" rel="stylesheet">
</head>

<body>
	<div class="choix_trajet">
	<h1>Trajet disponible pour aller de : <%out.print(session.getAttribute("gare1"));%> à <%out.print(session.getAttribute("gare2"));%></h1>
	<%
		BddTools t = null;

		try{

			t = new BddTools("da2i");

			ArrayList<String> caddie = (ArrayList<String>)session.getAttribute("caddie");
			ArrayList<String> tab_trajet_id =  (ArrayList<String>)session.getAttribute("res");

			String temp = "";
			String[] tab_temp = null;
			LinkedHashMap<String,String> has = new LinkedHashMap<>();

			for(int i = 0 ; i < tab_trajet_id.size() ; i++){
				temp = t.toString("SELECT name,arrival_time FROM stop_times AS st INNER JOIN stops AS s ON st.stop_id=s.stop_id WHERE trajet_id='"+tab_trajet_id.get(i)+"';");
				String[] tab = temp.split("\\?");
				has = new LinkedHashMap<>();
				for(int j = 0 ; j < tab.length ; j++){
					tab_temp = (tab[j].split("%"));
					has.put(tab_temp[0],tab_temp[1]);
				}
				out.print("<div class=\"trajet_clic\" onclick=\"add("+tab_trajet_id.get(i)+")\" >");
				out.print("<h2>Trajet n°"+(i+1)+" : </h2>");
				out.print("<p>Départ : gare <span class=\"souligner_gras\">" + has.keySet().toArray()[0] + "</span> à <span class=\"souligner_gras\">" + has.get( has.keySet().toArray()[0]) + "</span><br>" );
				out.print("Arrivée : gare <span class=\"souligner_gras\">" + has.keySet().toArray()[has.size()-1] + "</span> à <span class=\"souligner_gras\">" + has.get( has.keySet().toArray()[has.size()-1]) + "</span><br>");
				out.print("Votre gare de départ : gare <span class=\"souligner_gras\">" + session.getAttribute("gare1") + "</span> à <span class=\"souligner_gras\">" + has.get(session.getAttribute("gare1")) + "</span><br>");
				out.print("Votre gare de arrivée : gare <span class=\"souligner_gras\">" + session.getAttribute("gare2") + "</span> à <span class=\"souligner_gras\">" + has.get(session.getAttribute("gare2")) + "</span></p>");
				out.print("<span class=\"buy\"><img src=\"images/caddie.png\"></span>");
				out.print("</div>");
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
			caddie.add(object);
		}
	</script>
</body>
</html>
