<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="java.util.*"%>
	<script src="main.js"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
	<%
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://psqlserv/da2i","lamboisa","moi");
			Statement stmt = con.createStatement();
	%>
	<form action="">
		<label>Test : </label>
		<input id="test">
	</form>
	<div class="res" id="res">
	</div>
	<script type="text/javascript">
		document.getElementById("test").onclick = function(e){
			document.getElementById("res").innerHTML = "";
			<%
				ResultSet rs = stmt.executeQuery("SELECT * FROM gare");
				String res = "<ul>";
				while(rs.next()){
					res+="<li><a onclick=\\\"setText(this)\\\">"+rs.getString("nom")+"-"+rs.getString("ville")+"</a></li>";  
				}
				res+="</ul>";
			%>
			text="<%out.print(res);%>";
			$(text).appendTo(".res");
			
		};
		function setText(e){
			document.getElementById("test").value=e.text;
		}
	</script>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
	%>
</body>
</html>