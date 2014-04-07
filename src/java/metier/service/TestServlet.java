/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier.service;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import metier.modele.Conseiller;

/**
 *
 * @author Administrateur
 */
@WebServlet(name = "TestServlet", urlPatterns = {"/TestServlet"})
public class TestServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter out = response.getWriter();
	try {
	    /* TODO output your page here. You may use following sample code. */
	    out.println("<html>");
	    out.println("<head>");
	    out.println("<title>Servlet TestServlet</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet TestServlet at " + request.getContextPath() + "</h1>");

	    out.println("</br>");

	    // Combobox + textField
	    out.println("<input type=text list=browsers >");
	    out.println("<datalist id=browsers >");
	    out.println("\t<option> Google");
	    out.println("\t<option> IE9");
	    out.println("\t</datalist>");

	    out.println("</br>");

	    // Combobox
	    out.println("<select name=\"ma_liste\" id=\"ma_liste\" size=\"1\"> ");
	    out.println("\t<option value=\"1\">M.</option>");
	    out.println("\t<option value=\"2\">Mme.</option>");
	    out.println("\t<option value=\"3\">Mlle.</option> ");
	    out.println("</select>");

	    out.println("</br>");

	    // Text Field
	    out.println("<input type=\"text\" name=\"nom\" />");
	    
	    String user = request.getParameter("name");
	    String civil = request.getParameter("civil");
	    trace(response,user);
	    trace(response,civil);

	    out.println("<h2> Conseillers </h2>");
	    List<Conseiller> conseillers = ServiceEmploye.obtenirConseillers();
	    for(Conseiller cons : conseillers)
	    {
		out.println("<p> Test: "+cons.getNom()+"</p>");
	    }
	    out.println("</body>");
	    out.println("</html>");
	} finally {
	    out.close();
	}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
	String user = request.getParameter("pseudo");
	trace(response,user);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>
    
    private void trace(HttpServletResponse resp, String msg)
			throws IOException {
	    PrintWriter out = resp.getWriter();
	    out.println("<html>");
	    out.println("<body>");
	    out.println("<t1>" + msg + "</t1>");
	    out.println("</body>");
	    out.println("</html>");
    }
}
