<%-- 
    Document   : ClientConfirmation
    Created on : Apr 20, 2014, 9:17:54 PM
    Author     : MinhHoang
--%>
<%@page import="metier.service.ServiceVoyage"
	import="metier.modele.Depart"
        import="metier.modele.Pays"
        import="metier.modele.Voyage"
        import="metier.modele.Circuit"
        import="metier.modele.Sejour"
        import="java.util.ArrayList"
	import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
            .table {
            display: table;
            }
            .row {
            display: table-row;
            }
            .cell {
            display: table-cell;
            padding: 10px;
            }
            .row:hover {
            background-color: #cccccc;
            }
            .cell:hover {
            background-color: #e5e5e5;
            }
</style>
<script>
    window.onload = function()
            {
                var row = document.getElementById(1);
                row.scrollIntoView(false);
            }
        </script> 
</script>
<html>
    <%
    if(request.getParameter("devis")==null)
    {
        String voyageCode = request.getParameter("voyage");
        Voyage voy = ServiceVoyage.obtenirVoyageParCode(voyageCode);
        if(request.getParameter("type").equals("circuit"))
        {
            Circuit cir = (Circuit)voy;
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voyage "<%=cir.getTitre()%>"</title>
    </head>
    <body onload="function();">
        <%@include file="headerClient.jsp" %>
        <h1 align="center">Voyage "<%=cir.getTitre()%>"</h1>
        <div style="width:50%;display: block; margin: 0 auto; margin-top: 55px;">
            <fieldset>
                <legend><%=cir.getTitre()%></legend>
            <label style="float:right">Circuit | <%=cir.getNbJours()%> jours</label>
            <p><%=cir.getDescription()%></p>
            <img src="img/temp.png">
            </fieldset>
            <h2>Fiche Voyage</h2>
            <p>Transport au cours du circuit : <%=cir.getTransport()%></p><br>
            <p>Nombre de kilomètres parcous dans le circuit : environ <%=cir.getNbKilometres()%></p><br><br>
            <h2>Choix du départ</h2>
            <div style="border: 2px solid black;" align="center">
                <table style="width:100%" rules="rows" align="center">
                    <tr style="width:50%;height: 150px">
                        <td style="width:20%"><strong>Ville de départ</strong></td>
                        <td style="width:20%"><strong>Date</strong></td>
                        <td style="width:20%"><strong>Prix<br>(par personne)</strong></td>
                        <td style="width:20%"><strong>Remarques</strong></td>
                        <td style="width:20%"><strong>Choix</strong></td>
                    </tr>
                    <%
                        List<Depart> Departs = cir.getDeparts();
                        for(Depart dep : Departs)
                        {
                            if(request.getParameter("depart") == null)
                            {
                    %>
                    <tr align="center" style="width:50%;height: 150px" class="row" onclick="self.location.href='ClientConfirmation.jsp?type=circuit&voyage=<%=voy.getCode()%>&depart=<%=dep.getId()%>'">
                        <td style="width:20%"><%=dep.getVille()%></td>
                        <td style="width:20%"><%=dep.getDateDeDepart()%></td>
                        <td style="width:20%"><%=dep.getPrix()%></td>
                        <td style="width:20%"><%=dep.getDescription()%></td>
                        <td style="width:20%"><input type="checkbox" name="<%=dep.getId()%>" id="<%=dep.getId()%>" unchecked></td>
                    </tr>
                    <%
                            }
                            else if(dep.getId().equals(Long.parseLong(request.getParameter("depart"))))
                            {
                    %>
                    <tr align="center" style="width:50%;height: 150px" id="1" bgcolor="#0EBFE9" class="row" onclick="self.location.href='ClientConfirmation.jsp?type=circuit&voyage=<%=voy.getCode()%>&depart=<%=dep.getId()%>'">
                        <td style="width:20%"><%=dep.getVille()%></td>
                        <td style="width:20%"><%=dep.getDateDeDepart()%></td>
                        <td style="width:20%"><%=dep.getPrix()%></td>
                        <td style="width:20%"><%=dep.getDescription()%></td>
                        <td style="width:20%"><input type="checkbox" name="<%=dep.getId()%>" id="<%=dep.getId()%>" checked></td>
                    </tr>    
                    <% 
                            }
                            else
                            {
                                %>
                    <tr align="center" style="width:50%;height: 150px" class="row" onclick="self.location.href='ClientConfirmation.jsp?type=circuit&voyage=<%=voy.getCode()%>&depart=<%=dep.getId()%>'">
                        <td style="width:20%"><%=dep.getVille()%></td>
                        <td style="width:20%"><%=dep.getDateDeDepart()%></td>
                        <td style="width:20%"><%=dep.getPrix()%></td>
                        <td style="width:20%"><%=dep.getDescription()%></td>
                        <td style="width:20%"><input type="checkbox" name="<%=dep.getId()%>" id="<%=dep.getId()%>" unchecked></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </table>
                <form method="post" action="/IFRoutardWeb/ActionServlet?todo=ajouterDevis">
                    <input type="hidden" name="typeSelect" value="circuit">
                    <input type="hidden" name="Email" value="<%= session.getAttribute("EmailClient")%>">
                    <input type="hidden" name="voyageSelect" value=<%=request.getParameter("voyage")%>>
                    <input type="hidden" name="departSelect" value="<%=request.getParameter("depart")%>">
                    <div align="center">
                        <table>
                            <tr>
                                <td style="width:30%"><label ><strong>Nombre de voyageurs</strong></label></td>
                                <td style="width:20%"><input type="text" id="nb" name="nb" value="1" style="width: 30px"></td>
                                <td style="width:50%"><input style="width:200px; height:50px"type="submit" value="Obtenir un devis"></td>
                            </tr>
                        <table>
                    </div>
                </form>
            </div>
        </div>
    </body>
    <%
        }
        else
        {
            Sejour sej = (Sejour)voy;
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voyage "<%=sej.getTitre()%>"</title>
    </head>
    <body>
        <%@include file="headerClient.jsp" %>
        <h1 align="center">Voyage "<%=sej.getTitre()%>"</h1>
        <div style="width:50%;display: block; margin: 0 auto; margin-top: 55px;">
            <fieldset>
                <legend><%=sej.getTitre()%></legend>
            <label style="float:right">Circuit | <%=sej.getNbJours()%> jours</label>
            <p><%=sej.getDescription()%></p>
            <img src="img/temp.png">
            </fieldset>
            <h2>Fiche Voyage</h2>
            <p>Résidence : <%=sej.getResidence()%></p><br><br>
            <h2>Choix du départ</h2>
            <div style="border: 2px solid black;" align="center">
                <table style="width:100%" rules="rows" align="center">
                    <tr style="width:50%;height: 150px" align="center">
                        <td style="width:20%"><strong>Ville de départ</strong></td>
                        <td style="width:20%"><strong>Date</strong></td>
                        <td style="width:20%"><strong>Prix<br>(par personne)</strong></td>
                        <td style="width:20%"><strong>Remarques</strong></td>
                        <td style="width:20%"><strong>Choix</strong></td>
                    </tr>
                    <%
                        List<Depart> Departs = sej.getDeparts();
                        for(Depart dep : Departs)
                        {
                            if(request.getParameter("depart") == null)
                            {
                    %>
                    <tr align="center" style="width:50%;height: 150px" class="row" onclick="self.location.href='ClientConfirmation.jsp?type=sejour&voyage=<%=voy.getCode()%>&depart=<%=dep.getId()%>'">
                        <td style="width:20%"><%=dep.getVille()%></td>
                        <td style="width:20%"><%=dep.getDateDeDepart()%></td>
                        <td style="width:20%"><%=dep.getPrix()%></td>
                        <td style="width:20%"><%=dep.getDescription()%></td>
                        <td style="width:20%"><input type="checkbox" name="<%=dep.getId()%>" id="<%=dep.getId()%>" unchecked></td>
                    </tr>
                    <%
                            }
                            else if(dep.getId().equals(Long.parseLong(request.getParameter("depart"))))
                            {
                    %>
                    <tr align="center" style="width:50%;height: 150px" id="1" bgcolor="#0EBFE9" class="row" onclick="self.location.href='ClientConfirmation.jsp?type=sejour&voyage=<%=voy.getCode()%>&depart=<%=dep.getId()%>'">
                        <td style="width:20%"><%=dep.getVille()%></td>
                        <td style="width:20%"><%=dep.getDateDeDepart()%></td>
                        <td style="width:20%"><%=dep.getPrix()%></td>
                        <td style="width:20%"><%=dep.getDescription()%></td>
                        <td style="width:20%"><input type="checkbox" name="<%=dep.getId()%>" id="<%=dep.getId()%>" checked></td>
                    </tr>    
                    <% 
                            }
                            else
                            {
                    %>
                    <tr align="center" style="width:50%;height: 150px" class="row" onclick="self.location.href='ClientConfirmation.jsp?type=sejour&voyage=<%=voy.getCode()%>&depart=<%=dep.getId()%>'">
                        <td style="width:20%"><%=dep.getVille()%></td>
                        <td style="width:20%"><%=dep.getDateDeDepart()%></td>
                        <td style="width:20%"><%=dep.getPrix()%></td>
                        <td style="width:20%"><%=dep.getDescription()%></td>
                        <td style="width:20%"><input type="checkbox" name="<%=dep.getId()%>" id="<%=dep.getId()%>" unchecked></td>
                    </tr>
                    <%      }
                        }
                    %>
                </table>
                <hr>
                
                <form method="post" action="/IFRoutardWeb/ActionServlet?todo=ajouterDevis">
                    <input type="hidden" name="typeSelect" value="sejour">
                    <input type="hidden" name="Email" value="<%= session.getAttribute("EmailClient")%>">    
                    <input type="hidden" name="voyageSelect" value="<%=request.getParameter("voyage")%>">
                    <input type="hidden" name="departSelect" value="<%=request.getParameter("depart")%>">
                    <div align="center">
                        <table>
                            <tr>
                                <td style="width:30%"><label ><strong>Nombre de voyageurs</strong></label></td>
                                <td style="width:20%"><input type="text" id="nb" name="nb" value="1" style="width: 30px"></td>
                                <td style="width:50%"><input style="width:200px; height:50px"type="submit" value="Obtenir un devis"></td>
                            </tr>
                        <table>
                    </div>
                </form>
                <br>
                <br>
            </div>
        </div>
    </body>
    <%
        }
    }
    else
    {
        String typeVoy = request.getParameter("type");
        Voyage voy = ServiceVoyage.obtenirVoyageParCode(request.getParameter("voyage"));
        List<Depart> Departs = voy.getDeparts();
        Depart depart = new Depart();
        for(Depart dep : Departs)
        {
            if(dep.getId().equals(Long.parseLong(request.getParameter("depart"))))
            {
                depart = dep;
            }
        }
        Circuit cir = new Circuit();
        Sejour sej = new Sejour();
        if(typeVoy.equals("circuit"))
        {
            cir=(Circuit)voy;
        
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voyage "<%=cir.getTitre()%>"</title>
    </head>
    <body>
        <%@include file="headerClient.jsp" %>
        <h1 align="center">Votre devis</h1>
        <h3 align="center">Une copie de votre devis vous a été transmise par email</h3>
        <div style="width:50%;display: block; margin: 0 auto; margin-top: 55px;">
            <fieldset>
                <legend><%=cir.getTitre()%></legend>
            <label style="float:right">Circuit | <%=cir.getNbJours()%> jours</label>
            <p><%=cir.getDescription()%></p>
            <img src="img/temp.png">
            </fieldset>
            <h2>Fiche voyage</h2>
            <p>Transport au cours du circuit : <%=cir.getTransport()%></p><br>
            <p>Nombre de kilomètres parcous dans le circuit : environ <%=cir.getNbKilometres()%></p><br><br>
            <table style="width:100%">
                <tr>
                    <td style="width:70%">
                        <h2>Votre départ</h2>
                        <p>Départ de <%=depart.getVille()%> le <%=depart.getDateDeDepart()%>.</p><br>
                        <p>Transport : <%=depart.getDescription()%>.</p>
                    </td>
                    <td style="width:30%">
                        <h2>Récapitulatif</h2>
                        <p>Nombre de personnes : <%=request.getParameter("nb")%></p><br>
                        <p>Tarif par personnes : <%=depart.getPrix()%>€</p>
                    </td>
                </tr>
            </table>
                <div style="width:70%; height:20px" align="right">
                <p><strong>Total : <%=depart.getPrix()*Long.parseLong(request.getParameter("nb"))%>€</strong></p>
                </div>
                <div style="width:100%" align="center">
                    <input style="width:200px; height:70px" type="button" value="Nouvelle Recherche" onclick="self.location.href='ClientRecherche.jsp'">
                </div>
    <%
        }
        else
        {
            sej=(Sejour)voy;
    %>
        <%@include file="headerClient.jsp" %>
        <h1 align="center">Votre devis</h1>
        <h3 align="center">Une copie de votre devis vous a été transmise par email</h3>
        <div style="width:50%;display: block; margin: 0 auto; margin-top: 55px;">
            <fieldset>
                <legend><%=sej.getTitre()%></legend>
            <label style="float:right">Circuit | <%=sej.getNbJours()%> jours</label>
            <p><%=sej.getDescription()%></p>
            <img src="img/temp.png">
            </fieldset>
            <h2>Fiche voyage</h2>
            <p>Résidence : <%=sej.getResidence()%></p><br><br>
            <table style="width:100%">
                <tr>
                    <td style="width:70%">
                        <h2>Votre départ</h2>
                        <p>Départ de <%=depart.getVille()%> le <%=depart.getDateDeDepart()%>.</p><br>
                        <p>Transport : <%=depart.getDescription()%>.</p>
                    </td>
                    <td style="width:30%">
                        <h2>Récapitulatif</h2>
                        <p>Nombre de personnes : <%=request.getParameter("nb")%></p><br>
                        <p>Tarif par personnes : <%=depart.getPrix()%>€</p>
                    </td>
                </tr>
            </table>
                <div style="width:70%; height:20px" align="right">
                <p><strong>Total : <%=depart.getPrix()*Long.parseLong(request.getParameter("nb"))%>€</strong></p>
                </div>
                <div style="width:100%" align="center">
                    <input style="width:200px; height:70px" type="button" value="Nouvelle Recherche" onclick="self.location.href='ClientRecherche.jsp'">
                </div>
    <%
        }
    }
    %>
</html>
