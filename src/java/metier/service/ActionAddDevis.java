/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package metier.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import metier.modele.Client;
import metier.modele.Conseiller;
import metier.modele.Depart;
import metier.modele.Devis;
import metier.modele.Voyage;

/**
 *
 * @author MinhHoang
 */
public class ActionAddDevis extends Action{
    @Override
    public void execute(HttpServletRequest request){
        Client client = ServiceClient.obtenirClientParEmail(request.getParameter("Email"));
        Voyage voy = ServiceVoyage.obtenirVoyageParCode(request.getParameter("voyageSelect"));
        List<Depart> Departs = voy.getDeparts();
        Depart depart = new Depart();
        for(Depart dep : Departs)
        {
            if(dep.getId().equals(Float.parseFloat(request.getParameter("departSelect"))))
            {
                depart = dep;
            }
        }
        int nbPersonnes = Integer.parseInt(request.getParameter("nb"));
        
        Conseiller specialiste = ServiceEmploye.obtenirSpecialiste(voy.getDestination());
        Devis devis = new Devis(client, depart, nbPersonnes, specialiste);
        ServiceDevis.creerDevis(devis);
    }
}
