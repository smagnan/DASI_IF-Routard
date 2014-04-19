/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import metier.modele.Voyage;

/**
 *
 * @author Administrateur
 */
public class ActionRecherche_Pays extends Action{
    
     @Override
    public void execute(HttpServletRequest request){
	 
	 List<Voyage> voyages = ServiceVoyage.obtenirVoyagesParPays(request.getParameter("pays"));
	 request.setAttribute("listVoyages", voyages);
     }
    
}
