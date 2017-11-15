
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/servlet/Search")
public class Search extends HttpServlet {
	
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession(true);
	    //session.setAttribute("gare1", req.getParameter("gare1"));
	    //session.setAttribute("gare2", req.getParameter("gare2"));
	    session.setAttribute("gare1", "Paris-Bercy");
	    session.setAttribute("gare2", "St-Florentin-Vergigny");
	    session.setAttribute("dateDep", req.getParameter("dateDep"));
	    session.setAttribute("dateRet", req.getParameter("dateRet"));
		res.sendRedirect("../html_css/search.jsp");
		
	}
	
}