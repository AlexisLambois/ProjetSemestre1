<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
</head>

<body>
	<h1>Trajet disponible pour aller de : <%out.print(session.getAttribute("gare1"));%> à <%out.print(session.getAttribute("gare2"));%></h1>
	<%
		BddTools t = null;
	
		try{
			
			t = new BddTools("da2i");
	
			ArrayList<String> tab_trajet_id =  (ArrayList<String> )session.getAttribute("res");
			
			String temp = "";
			ArrayList<String> tab_temp = new ArrayList<>();
			
			//for(String trajet_id: tab_trajet_id){
				temp = t.toString("SELECT name,arrival_time FROM stop_times AS st INNER JOIN stops AS s ON st.stop_id=s.stop_id WHERE trajet_id='"+tab_trajet_id.get(0)+"';");
				String[] tab = temp.split("\\?");
				tab_temp.add(tab[0]);
				tab_temp.add(tab[tab.length-1]);
				out.print(tab_temp.get(0).split("%")[0]+"</td><td>"+tab_temp.get(0).split("%")[1]+"</td></tr></table>");
			//}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			t.fermer();
		}
	%>
	
</body>
</html>