/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import metier.modele.Client;

/**
 *
 * @author Administrateur
 */
@WebServlet(name = "ServletLoginClient", urlPatterns = {"/ServletLoginClient2"})
public class ServletLoginClient extends HttpServlet {

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
	   response.setContentType("text/html");
    //java.io.PrintWriter out = response.getWriter();
	   String email = request.getParameter("email");
	   String pass = request.getParameter("pass");
	   out.println("<html>");
	    out.println("<head>");
	    out.println("<title>Simple Session Tracker</title>");
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h2>"+email+"</h2>");
	    out.println("<h2>"+pass+"</h2>");
	    Client client = ServiceClient.obtenirClientParEmail(email);
	    /*String entree = "password";
	    out.println("<h2>"+client.getEmail()+"</h2>");
	     out.println("<h2>"+client.getNomComplet()+"</h2>");
	    out.println("<h2>"+client.getHashMotDePasse()+"</h2>");
	    out.println("<h2>"+String.format("%040x", new BigInteger(1, client.getHashMotDePasse().getBytes()))+"</h2>");
	    out.println("<h2>"+ServiceClient.chiffrerMotDePasse(pass)+"</h2>");
	    out.println("<h2>"+ServiceClient.testerMotDePasse(client, entree)+"</h2>");*/
	    	    
	   if(client!=null || ServiceClient.testerMotDePasse(client, pass))
	   {
	    HttpSession session = request.getSession();
	    out.println("<h2>Session Info</h2>");
	    out.println("session Id: " + session.getId() + "<br><br>");
	    out.println("The SESSION TIMEOUT period is "+ session.getMaxInactiveInterval() + " seconds.<br><br>");
	    out.println("Now changing it to 20 minutes.<br><br>");
	    session.setMaxInactiveInterval(20 * 60);
	    out.println("The SESSION TIMEOUT period is now "+ session.getMaxInactiveInterval() + " seconds.");  
	    session.setAttribute( "theName", client.getNomComplet() );
	    out.println("<a href=\"Testjsp.jsp\"");
	   }
	   else
	   {
	    out.println("<h2>Pass incorrect</h2>");
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
}
