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
	
	//request.getRequestDispatcher(vue).forward(request, response);
	
	try {
	    
	    /* TODO output your page here. You may use following sample code. */
	    out.println("<html>");
	    out.println("<head>");
	    out.println("<title>Action Servlet</title>");	    
	    out.println("</head>");
	    out.println("<body>");
	    out.println("<h1>Redirection...</h1>");
            out.println("<meta http-equiv=\"Refresh\" content=\"0;"+vue+"\">");
	    out.println("</body>");
	    out.println("</html>");
	    
	} finally {	    
	    out.close();
	}
    }
    // ------------------------------------------------------- Contrôleur: Actions
    private Action getAction(String todo){
	Action action = null;
        if(todo.equals("processInscrpition")){
	    action =new ActionInscription();
	}
	else if(todo.equals("processLogin")){
	    action = new ActionLogin();
	}
	else if(todo.equals("ajouterVoyage")){
            action = new ActionAddVoyage();
	}
        else if(todo.equals("ajouterPays")){
            action = new ActionAddPays();
	}
        else if(todo.equals("ajouterDepart")){
            action = new ActionAddDepart();
	}
        else if(todo.equals("ajouterDevis")){
            action = new ActionAddDevis();
	}
	else
	{
	    
	}
	return action;
    }
    
    // ------------------------------------------------------- Contrôleur: Vues
    private String setVue(HttpServletRequest request,String todo){
	String vue = null;
	if(todo.equals("processRecherche_Pays")){
	    System.out.println("----> A");
	    if(request.getParameter("voyages")!=null)
	    {
		vue = "ClientRecherche_Pays.jsp";
		System.out.println("----> B");
		HttpSession session = request.getSession();
		System.out.println("----> B A");
		session.setMaxInactiveInterval(20 * 60);
		System.out.println("----> B B");
		session.setAttribute( "listeVoyagesPays", request.getParameter("voyages"));
		System.out.println("----> C");
	    }
	    else
	    {
		System.out.println("----> B2");
		vue = "error.html";
	    }
	}
	else if(todo.equals("processRecherche_Type")){
	    vue = "ClientRecherche_Type.jsp";
	}
	else if(todo.equals("processInscrpition")){
	    Client client = (Client)request.getAttribute("client");
	    if(client!=null)
	    {
		vue = "ClientConnexion.jsp";   
	    }
	    else
	    {
		vue = "ClientInscription.jsp";
	    }
	}
	else if(todo.equals("processLogin")){
	    
	    Client client = (Client)request.getAttribute("client");
	    if((request.getAttribute("testPass").equals(true) || true) && client != null)
	    {
		
		// --------------------------- Mise en place de la session START
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(20 * 60);
		
		
		/*if(client != null)
		{*/
		session.setAttribute( "theName", client.getNomComplet() );
		session.setAttribute( "theClient", client);
                session.setAttribute( "EmailClient", client.getEmail());
		/*}
		else
		{
		    session.setAttribute( "theName", "<font color=\"red\">ERROR: no such client</font>" );
		}*/
		// ----------------------------- Mise en place de la session END
		
		// --------------------------------------------- choix de la vue
		vue = "ClientRecherche.jsp";
	    }
	    else
	    {
		vue = "error.html";
	    }
	}
        else if(todo.equals("ajouterVoyage")){
            vue = "/IFRoutardWeb/Employe/Voyage/EmployeModifierVoyageDepart.jsp?newDepart=false&modifDepart=false&type="+request.getParameter("type")+"&voyagemodifie="+request.getParameter("code");
        }
        else if(todo.equals("ajouterPays")){
            vue = "/IFRoutardWeb/Employe/Pays/index.jsp";
        }
        else if(todo.equals("ajouterDepart")){
            vue = "/IFRoutardWeb/Employe/Voyage/EmployeModifierVoyageDepart.jsp?newDepart=false&modifDepart=false&type="+request.getParameter("typeHidden")+"&voyagemodifie="+request.getParameter("voyagemodifieHidden");
        }
        else if(todo.equals("ajouterDevis")){
            vue = "ClientConfirmation.jsp?devis=true&type="+request.getParameter("typeSelect")+"&voyage="+request.getParameter("voyageSelect")+"&depart="+request.getParameter("departSelect")+"&nb="+request.getParameter("nb");
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