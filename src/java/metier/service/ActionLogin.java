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
    @Override
    public void execute(HttpServletRequest request){
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	Client client = ServiceClient.obtenirClientParEmail(email);
	boolean testPass = ServiceClient.testerMotDePasse(client, pass);
	request.setAttribute("Client", client);
	request.setAttribute("testPass", testPass);
    }
}
