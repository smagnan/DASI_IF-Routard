<%-- 
    Document   : ClientRecherche_Pays
    Created on : 17 avr. 2014, 12:51:23
    Author     : Administrateur
--%>
<%@page import="metier.service.ServiceVoyage"
	import="metier.modele.Voyage"
	import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recherche | Voyages en XXX</title>
    </head>
    <body>
	<%@include file="headerClient.jsp" %>
	<input type="submit" name="retour" value="Retour"/>
        <h1 align="center">Voyages en XXX</h1>  <br/>		
        <img src="img/temp.png">
        Infos pays 
	
	<hr>
	
	<%
	List<Voyage> voyages = (List<Voyage>)session.getAttribute("listeVoyagesPays");
	if(voyages!=null){
	    for(Voyage voys : voyages)
	    {
		out.println("<fieldset align=\"left\"><legend>"+voys.getTitre()+
			"</legend><p>Durée: XXX de "+voys.getNbJours()+"</p> <br/> <p>"+voys.getDescription()+
			"</p> <br/> Prix: ??? <br/> <input type=\"submit\" name=\""+voys.getCode()+
			"\" value=\"En Savoir plus\"/> </fieldset><br/><br/>");
	    }
	}
       %>

	</fieldset>
    </body>
</html>
