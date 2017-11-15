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
		ArrayList<ArrayList<String>> trajet_id = null;
		ArrayList<ArrayList<String>> service_id = null;
		ArrayList<ArrayList<String>> dispo = null;
		String date1_heure1 = (String)session.getAttribute("dateDep");
		String date1 = parseDate(date1_heure1);
		
		try {
			
			t = new BddTools("da2i");
			
			stop_id1 = t.toString("SELECT stop_id FROM stops WHERE name='"+session.getAttribute("gare1")+"' LIMIT 1;");
			stop_id2 = t.toString("SELECT stop_id FROM stops WHERE name='"+session.getAttribute("gare2")+"' LIMIT 1;");
			stop_id1 = stop_id1.substring(stop_id1.indexOf('E')+1,stop_id1.length()-2);
			stop_id2 = stop_id2.substring(stop_id2.indexOf('E')+1,stop_id2.length()-2);
			
			trajet_id = t.getRequest("SELECT st1.trajet_id FROM stop_times as st1 INNER JOIN stop_times as st2 ON st1.trajet_id=st2.trajet_id WHERE st1.stop_id LIKE'%"+stop_id1+"%' AND st2.stop_id LIKE '%"+stop_id2+"%';");
			service_id = new ArrayList<>();
			String temp="";
			ArrayList<String> list_temp = null;
			
			for(ArrayList<String> list: trajet_id){
				temp = t.toString("SELECT service_id FROM trajet WHERE trajet_id='"+list.get(0)+"';");
				list_temp = new ArrayList<String>();
				list_temp.add(temp.substring(0,temp.length()-2));
				service_id.add(list_temp);
			}
			
			dispo = new ArrayList<>();
		
			for(ArrayList<String> list: service_id){
				temp = t.toString("SELECT monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date FROM calendar WHERE service_id='"+list.get(0)+"';");
				list_temp = new ArrayList<String>();
				list_temp.add(temp.substring(0,temp.length()-2));
				dispo.add(list_temp);
			}
			
			
			
			for( int i = 0 ; i < trajet_id.size() ; i++ ){
				
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			t.fermer();
		}
		
		out.print(date1);
		out.print("<br>");
		out.print(stop_id1);
		out.print("<br>");
		out.print(stop_id2);
		out.print("<br>");
		out.print(trajet_id);
		out.print("<br>");
		out.print(service_id);
		out.print("<br>");
		out.print(dispo);
		out.print("<br>");
	%>
	
	<%!
		int subToInt(String string, int index1, int index2){
			return Integer.parseInt(string.substring(index1,index2));
		}
	
		String parseDate(String date){
			return date.substring(6,10)+"-"+date.substring(3,5)+"-"+date.substring(0,2);
		}
	%>
</body>
</html>