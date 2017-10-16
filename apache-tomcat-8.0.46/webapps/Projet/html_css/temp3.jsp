<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head >
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Projet</title>
	<link href="style.css" rel="stylesheet">
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.util.*"%>
</head>

<body>
	<p><%out.print(request.getParameter("idgare1"));%></p>
	<% 
		Connection con=null;
	
		try {
			
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://psqlserv/da2i","lamboisa","moi");
			
			Statement stmt = con.createStatement();
			
			String query = "SELECT () FROM ligne WHERE ;";
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
	%>
	
	<script language="JavaScript">
		var gareDepart = "<%out.print(request.getParameter("idgare1"));%>";
		console.log(gareDepart);
	</script>
	
</body>
</html>