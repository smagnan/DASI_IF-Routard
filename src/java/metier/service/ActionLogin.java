/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import metier.modele.Client;

/**
 *
 * @author Administrateur
 */
public class ActionLogin extends Action{
    
    public void execute(HttpServletRequest request){
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	Client client = ServiceClient.obtenirClientParEmail(email);
	boolean testPass = (client!=null)?ServiceClient.testerMotDePasse(client, pass):false;
	request.setAttribute("client", client);
	request.setAttribute("testPass", pass);
    }
}
