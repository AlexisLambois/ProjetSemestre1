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
		String html = null;
		String date1 = request.getParameter("dateDep");
		String date2 = request.getParameter("dateRet");
		
		date1 = date1.substring(6,10)+"-"+date1.substring(3,5)+"-"+date1.substring(0,2)+" "+date1.substring(13, 21);
		
		try{
			t = new BddTools("da2i");
			html = t.toHtml("SELECT gare1.nom,gare1.ville,gare1.cp,gare2.nom,gare2.ville,gare2.cp,depart,duree,prix FROM trajet INNER JOIN ligne on trajet.lno = ligne.lno INNER JOIN gare AS gare1 ON ligne.gare_dep = gare1.gno INNER JOIN gare AS gare2 ON ligne.gare_arr = gare2.gno WHERE depart='"+date1+"' AND ligne.lno=(SELECT ligne.lno FROM ligne WHERE gare_dep="+request.getParameter("idgare1")+" AND gare_arr="+request.getParameter("idgare2")+")");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			t.fermer();
		}
	%>
	
	<div class="listeTrajet">
		<%out.print(html);%>
	</div>
	
	<%!
		int subToInt(String string, int index1, int index2){
			return Integer.parseInt(string.substring(index1,index2));
		}
	%>
</body>
</html>