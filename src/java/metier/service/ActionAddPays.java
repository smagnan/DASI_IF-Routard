/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package metier.service;

import javax.servlet.http.HttpServletRequest;
import metier.modele.Pays;

/**
 *
 * @author MinhHoang
 */
public class ActionAddPays extends Action{
    @Override
    public void execute(HttpServletRequest request){
        String nom = request.getParameter("nom");
        String code = request.getParameter("code");
        String region = request.getParameter("continent");
        String capitale = request.getParameter("capitale");
        String langues = request.getParameter("langue");
        Integer superficie = (int)Float.parseFloat(request.getParameter("superficiel"));
        Float populationF = Float.parseFloat(request.getParameter("population"));
        Integer population = (int)(populationF * 1000);
        String regime = request.getParameter("regime");
        ServiceVoyage.creerPays(new Pays(code, nom, region, regime, superficie, population, langues, capitale));
    }
}
