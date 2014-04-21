<%-- 
    Document   : ClientRecherche_Pays
    Created on : 17 avr. 2014, 12:51:23
    Author     : Administrateur
--%>
<%@page import="metier.service.ServiceVoyage"
	import="metier.modele.Depart"
        import="metier.modele.Pays"
        import="metier.modele.Circuit"
        import="metier.modele.Sejour"
        import="java.util.ArrayList"
	import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recherche | Voyages en <%=request.getParameter("pays")%></title>
    </head>
    <body>
        <%
            Pays pays = ServiceVoyage.obtenirPays(request.getParameter("pays"));
            List<Sejour> Sejours;
            List<Circuit> Circuits;
            List<Circuit> Circuits2 = ServiceVoyage.obtenirCircuits();
                List<Sejour> Sejours2 = ServiceVoyage.obtenirSejours();
                Sejours = new ArrayList<Sejour>();
                Circuits = new ArrayList<Circuit>();
                    for(Sejour s1: Sejours2)
                    {                   
                        if(s1.getDestination().getNom().equals(request.getParameter("pays")))
                                {
                                       Sejours.add(s1);
                                }
                    }
                for(Circuit c1: Circuits2)
                    {
                        if(c1.getDestination().getNom().equals(request.getParameter("pays")))
                                {
                                       Circuits.add(c1);
                                }
                    }
        %>
	<%@include file="headerClient.jsp" %>
	<input type="submit" style="float:left" name="retour" value="Retour"/>
        <h1 align="center">Voyages en <%=request.getParameter("pays")%></h1>  <br/>
        <div style="width:50%;display: block; height:320px; margin: 0 auto; margin-top: 55px;">
            <div style="width:50%; height: 306px;float:left" align="left"><img src="img/pays.jpg" heigh="100%" width="100%"></div>
            <div style="width:50%; height: 306px;float:right" align="center">
                <br><br>              
                <table style="font-size:20px;">
                    <tr>
                        <td>Capitale :</td>
                        <td><%=pays.getCapitale()%></td>
                    </tr>
                </table><br>
                <table style="font-size:20px;">
                    <tr>
                        <td>Population :</td>
                        <td><%=pays.getPopulation()%> habitants</td>
                    </tr>
                </table><br>
                <table style="font-size:20px;">    
                    <tr>
                        <td>Superficiel :</td>
                        <td><%=pays.getSuperficie()%> km2</td>
                    </tr>
                </table><br>
                <table style="font-size:20px;">    
                    <tr>
                        <td>Langue officiele :</td>
                        <td><%=pays.getLangue()%></td>
                    </tr>
                </table>
            </div>
        </div>
	<hr>
        <div style="width:70%;display: block; margin: 0 auto; margin-top: 55px;">
	<%
	for(Sejour sej : Sejours)
        {
            List<Depart> Departs = sej.getDeparts();
            float minprice = Departs.get(0).getPrix();
            for(Depart dep: Departs)
            {
                if(minprice>dep.getPrix())
                {
                    minprice=dep.getPrix();
                }
            }
        %>
        <fieldset>
            <legend><%=sej.getTitre()%></legend>
            <label style="float:right">Séjour | <%=sej.getNbJours()%> jours</label>
            <p><%=sej.getDescription()%></p>
            <br>
            <p style="float:right">A partir de <%=minprice%> € <input type="button" value="En savoir plus" onclick="self.location.href='ClientConfirmation.jsp?type=sejour&voyage=<%=sej.getCode()%>'"></p>
        </fieldset>
        <% 
        }
        %>
        <%
	for(Circuit cir : Circuits)
        {
            List<Depart> Departs = cir.getDeparts();
            float minprice = Departs.get(0).getPrix();
            for(Depart dep: Departs)
            {
                if(minprice>dep.getPrix())
                {
                    minprice=dep.getPrix();
                }
            }
        %>
        <fieldset>
            <legend><%=cir.getTitre()%></legend>
            <label style="float:right">Circuit | <%=cir.getNbJours()%> jours</label>
            <p><%=cir.getDescription()%></p>
            <br>
            <p style="float:right">A partir de <%=minprice%> € <input type="button" value="En savoir plus" onclick="self.location.href='ClientConfirmation.jsp?type=circuit&voyage=<%=cir.getCode()%>'"></p>
        </fieldset>
        <% 
        }
        %>
        </div>
    </body>
</html>
