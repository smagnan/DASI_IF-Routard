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
	    System.out.println("Trace 1");
            List<Sejour> Sejours;
            List<Circuit> Circuits;
            List<Circuit> Circuits2 = ServiceVoyage.obtenirCircuits();
	    System.out.println("Trace 2");
            List<Sejour> Sejours2 = ServiceVoyage.obtenirSejours();
	    System.out.println("Trace 3");
            Sejours = new ArrayList<Sejour>();
            Circuits = new ArrayList<Circuit>();
	    if(Sejours2 != null)
	    {
		for(Sejour s1: Sejours2)
		{                   
		    if(s1.getDestination().getNom().equals(request.getParameter("pays")))
		    {
			   Sejours.add(s1);
		    }
		}
	    }
	    System.out.println("Trace 4");
	    if(Circuits2 != null)
	    {
		for(Circuit c1: Circuits2)
		{
		    if(c1.getDestination().getNom().equals(request.getParameter("pays")))
		    {
			   Circuits.add(c1);
		    }
		}
	    }
	    System.out.println("Trace 5");
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
                        <td>Superficie :</td>
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
	System.out.println("Trace Sejours 1");
	if(Sejours!=null)
	{
	    System.out.println("Trace Sejours 1A");
	    for(Sejour sej : Sejours)
	    {
		System.out.println("Trace Sejours 1B");
		List<Depart> Departs = sej.getDeparts();
		if(Departs!=null && Departs.size()>0) // important sinon si liste vide -> exception
		{
		    System.out.println("Trace Sejours 1C");
		    Depart d = Departs.get(0);
		    System.out.println("Trace Sejours 1C2");
		    float minprice = d.getPrix();
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
	    }
        }
	System.out.println("Trace Sejours 2");
        %>
        <%
	System.out.println("Trace Circuit 1");
	if(Circuits!=null)
	{
	    for(Circuit cir : Circuits)
	    {
		List<Depart> Departs = cir.getDeparts();
		if(Departs!=null && Departs.size()>0)
		{
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
	    }
        }
	System.out.println("Trace Circuit 2");
        %>
        </div>
    </body>
</html>
