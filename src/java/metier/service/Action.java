/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package metier.service;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Administrateur
 */
public abstract class Action{
    protected ServiceClient serviceClient;
    protected ServiceVoyage serviceVoyage;
    protected ServiceDevis serviceDevis;
    protected ServiceEmploye serviceEmploye;

    public void setServiceClient(ServiceClient serviceClient) {
	this.serviceClient = serviceClient;
    }

    public void setServiceVoyage(ServiceVoyage serviceVoyage) {
	this.serviceVoyage = serviceVoyage;
    }

    public void setServiceDevis(ServiceDevis serviceDevis) {
	this.serviceDevis = serviceDevis;
    }

    public void setServiceEmploye(ServiceEmploye serviceEmploye) {
	this.serviceEmploye = serviceEmploye;
    }

    public abstract void execute(HttpServletRequest request);
}
