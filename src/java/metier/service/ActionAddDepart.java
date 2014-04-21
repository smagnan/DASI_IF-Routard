/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package metier.service;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import metier.modele.Depart;
import metier.modele.Voyage;
import static util.LectureDonneesCsv.parseDate;

/**
 *
 * @author MinhHoang
 */
public class ActionAddDepart extends Action{
     @Override
    public void execute(HttpServletRequest request){
    String codeVoyage = request.getParameter("voyagemodifieHidden");
    Voyage voyage = ServiceVoyage.obtenirVoyageParCode(codeVoyage);
		
    Date dateDepart = parseDate(request.getParameter("date"));
    String ville = request.getParameter("ville");
    Float prix = Float.parseFloat(request.getParameter("prix"));
    String description = request.getParameter("description");
		
    Depart d = new Depart(prix, dateDepart, ville, description);
    voyage.addDepart(d);
    ServiceVoyage.creerDepart(d);
    }    
}
