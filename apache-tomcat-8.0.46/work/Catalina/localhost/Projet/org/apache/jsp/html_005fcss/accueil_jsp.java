/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.46
<<<<<<< HEAD
 * Generated at: 2017-10-03 09:46:57 UTC
=======
 * Generated at: 2017-10-03 06:41:19 UTC
>>>>>>> 78cd3e91fcaa936eabceea6325373f18e5dd2e55
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.html_005fcss;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

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
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
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
      response.setContentType("text/html; charset=ISO-8859-1");
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
      out.write("<head >\n");
      out.write("\t<title>Projet</title>\n");
      out.write("\t<link href=\"style.css\" rel=\"stylesheet\">\n");
      out.write("</head>\n");
<<<<<<< HEAD
      out.write("\n");
      out.write("<body class=\"styleBody\">\n");
      out.write("\t<table>\n");
      out.write("\t\t<th>\n");
      out.write("\t\t\t<input type=\"submit\" value=\"Connexion\">\n");
      out.write("\t\t\t<input type=\"submit\" value=\"Créer un compte\">\n");
      out.write("\t\t</th>\n");
      out.write("\t</table>\n");
      out.write("\t<div class=\"hautDePageAccueil\">\n");
      out.write("\t\t<label><h1>Réservez vos billets de train</h1></label>\n");
      out.write("\t\t<label><h3>Voyagez avec nous</h3></label>\n");
      out.write("\t\t<div class=\"formulaire_trajet\">\n");
      out.write("\t\t\t<form action=\"\">\n");
      out.write("\t\t\t\t<table class=\"\">\n");
      out.write("\t\t\t\t\t<th>Votre trajet</th>\t\t\t\n");
      out.write("\t\t\t\t</table>\n");
      out.write("\t\t\t\t<div class=\"champsForm\">\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"villeDep\" placeholder=\"Ville de départ\"><br>\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"villeArrivee\" placeholder=\"Ville d'arrivée\"/><br>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"champsForm\">\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"aller\" placeholder=\"Aller\"><br>\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"retour\" placeholder=\"Retour\"/><br>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<input type=\"submit\" value=\"Valider\" class=\"boutonForm\">\n");
      out.write("\t\t\t</form>\n");
      out.write("\t\t</div>\n");
=======
      out.write("\n");
      out.write("<!-- -------là -->\n");
      out.write("<body style=\"background-color: gray ;\" >\n");
      out.write("\n");
      out.write("\t<label><h1>Réservez vos billets de train</h1></label>\n");
      out.write("\t<label><h3>Voyagez avec nous</h3></label>\n");
      out.write("\t\n");
      out.write("\t<div class=\"formulaire_trajet\">\n");
      out.write("\t\n");
      out.write("\t\t<form action=\"\">\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<!-- -------là -->\n");
      out.write("\t\t\t<div class=\"divLabelForm\">\n");
      out.write("\t\t\t\t<label>Votre trajet </label><br>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"divChampsForm\">\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"villeDep\" placeholder=\"Ville de départ\"><br>\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"villeArrivee\" placeholder=\"Ville d'arrivée\"/><br>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"divChampsForm\">\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"aller\" placeholder=\"Aller\"><br>\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"retour\" placeholder=\"Retour\"/><br>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\t<!-- -------là -->\n");
      out.write("\t\t\t<div class=\"divBValider\">\n");
      out.write("\t\t\t\t<input type=\"submit\" value=\"Valider\">\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t\n");
      out.write("\t\t</form>\n");
      out.write("\t\t\n");
>>>>>>> 78cd3e91fcaa936eabceea6325373f18e5dd2e55
      out.write("\t</div>\n");
      out.write("\t<table>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td class=\"image1\"><img alt=\"\" src=\"train2.jpg\"></td>\n");
      out.write("\t\t\t<td class=\"tdText\">\n");
      out.write("\t\t\t\t<h1>C'est simple et c'est tout</h1>\n");
      out.write("\t\t\t\t<h3>Consultez les horaires de train et le prix des billets</h3>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td class=\"tdText\">test2</td>\n");
      out.write("\t\t</tr>\n");
      out.write("\t</table>\n");
      out.write("\t\n");
      out.write("\n");
      out.write("</body>\n");
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
