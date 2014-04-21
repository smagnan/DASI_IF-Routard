<%-- 
    Document   : ClientRecherche_Type
    Created on : 17 avr. 2014, 12:51:00
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
    <%
        List<Circuit> Circuits = ServiceVoyage.obtenirCircuits();;
        List<Sejour> Sejours = ServiceVoyage.obtenirSejours();
        String type = request.getParameter("type");
        boolean circuit=true;
        if(type.equals("Circuit"))
        {
            circuit=true;
        }
        else
        {
            circuit=false;
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
    if(circuit)
    {
    %>
        <title>Recherche | Circuit accompagnés</title>
    </head>
    <body>
	<%@include file="headerClient.jsp" %>
        <h1 align="center">Tous nos Circuit accompangés</h1>
        <div style="width:50%;display: block; margin: 0 auto; margin-top: 55px;">
            <div style="width:100%; float:center"><img src="img/circuit.jpg" width="100%" height="100%"></div>
            <hr>
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
    <%
    }
    else
    {
    %>
    <title>Recherche | Séjour</title>
    </head>
    <body>
	<%@include file="headerClient.jsp" %>
        <h1 align="center">Tous nos Séjours</h1>
        <div style="width:50%;display: block; margin: 0 auto; margin-top: 55px;">
            <div style="width:100%; float:center"><img src="img/sejour.jpg" height="100%" width="100%"></div>
            <hr>
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
            <label style="float:right">Circuit | <%=sej.getNbJours()%> jours</label>
            <p><%=sej.getDescription()%></p>
            <br>
            <p style="float:right">A partir de <%=minprice%> € <input type="button" value="En savoir plus" onclick="self.location.href='ClientConfirmation.jsp?type=sejour&voyage=<%=sej.getCode()%>'"></p>
            </fieldset>
            <%
            }
            %>
        </div>
    </body>
    <%
    }
    %>
</html>
