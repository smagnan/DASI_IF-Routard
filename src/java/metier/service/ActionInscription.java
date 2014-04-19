/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import metier.modele.Client;

/**
 *
 * @author Administrateur
 */
public class ActionInscription extends Action{
    
    protected static DateFormat CSV_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    
    public static Date parseDate(String date) {
		try {
			return CSV_DATE_FORMAT.parse(date);
		} catch (ParseException ex) {
			return new Date();
		}
	}
    
    @Override
    public void execute(HttpServletRequest request){
	
	String civiliteS =	    request.getParameter("civil");
	Client.Civilite civilite =  Client.Civilite.fromString(civiliteS);
	String nom =		    request.getParameter("name");
	String prenom =		    request.getParameter("surname");
	Date dateNaissance =	    parseDate(request.getParameter("date"));
	String adresse =	    request.getParameter("rue")+" "+request.getParameter("complement")+" "+request.getParameter("cp")+" "+request.getParameter("ville");
	String telephone =	    request.getParameter("tel");
	String email =		    request.getParameter("email");
	String motDePasse =	    request.getParameter("pass");

	Client client = null;
	if(motDePasse.equals(request.getParameter("confirm_pass")))
	{
	    client = new Client(nom, prenom, civilite, dateNaissance, telephone, email, adresse, motDePasse);
	    ServiceClient.creerClient(client);
	}
	else
	{}
	
	request.setAttribute("client", client);
	
    }
}
