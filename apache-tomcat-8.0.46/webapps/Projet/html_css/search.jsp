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
	
	<%
		BddTools t = null;
	
		try{
			
			t = new BddTools("da2i");
	
			ArrayList<String> tab_trajet_id =  (ArrayList<String> )session.getAttribute("res");
			
			for(String trajet_id: tab_trajet_id){
				out.print(t.toHtml("SELECT trajet_id,name,departure_time,arrival_time,num_sequence FROM stop_times AS st INNER JOIN stops AS s ON st.stop_id=s.stop_id WHERE trajet_id='"+trajet_id+"';"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			t.fermer();
		}
	%>
	
</body>
</html>