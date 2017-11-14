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
	<%@ page import="tools.BddTools"%>
	<script src="main.js"></script>
	<script type="text/javascript" src="./calendar/js/jquery-1.8.3.min.js" charset="UTF-8"></script>
</head>

<body>
	
	<%
	
		BddTools t = null;
		String stop_id1 = null;
		String stop_id2 = null;
		
		try {
			t = new BddTools("da2i");
			stop_id1 = t.toString("SELECT stop_id FROM stops WHERE name='"+session.getAttribute("gare1")+"';");
			stop_id2 = t.toString("SELECT stop_id FROM stops WHERE name='"+session.getAttribute("gare2")+"';");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			t.fermer();
		}
		
		out.print(stop_id1);
		
	%>
	
	<%!
		int subToInt(String string, int index1, int index2){
			return Integer.parseInt(string.substring(index1,index2));
		}
	%>
</body>
</html>