<%-- 
    Document   : EmployeGestionVoyage
    Created on : Apr 17, 2014, 11:27:36 PM
    Author     : MinhHoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="metier.service.ServiceVoyage"
        import="metier.modele.Pays"
        import="java.util.HashSet"
	import="java.util.List"%>
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
        <%-- get infos pays here --%>
        <%
            List<Pays> pays = ServiceVoyage.obtenirPays();
            Pays paysModif = ServiceVoyage.obtenirPaysParCode(request.getParameter("paysmodifie"));
        %>
        <div style="border: 2px solid black; width:30%">
        <table style="width:100%" rules="all">
            <tr style="width:100%" >
                <td style="width:50%" bgcolor="#C1CDCD"><a href="/IFRoutardWeb/Employe/Voyage/index.jsp" >Voyage</a></td>
                <td style="width:50%"><a href="/IFRoutardWeb/Employe/Pays/index.jsp" >Pays</a></td>
            </tr>
        </table>
        </div>
        <div style="float:left; height:800px; width:69.5%; border: 2px solid black; overflow: hidden">
            <table style="width:100%" rules="rows">
                <tr bgcolor="#8DB6CD">
                    <td style="width:40%"><a href="#code">Nom</a></td>                  
                    <td style="width:40%"><a href="#Titre">Continent</a></td>
                </tr>
            </table>
            <hr>
            <div style=" width:100%; height:750px; overflow: auto">
                    <table style="width:100%" rules="rows">
                    <%--View Pays here --%>
                    <%
                        //String a = "document.getElementById(\"leftdiv\").scrollTop = document.getElementById(\""+request.getParameter("paysmodifie")+";\").offsetTop;";    
                        for(Pays pay : pays)
                        {
                            if(pay.getCode().equals(paysModif.getCode()))
                            {
                            out.println("<tr class=\"row\" bgcolor=\"#0EBFE9\" id=\"1\" onclick=\"self.location.href='EmployeModifierPays.jsp?paysmodifie="+pay.getCode()+"'; \" id=\""+pay.getCode()+"\" name=\""+pay.getCode()+"\">");
                            out.println("<td style=\"width:40%\">"+pay.getNom()+"</td> ");
                            out.println("<td style=\"width:40%\">"+pay.getRegion()+"</td> ");
                            out.println("</tr>");}
                            else
                            {
                            out.println("<tr class=\"row\" onclick=\"self.location.href='EmployeModifierPays.jsp?paysmodifie="+pay.getCode()+"'; \" id=\""+pay.getCode()+"\" name=\""+pay.getCode()+"\">");
                            out.println("<td style=\"width:40%\">"+pay.getNom()+"</td> ");
                            out.println("<td style=\"width:40%\">"+pay.getRegion()+"</td> ");
                            out.println("</tr>");
                            }
                        }
                    %>
                    </table>
                </div>
        </div>
      
              
        <div style="float:right; width:30%;height: 800px; border: 2px solid black; overflow: hidden" align="center">  
            <br>
            <form method="post" action="/IFRoutardWeb/ActionServlet?todo=modifierPays">
                <input type="submit" value="Modifier">
                <input type="button" value="Annuler" onclick="self.location.href='index.jsp'">
                <input style="float:right" type="button" value="Supprimer" onclick="/IFRoutardWeb/ActionServlet?todo=supprimerPays'"><br><br>
                <label>Nom du Pays</label><br>
                <input type="text" style="width:90%;" id="titre" name="titre" value="<%=paysModif.getNom()%>"><br><br>
                <label>Continent</label><br>
                <select name="continent" id="continent" style="width: 90%">
                        <%                           
                            // add elements to al, including duplicates
                            HashSet<String> hs = new HashSet();
                            hs.add(paysModif.getRegion());
                            out.println("<option value=\""+paysModif.getRegion()+".\">"+paysModif.getRegion()+"</option>");
                            for(Pays pay : pays)
                            {
                            hs.add(pay.getRegion());
                            }
                            for(String continent : hs)
                            {
                            out.println("<option value=\""+continent+".\">"+continent+"</option>");
                            }
                        %>
                </select><br><br>
                <label>Capitale</label><br>
                <input type="text" style="width:90%;" id="capitale" name="capitale" value="<%=paysModif.getCapitale()%>"><br><br>
                <label>Langue officielle</label><br>
                <input type="text" style="width:90%;" id="langue" name="langue" value="<%=paysModif.getLangue()%>"><br><br>    
                <table style="width:90%">
                    <tr>
                        <td><label>Superficiel</label></td>
                        <td><label>Population</label></td>
                    </tr>
                </table>
                <input type="text" style="width:44%;" id="superficiel" name="superficiel" value="<%=paysModif.getSuperficie()%>">
                <input type="text" style="width:44%;" id="population" name="population" value="<%=paysModif.getPopulation()%>"><br>
                <table style="width:90%">
                    <tr>
                        <td><label>Regime</label></td>
                        <td><label>Code</label></td>
                    </tr>
                </table>
                <input type="text" style="width:44%;" id="regime" name="regime" value="<%=paysModif.getRegime()%>">
                <input type="text" style="width:44%;" id="code" name="code" value="<%=paysModif.getCode()%>"><br>
            </form>
        </div>
    </body>
    <script>
            document.getElementById("leftdiv").scrollTop = document.getElementById("<%=request.getParameter("paysmodifie")%>").offsetTop;
    </script>
</html>
