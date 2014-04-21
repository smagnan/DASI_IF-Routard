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
        import="metier.modele.Depart"
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
        <script type="text/javascript"> 
        window.onload = function(){
        var row = document.getElementById(1);
        row.scrollIntoView(false);
        }
        </script> 
    </head>
    <body onload="function();">
        <%-- get infos voyages here --%>
        <%
            List<Pays> pays = ServiceVoyage.obtenirPays();
            List<Sejour> Sejours;
            List<Circuit> Circuits;
            Voyage voyageModif = ServiceVoyage.obtenirVoyageParCode(request.getParameter("voyagemodifie"));
            List<Depart> Departs = voyageModif.getDeparts();
            String typeVoy = request.getParameter("type"); 
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
        <div style="float:left; height:800px; width:69.5%; border: 2px solid black; overflow: hidden">
            <p>
            <form method="post" action="index.jsp?<%=paysSort%>type=<%=request.getParameter("type")%>&voyagemodifie=<%=request.getParameter("voyagemodifie")%>">
                <input type="search" name="titreSort" value="Filtre par titre" size="50%">
                <input type="submit" value="Recherche">
                <select name="paysSort" id="paysSort" style="width: 50%" onChange="location.href='/IFRoutardWeb/Employe/Voyage/EmployeModifierVoyage.jsp?type=<%=request.getParameter("type")%>&voyagemodifie=<%=request.getParameter("voyagemodifie")%>&sortpays='+this.value">
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
                        for(Circuit cir : Circuits)
                        {
                            if(cir.getCode().equals(voyageModif.getCode()))
                            {
                            out.println("<tr class=\"row\" id=\"1\" bgcolor=\"#0EBFE9\" onclick=\"self.location.href='EmployeModifierVoyage.jsp?"+paysSort+"type=Circuit&voyagemodifie="+cir.getCode()+"';\" id=\""+cir.getCode()+"\" name=\""+cir.getCode()+"\">");
                            out.println("<td style=\"width:10%\">"+cir.getCode()+"</td> ");
                            out.println("<td style=\"width:30%\">"+cir.getTitre()+"</td> ");
                            out.println("<td style=\"width:30%\">"+cir.getDestination()+"</td> ");
                            out.println("<td style=\"width:20%\">Circuit</td> ");
                            out.println("<td style=\"width:10%\">"+cir.getNbJours()+"</td> ");
                            out.println("</tr>");
                            }
                            else
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
                        for(Sejour sej : Sejours)
                        {
                            if(sej.getCode().equals(voyageModif.getCode()))
                            {
                            out.println("<tr class=\"row\" id=\"1\" bgcolor=\"#0EBFE9\" onclick=\"self.location.href='EmployeModifierVoyage.jsp?"+paysSort+"type=Sejour&voyagemodifie="+sej.getCode()+"';\" id=\""+sej.getCode()+"\" name=\""+sej.getCode()+"\">");
                            out.println("<td style=\"width:10%\">"+sej.getCode()+"</td> ");
                            out.println("<td style=\"width:30%\">"+sej.getTitre()+"</td> ");
                            out.println("<td style=\"width:30%\">"+sej.getDestination()+"</td> ");
                            out.println("<td style=\"width:20%\">Sejour</td> ");
                            out.println("<td style=\"width:10%\">"+sej.getNbJours()+"</td> ");
                            out.println("</tr>");
                            }
                            else
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
        <div style="float:right; width:30%;height: 800px; border: 2px solid black; overflow: hidden;" align="center">          
            <table style="width:100%" rules="all">
                <tr>
                    <td  bgcolor="#C1CDCD" align="center"><a href="EmployeModifierVoyage.jsp?<%=paysSort%>type=<%=request.getParameter("type")%>&voyagemodifie=<%=voyageModif.getCode()%>">Description</a></td>
                    <td align="center">Départ</td>
                </tr>
            </table>    
                <hr>
            <div style="width:100%; height:50%;">
                <table style="width:90%" rules="rows">
                <tr bgcolor="#8DB6CD">
                    <td style="width:37%"><a href="#code">Ville de départ</a></td>                  
                    <td style="width:20%"><a href="#Titre">Date</a></td>
                    <td style="width:10%"><a href="#Destination">Prix</a></td>
                    <td style="width:33%"><a href="#Type">Description</a></td>
                </tr>
                </table>
                <hr>
                <div style="float:right; width:97%;height: 400px; border: 2px solid black; overflow: hidden;" >
                    <table style="width:100%" rules="rows">
                        <%
                            if(request.getParameter("modifDepart").equals("false"))
                            {
                                for(Depart dep:Departs)
                                {
                                out.println("<tr class=\"row\" onclick=\"self.location.href='EmployeModifierVoyageDepart.jsp?"+paysSort+"type="+request.getParameter("type")+"&newDepart=false&modifDepart=true&departmodifie="+dep.getId()+"&voyagemodifie="+voyageModif.getCode()+"';\" id=\""+dep.getId()+"\" name=\""+dep.getId()+"\">");
                                out.println("<td style=\"width:35%\">"+dep.getVille()+"</td> ");
                                out.println("<td style=\"width:20%\">"+dep.getDateDeDepart()+"</td> ");
                                out.println("<td style=\"width:10%\">"+dep.getPrix()+"</td> ");
                                out.println("<td style=\"width:35%\">"+dep.getDescription()+"</td> ");
                                out.println("</tr>");          
                                }
                            }
                            
                            else
                            {
                            for(Depart dep:Departs)
                            {
                            Long id= Long.parseLong(request.getParameter("departmodifie"));
                            if(id.equals(dep.getId()))
                            {
                            out.println("<tr class=\"row\" bgcolor=\"##0EBFE9\" onclick=\"self.location.href='EmployeModifierVoyageDepart.jsp?"+paysSort+"type="+request.getParameter("type")+"&newDepart=false&modifDepart=true&departmodifie="+dep.getId()+"&voyagemodifie="+voyageModif.getCode()+"';\" id=\""+dep.getId()+"\" name=\""+dep.getId()+"\">");
                            out.println("<td style=\"width:35%\">"+dep.getVille()+"</td> ");
                            out.println("<td style=\"width:20%\">"+dep.getDateDeDepart()+"</td> ");
                            out.println("<td style=\"width:10%\">"+dep.getPrix()+"</td> ");
                            out.println("<td style=\"width:35%\">"+dep.getDescription()+"</td> ");
                            out.println("</tr>");
                            }
                            else
                            {
                            out.println("<tr class=\"row\" onclick=\"self.location.href='EmployeModifierVoyageDepart.jsp?"+paysSort+"type="+request.getParameter("type")+"&newDepart=false&modifDepart=true&departmodifie="+dep.getId()+"&voyagemodifie="+voyageModif.getCode()+"';\" id=\""+dep.getId()+"\" name=\""+dep.getId()+"\">");
                            out.println("<td style=\"width:35%\">"+dep.getVille()+"</td> ");
                            out.println("<td style=\"width:20%\">"+dep.getDateDeDepart()+"</td> ");
                            out.println("<td style=\"width:10%\">"+dep.getPrix()+"</td> ");
                            out.println("<td style=\"width:35%\">"+dep.getDescription()+"</td> ");
                            out.println("</tr>");  
                            }
                            }
                            }
                        %>
                    </table>
                </div>
                <%
                    if(request.getParameter("newDepart").equals("true"))
                    {
                %>
                <div style="width:100%; height: 50%;">
                    <form method="post" action="/IFRoutardWeb/ActionServlet">
                        <input type="hidden" name="todo" id="todo" value="ajouterDepart">
                        <input type="submit" value="Ajouter">
                        <input type="hidden" name="voyagemodifieHidden" value=<%=request.getParameter("voyagemodifie")%>>
                        <input type="hidden" name="typeHidden" value=<%=request.getParameter("type")%>>
                        <input type="button" onclick="self.location.href='EmployeModifierVoyageDepart.jsp?newDepart=false&modifDepart=false&type=<%=request.getParameter("type")%>&voyagemodifie=<%=request.getParameter("voyagemodifie")%>'" value="Annuler">
                        <br>
                        <br>
                        <table style="width:90%">
                            <tr>
                                <td>Ville de départ</td>
                                <td style="width:70%"><input style="width:100%" type="text" name="ville"></td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td style="width:70%; height: 150px"><textarea style="height:100%; width:100%" type="text" name="description"></textarea></td>
                            </tr>
                        </table>
                        <table style="width:90%">
                            <tr>
                                <td>Date de départ</td>
                                <td><input type="date" name="date"></td>
                                <td>Prix</td>
                                <td><input type="text" name="prix"></td>
                            </tr>
                        </table>
                    </form>
                </div>   
                <%
                    }
                    else
                    {
                        if(request.getParameter("modifDepart").equals("true"))
                        {
                        String stringDepartModif = request.getParameter("departmodifie");
                        Depart departModif = new Depart();
                        List<Depart> Departs2 = voyageModif.getDeparts();
                        for(Depart dep2 : Departs2)
                        {
                            if(dep2.getId().equals(Long.parseLong(stringDepartModif)))
                            {
                                departModif = dep2;
                            }
                        }
                %>
                <div style="width:100%; height: 50%;">
                    <form method="post" action="/ActionServlet">
                        <input type="hidden" name="todo" id="todo" value="ModifDepart">
                        <input type="submit" value="Enregistrer les modifications">
                        <input type="button" onclick="self.location.href='EmployeModifierVoyageDepart.jsp?<%=paysSort%>&newDepart=false&modifDepart=false&type=<%=request.getParameter("type")%>&voyagemodifie=<%=request.getParameter("voyagemodifie")%>'" value="Annuler">
                        <input type="button" onclick="self.location.href='/ActionServlet?todo=deleteDepart&depart=etc'" value="Supprimer">
                        <br>
                        <br>
                        <table style="width:90%">
                            <tr>
                                <td>Ville de départ</td>
                                <td style="width: 70%"><input style="width: 100%" type="text" name="ville" value="<%=departModif.getVille()%>"></td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td style="width: 70%; height: 150px"><textarea style="width:100%;height:100%" type="text" name="description"><%=departModif.getDescription()%></textarea></td>
                            </tr>
                        </table>
                        <table style="width:90%">
                            <tr>
                                <td>Date de départ</td>
                                <td><input type="text" name="date" value="<%=departModif.getDateDeDepart()%>"></td>
                                <td>Prix</td>
                                <td><input type="text" name="prix" value="<%=departModif.getPrix()%>"></td>
                            </tr>
                        </table>
                    </form>
                </div>    
                <%
                        }
                        else
                        {
                %>
                <div style="width:100%; height: 50%;">
                    <input type="button" style="height:100px; position:relative; margin: -20px -50px; width:200px; top:50%;" onclick="self.location.href='EmployeModifierVoyageDepart.jsp?<%=paysSort%>modifDepart=false&newDepart=true&type=<%=request.getParameter("type")%>&voyagemodifie=<%=voyageModif.getCode()%>'" name="newDep" id="newDep" value="Nouveau départ">
                </div>      
                <%
                        }   
                    }
                %>
            </div>
        </div>
    </body>
    
</html>
