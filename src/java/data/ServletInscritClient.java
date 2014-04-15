/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import metier.modele.Client;
import java.util.Date;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Administrateur
 */
@WebServlet(name = "ServletInscritClient", urlPatterns = {"/ServletInscritClient2"})
public class ServletInscritClient extends HttpServlet {

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
    
    protected static DateFormat CSV_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    
    public static Date parseDate(String date) {
		try {
			return CSV_DATE_FORMAT.parse(date);
		} catch (ParseException ex) {
			return new Date();
		}
	}
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter out = response.getWriter();
	try {
	    /* TODO output your page here. You may use following sample code. */
	    String civiliteS = request.getParameter("civil");
		Client.Civilite civilite = Client.Civilite.fromString(civiliteS);
		String nom = request.getParameter("name");
		String prenom = request.getParameter("surname");
		Date dateNaissance = parseDate(request.getParameter("date"));
		String adresse = request.getParameter("rue")+" "+request.getParameter("complement")+" "+request.getParameter("cp")+" "+request.getParameter("ville");
		String telephone = request.getParameter("tel");
		String email = request.getParameter("email");
		String motDePasse = request.getParameter("pass");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Redirect</title>");	    
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Redirecting ...</h1>");
		out.println("</body>");
		out.println("</html>");
		
		if(motDePasse.equals(request.getParameter("confirm_pass")))
		{
		    Client client = new Client(nom, prenom, civilite, dateNaissance, telephone, email, adresse, motDePasse);
		    ServiceClient.creerClient(client);
		    RequestDispatcher dispatcher = request.getRequestDispatcher("ClientConnexion.jsp");
		    dispatcher.forward(request, response);
		}
		else
		{
		    RequestDispatcher dispatcher = request.getRequestDispatcher("ClientInscription.jsp");
		    dispatcher.forward(request, response);   
		}
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
