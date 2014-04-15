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
import java.util.Date;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "ActionServlet", urlPatterns = {"/ActionServlet"})
public class ActionServlet extends HttpServlet {

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
	String tache = request.getParameter("todo");
	Action action = this.getAction(tache);
	action.execute(request);
	String vue = this.setVue(request,tache);
	request.getRequestDispatcher(vue).forward(request, response);
	try {
	    /* TODO output your page here. You may use following sample code. */
	    out.println("<html>");
	    out.println("<head>");
	    out.println("<title>Servlet ActionServlet</title>");	    
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Servlet ActionServlet at " + request.getContextPath() + "</h1>");
	    out.println("</body>");
	    out.println("</html>");
	} finally {	    
	    out.close();
	}
    }
    private Action getAction(String todo){
	Action action = null;
	if(todo.equals("")){
	    
	}
	else if(todo.equals("")){
	    
	}
	else if(todo.equals("processLogin")){
	    action = new ActionLogin();
	}
	else if(todo.equals("")){
	    
	}
	return action;
    }
    private String setVue(HttpServletRequest request,String todo){
	String vue = null;
	if(todo.equals("")){
	    
	}
	else if(todo.equals("")){
	    
	}
	else if(todo.equals("processLogin")){
	    if(request.getAttribute("testPass").equals(true) || true)
	    {
		vue = "ClientRecherche.jsp";
	    }else{}
	}
	else if(todo.equals("")){
	    
	}
	return vue;
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