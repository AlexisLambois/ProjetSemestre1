/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
 * Generated at: 2017-11-15 08:47:54 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.html_005fcss;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;
import java.util.*;

public final class accueil_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("\t<title>Projet</title>\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t<script type=\"text/javascript\" src=\"main.js\"></script>\n");
      out.write("\n");
      out.write("\t<script src=\"js-webshim/minified/polyfiller.js\"></script>\n");
      out.write("\t\n");
      out.write("\t<link href=\"./calendar/css/bootstrap.min.css\" rel=\"stylesheet\" media=\"screen\">\n");
      out.write("\t<link href=\"./calendar/css/bootstrap-datetimepicker.css\" rel=\"stylesheet\" media=\"screen\">\n");
      out.write("\t\n");
      out.write("\t<script type=\"text/javascript\" src=\"./calendar/js/jquery-1.8.3.min.js\" charset=\"UTF-8\"></script>\n");
      out.write("\t<script type=\"text/javascript\" src=\"./calendar/js/bootstrap.min.js\"></script>\n");
      out.write("\t<script type=\"text/javascript\" src=\"./calendar/js/bootstrap-datetimepicker.js\" charset=\"UTF-8\"></script>\n");
      out.write("\t<script type=\"text/javascript\" src=\"./calendar/js/bootstrap-datetimepicker.fr.js\" charset=\"UTF-8\"></script>\n");
      out.write("\t\n");
      out.write("\t<link href=\"final.css\" rel=\"stylesheet\">\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("\t<header class=\"backGroundHeader\">\n");
      out.write("\t\t<nav class=\"menuAccueilHeader\">\n");
      out.write("\t\t\t<div class=\"containerMenu\">\n");
      out.write("\t\t\t\t<div class=\"logoMenuAccueil\">\n");
      out.write("\t\t\t\t\t<img src=\"images/logo.png\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"lienMenuAccueil\">\n");
      out.write("\t\t\t\t\t<a href=\"inscription.jsp\"><button>CREER UN COMPTE</button></a>\n");
      out.write("\t\t\t\t\t<a href=\"connection.jsp\"><button>SE CONNECTER</button></a>\n");
      out.write("\t\t\t\t\t<a href=\"#\">AIDE</a>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</nav>\n");
      out.write("\t\t<div class=\"containerHeader\">\n");
      out.write("\t\t\t<div class=\"pageAccueilRecherche\">\t\n");
      out.write("\t\t\t\t<h1>Réservez vos billets de train</h1>\n");
      out.write("\t\t\t\t<h3>Voyagez avec nous</h3>\t\n");
      out.write("\t\t\t\t<div class=\"formulaire_trajet\" >\n");
      out.write("\t\t\t\t\t<form>\t\t\t\n");
      out.write("\t\t\t\t\t\t<h1>Votre trajet</h1>\n");
      out.write("\t\t\t\t\t\t<div class=\"champsForm\">\n");
      out.write("\t\t\t\t\t\t\t<input onkeyup=\"search(this)\" onclick=\"search(this)\" id=\"trajet1\" type=\"text\" placeholder=\"Ville de départ\"><br>\n");
      out.write("\t\t\t\t\t\t\t<input onkeyup=\"search(this)\" onclick=\"search(this)\" id=\"trajet2\" type=\"text\" placeholder=\"Ville d'arrivée\"/><br>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"form-group\">\n");
      out.write("                \t\t\t<label class=\"col-md-2 control-label\">Date de départ</label>   \t\t\t\n");
      out.write("                \t\t\t<div class=\"input-group date form_datetime col-md-5\" data-date-format=\"dd MM yyyy HH:ii:ss p\">\n");
      out.write("                    \t\t\t<input class=\"form-control\" id=\"dateDep\" type=\"text\" value=\"\" readonly>\n");
      out.write("                   \t \t\t\t<span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-remove\"></span></span>\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-th\"></span></span>\n");
      out.write("                \t\t\t</div>\n");
      out.write("           \t\t\t\t</div>\n");
      out.write("           \t\t\t\t<div class=\"form-group\">\n");
      out.write("                \t\t\t<label class=\"col-md-2 control-label\">Date de retour</label>   \t\t\t\n");
      out.write("                \t\t\t<div class=\"input-group date form_datetime col-md-5\" data-date-format=\"dd MM yyyy HH:ii:ss p\">\n");
      out.write("                    \t\t\t<input class=\"form-control\" id=\"dateRet\" type=\"text\" value=\"\" readonly>\n");
      out.write("                   \t \t\t\t<span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-remove\"></span></span>\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-th\"></span></span>\n");
      out.write("                \t\t\t</div>\n");
      out.write("           \t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<input type=\"button\" onclick=\"send()\" value=\"Valider\">\n");
      out.write("\t\t\t\t\t\t<span id=\"error\" hidden>Mauvaise entré</span>\n");
      out.write("\t\t\t\t\t</form>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div id=\"choixRep\" hidden>\n");
      out.write("\t\t\t\t\t<h1> Les gares</h1>\n");
      out.write("\t\t\t\t\t<div id=\"liste\">\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</header>\n");
      out.write("\t\n");
      out.write("\t<script language=\"JavaScript\">\n");
      out.write("\t\tvar dateNow = new Date();\t\n");
      out.write("\t\n");
      out.write("\t\t$('.form_datetime').datetimepicker({\n");
      out.write("\t        language:  'fr',\n");
      out.write("\t        autoclose: true,\n");
      out.write("\t        todayBtn: true,\n");
      out.write("\t        pickerPosition: \"bottom-left\",\n");
      out.write("\t        minuteStep : 15,\n");
      out.write("\t        startDate: dateNow\n");
      out.write("\t    });\n");
      out.write("\n");
      out.write("\t\t");

			ArrayList<String> list = new ArrayList<>();
			Connection con=null;
			
			try {
				
				Class.forName("org.postgresql.Driver");
				//con = DriverManager.getConnection("jdbc:postgresql://psqlserv/da2i","lamboisa","moi");
				con = DriverManager.getConnection("jdbc:postgresql://localhost/da2i","lamboisa","moi");
				Statement stmt = con.createStatement();
				
				String query = "SELECT CONCAT_WS(' ? ',libelle,commune,fret) as concat FROM gare ORDER BY concat";
			
				ResultSet rs = stmt.executeQuery(query);
				
				while( rs.next() ){
					list.add(rs.getString(1));
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		
      out.write("\n");
      out.write("\t\t\n");
      out.write("\t\tvar tab=new Array();\n");
      out.write("\t\t\n");
      out.write("\t\t");
 for( int i=0 ; i<list.size() ; i++ ){ 
      out.write("\n");
      out.write("\t\t\ttab[");
      out.print( i );
      out.write("] = \"");
      out.print( list.get(i) );
      out.write("\";\n");
      out.write("\t\t");
 } 
      out.write("\n");
      out.write("\t\t\n");
      out.write("\t\tdocument.onclick = function(e) {\n");
      out.write("\t\t\tif(e.srcElement.id==\"trajet1\" || e.srcElement.id==\"trajet2\"){\n");
      out.write("\t\t\t\tdocument.getElementById(\"choixRep\").hidden=false;\n");
      out.write("\t\t\t}else{\n");
      out.write("\t\t\t\tdocument.getElementById(\"choixRep\").hidden=true;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t}\t\n");
      out.write("\t\t\n");
      out.write("\t\tfunction search(object){\n");
      out.write("\t\t\tdocument.getElementById(\"liste\").innerHTML = \"\";\n");
      out.write("\n");
      out.write("\t\t\tvar temp = \"<ul>\";\n");
      out.write("\t\t\ttab.forEach(function(element) {\n");
      out.write("\t\t\t\tif(element.includes(object.value)){\n");
      out.write("\t\t\t\t\ttemp = temp + \"<li onclick=\\\"recup(this,\"+object.id+\")\\\"><a>\" + element.substring(0,element.indexOf(\"?\")) + \" ( \" +  element.substring(element.indexOf(\"?\")+1, element.lastIndexOf(\"?\")) + \" ) \" + \"</a></li>\";\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t});\n");
      out.write("\t\t\ttemp = temp + \"</ul>\";\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t$(temp).appendTo(document.getElementById(\"liste\"));\n");
      out.write("\t\t\t\n");
      out.write("\t\t}\n");
      out.write("\t\t\n");
      out.write("\t\tfunction send(){\n");
      out.write("\t\t\n");
      out.write("\t\t\tvar dateDep = new Date(document.getElementById(\"dateDep\").value);\n");
      out.write("\t\t\tvar dateRet = new Date(document.getElementById(\"dateRet\").value);\n");
      out.write("\t\t\tdateDep.setSeconds(00);\n");
      out.write("\t\t\tdateRet.setSeconds(00);\n");
      out.write("\t\t\tvar value1 = null;\n");
      out.write("\t\t\tvar value2 = null;\n");
      out.write("\t\t\t\n");
      out.write("\t\t\ttab.forEach(function(element){\n");
      out.write("\t\t\t\tif(element.substring(0,element.indexOf(\"?\")-1).valueOf() == (document.getElementById(\"trajet1\").value.substring(0,document.getElementById(\"trajet1\").value.indexOf(\"(\")-1)).valueOf()){\n");
      out.write("\t\t\t\t\tvalue1 = element.substring(0,element.indexOf(\"?\")-1);\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t\tif(element.substring(0,element.indexOf(\"?\")-1).valueOf() == (document.getElementById(\"trajet2\").value.substring(0,document.getElementById(\"trajet2\").value.indexOf(\"(\")-1)).valueOf()){\n");
      out.write("\t\t\t\t\tvalue2 = element.substring(0,element.indexOf(\"?\")-1);\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t});\n");
      out.write("\t\t\tvar dateValide = (compareDate(dateDep,dateRet) == -1);\n");
      out.write("\n");
      out.write("\t\t\tif( value1 != \"\" && value2 != \"\" && dateDep != \"\" && dateRet != \"\" && value1 != null && value2 != null && dateValide ){\n");
      out.write("\t\t\n");
      out.write("\t\t\t\tdocument.location.href=\".././servlet/Search?dateDep=\"+dateDep.toLocaleString(\"fr-FR\", {hour12: false})+\"&dateRet=\"+dateRet.toLocaleString(\"fr-FR\", {hour12: false})+\"&gare1=\"+value1+\"&gare2=\"+value2;\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t}else{\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\tdocument.getElementById(\"error\").hidden = false;\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t}\n");
      out.write("\t\t}\n");
      out.write("\t\t\n");
      out.write("\t</script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
