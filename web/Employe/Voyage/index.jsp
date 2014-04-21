<%-- 
    Document   : EmployeGestionVoyage
    Created on : Apr 17, 2014, 11:27:36 PM
    Author     : MinhHoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="metier.service.ServiceVoyage"
        import="metier.modele.Pays"
	import="metier.modele.Voyage"
        import="metier.modele.Sejour"
        import="metier.modele.Circuit"
	import="java.util.List"
        import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IF Routard | Gestion du catalogue voyage</title>
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
    </head>
    <body>
        <%-- get infos voyages here --%>
        <%
            List<Pays> pays = ServiceVoyage.obtenirPays();
            List<Sejour> Sejours;
            List<Circuit> Circuits;
            if (request.getParameter("sortpays") == null) {  
                if (request.getParameter("titreSort") == null)
                {
                Sejours = ServiceVoyage.obtenirSejours();
                Circuits = ServiceVoyage.obtenirCircuits();
                }
                else
                {
                List<Circuit> Circuits2 = ServiceVoyage.obtenirCircuits();
                List<Sejour> Sejours2 = ServiceVoyage.obtenirSejours();
                Sejours = new ArrayList<Sejour>();
                Circuits = new ArrayList<Circuit>();
                    for(Sejour s1: Sejours2)
                    {                   
                        if(s1.getTitre().toLowerCase().contains(request.getParameter("titreSort").toLowerCase()))
                                {
                                       Sejours.add(s1);
                                }
                    }
                for(Circuit c1: Circuits2)
                    {
                        if(c1.getTitre().toLowerCase().contains(request.getParameter("titreSort").toLowerCase()))
                                {
                                       Circuits.add(c1);
                                }
                    }
                }
            }
            else
            {
                if (request.getParameter("sortpays").equals("All")) {
                    if (request.getParameter("titreSort") == null)
                    {
                    Sejours = ServiceVoyage.obtenirSejours();
                    Circuits = ServiceVoyage.obtenirCircuits();
                    }
                    else
                    {
                    List<Circuit> Circuits2 = ServiceVoyage.obtenirCircuits();
                    List<Sejour> Sejours2 = ServiceVoyage.obtenirSejours();
                    Sejours = new ArrayList<Sejour>();
                    Circuits = new ArrayList<Circuit>();
                        for(Sejour s1: Sejours2)
                        {                   
                            if(s1.getTitre().toLowerCase().contains(request.getParameter("titreSort").toLowerCase()))
                                    {
                                           Sejours.add(s1);
                                    }
                        }
                    for(Circuit c1: Circuits2)
                        {
                            if(c1.getTitre().toLowerCase().contains(request.getParameter("titreSort").toLowerCase()))
                                    {
                                           Circuits.add(c1);
                                    }
                        }
                    }
                }
                else
                {        
                List<Circuit> Circuits2 = ServiceVoyage.obtenirCircuits();
                List<Sejour> Sejours2 = ServiceVoyage.obtenirSejours();
                Sejours = new ArrayList<Sejour>();
                Circuits = new ArrayList<Circuit>();
                    if (request.getParameter("titreSort") == null)
                    {
                        for(Sejour s1: Sejours2)
                            {                   
                                if(s1.getDestination().getCode().equals(request.getParameter("sortpays")))
                                        {
                                               Sejours.add(s1);
                                        }
                            }
                        for(Circuit c1: Circuits2)
                            {
                                if(c1.getDestination().getCode().equals(request.getParameter("sortpays")))
                                        {
                                               Circuits.add(c1);
                                        }
                            }
                    }
                    else
                    {
                        for(Sejour s1: Sejours2)
                            {                   
                                if((s1.getDestination().getCode().equals(request.getParameter("sortpays")))&&(s1.getTitre().toLowerCase().contains(request.getParameter("titreSort").toLowerCase())))
                                        {
                                               Sejours.add(s1);
                                        }
                            }
                        for(Circuit c1: Circuits2)
                            {
                                if((c1.getDestination().getCode().equals(request.getParameter("sortpays")))&&(c1.getTitre().toLowerCase().contains(request.getParameter("titreSort").toLowerCase())))
                                        {
                                               Circuits.add(c1);
                                        }
                            }
                    }
                }
            }
            String paysSort="";
            if (request.getParameter("sortpays") == null)
            {
                paysSort="";
            }
            else
            {
                paysSort="sortpays="+request.getParameter("sortpays")+"&";
            }
        %>
        <div style="border: 2px solid black; width:30%">
        <table style="width:100%" rules="all">
            <tr style="width:100%">
                <td style="width:50%"><a href="index.jsp" >Voyage</a></td>
                <td style="width:50%" bgcolor="#C1CDCD"><a href="/IFRoutardWeb/Employe/Pays/index.jsp" >Pays</a></td>
            </tr>
        </table>
        </div>
        <div style="float:left; height:800px; width:69.5%; border: 2px solid black; overflow: hidden" >
            <p>
            <form method="post" action="index.jsp?<%=paysSort%>">
                <input type="search" name="titreSort" value="Filtre par titre" size="50%">
                <input type="submit" value="Recherche">
                <select name="paysSort" id="paysSort" style="width: 50%" onChange="location.href='/IFRoutardWeb/Employe/Voyage/index.jsp?sortpays='+this.value">
                    <%
                    if(request.getParameter("sortpays") == null)
                    {
                    %>
                    <option value="All">Tous les pays</option>
                    <%
                        for(Pays pay : pays)
                        {
                        out.println("<option value=\""+pay.getCode()+"\">"+pay.getNom()+"</option>");
                        }
                    }
                    else
                    {
                        if(request.getParameter("sortpays").equals("All"))
                        {
                            %>
                             <option value="All">Tous les pays</option>
                            <%
                                for(Pays pay : pays)
                                {
                                out.println("<option value=\""+pay.getCode()+"\">"+pay.getNom()+"</option>");
                                }
                        }                      
                        else
                        {
                        out.println("<option value=\""+request.getParameter("sortpays")+"\">"+ServiceVoyage.obtenirPaysParCode(request.getParameter("sortpays"))+"</option>");
                        out.println("<option value=\"All\"\">Tous les pays</option>");
                            for(Pays pay : pays)
                            {
                                if(!pay.getCode().equals(request.getParameter("sortpays")))
                                out.println("<option value=\""+pay.getCode()+"\">"+pay.getNom()+"</option>");
                            }                       
                        }
                    }
                    %>
		</select>
            </form>        
            </p>
            <hr>
            <table style="width:100%" rules="rows">
                <tr bgcolor="#8DB6CD">
                    <td style="width:10%"><a href="#code">Code</a></td>                  
                    <td style="width:30%"><a href="#Titre">Titre</a></td>
                    <td style="width:30%"><a href="#Destination">Destination</a></td>
                    <td style="width:20%"><a href="#Type">Type</a></td>
                    <td style="width:10%"><a href="#Duree">Duree</a></td>
                </tr>
            </table>
            <hr>
                 <div style=" width:100%; height:680px; overflow: auto">
                    <table style="width:100%" rules="rows">
                    <%--View Voyage here --%>
                    <%
                        if(!Circuits.isEmpty())
                        {
                            for(Circuit cir : Circuits)
                            {
                            out.println("<tr class=\"row\" onclick=\"self.location.href='EmployeModifierVoyage.jsp?"+paysSort+"type=Circuit&voyagemodifie="+cir.getCode()+"';\" id=\""+cir.getCode()+"\" name=\""+cir.getCode()+"\">");
                            out.println("<td style=\"width:10%\">"+cir.getCode()+"</td> ");
                            out.println("<td style=\"width:30%\">"+cir.getTitre()+"</td> ");
                            out.println("<td style=\"width:30%\">"+cir.getDestination()+"</td> ");
                            out.println("<td style=\"width:20%\">Circuit</td> ");
                            out.println("<td style=\"width:10%\">"+cir.getNbJours()+"</td> ");
                            out.println("</tr>");
                            }
                        }
                        if(!Sejours.isEmpty())
                        {
                        for(Sejour sej : Sejours)
                            {
                            out.println("<tr class=\"row\" onclick=\"self.location.href='EmployeModifierVoyage.jsp?"+paysSort+"type=Sejour&voyagemodifie="+sej.getCode()+"';\" id=\""+sej.getCode()+"\" name=\""+sej.getCode()+"\">");
                            out.println("<td style=\"width:10%\">"+sej.getCode()+"</td> ");
                            out.println("<td style=\"width:30%\">"+sej.getTitre()+"</td> ");
                            out.println("<td style=\"width:30%\">"+sej.getDestination()+"</td> ");
                            out.println("<td style=\"width:20%\">Sejour</td> ");
                            out.println("<td style=\"width:10%\">"+sej.getNbJours()+"</td> ");
                            out.println("</tr>");
                            }
                        }
                    %>
                    </table>
                </div>
        </div>
      
              
        <div style="float:right; width:30%;height: 800px; border: 2px solid black; overflow: hidden" align="center">          
            <input type="button" style="height:100px; position:relative; margin: -20px -50px; width:200px; top:50%;" onclick="self.location.href='EmployeAjouterVoyage.jsp?<%=paysSort%>'" name="NewVoy" id="NewVoy" value="Nouveau Voyage">
        </div>
    </body>
    
</html>
