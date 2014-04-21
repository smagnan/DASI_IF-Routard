/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package metier.service;

import javax.servlet.http.HttpServletRequest;
import metier.modele.Pays;
import metier.modele.Circuit;
import metier.modele.Sejour;

/**
 *
 * @author MinhHoang
 */
public class ActionAddVoyage extends Action {
    @Override
    public void execute(HttpServletRequest request){
        String type = request.getParameter("type");
       
        if(type.equals("Circuit"))
        {
        String code = request.getParameter("code");
        String titre = request.getParameter("titre");
        Integer duree = Integer.parseInt(request.getParameter("duree"));
        String description = request.getParameter("description"); 
        String transport = request.getParameter("fiche");
        Float km = Float.parseFloat(request.getParameter("km"));
        String paysDestination = request.getParameter("paysDest");
        Pays destination = ServiceVoyage.obtenirPaysParCode(paysDestination);
        
        ServiceVoyage.creerVoyage(new Circuit(transport, km, code, titre, duree, description, destination));
        
        }
        else
        {
        String code = request.getParameter("code");
        String titre = request.getParameter("titre");
        Integer duree = Integer.parseInt(request.getParameter("duree"));
        String description = request.getParameter("description"); 
        String residence = request.getParameter("fiche");
        String paysDestination = request.getParameter("paysDest");
        Pays destination = ServiceVoyage.obtenirPaysParCode(paysDestination); 
        
        ServiceVoyage.creerVoyage(new Sejour(residence, code, titre, duree, description, destination));
        }
        
        
    }
}
