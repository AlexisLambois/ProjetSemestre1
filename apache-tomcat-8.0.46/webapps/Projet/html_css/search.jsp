<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head >
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Projet</title>
	<link href="final.css" rel="stylesheet">
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="tools.BddTools"%>
</head>

<body>
	<%
		BddTools t = null;
	
		
	
		try{
			t = new BddTools("da2i");
			t.getRequest("SELECT * FROM trajet WHERE depart='"+datetimeDep+"' AND lno=(SELECT lno FROM ligne WHERE gare_dep="+request.getParameter("idgare1")+" AND gare_arr="+request.getParameter("idgare2")+")");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			t.fermer();
		}
		
	%>
	
	<script language="JavaScript">
	</script>
	
</body>
</html>