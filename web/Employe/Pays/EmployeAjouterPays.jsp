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
    </head>
    <body>
        <%-- get infos pays here --%>
        <%
            List<Pays> pays = ServiceVoyage.obtenirPays();
        %>
        <div style="border: 2px solid black; width:30%">
        <table style="width:100%" rules="all">
            <tr style="width:100%">
                <td style="width:50%" bgcolor="#C1CDCD"><a href="/IFRoutardWeb/Employe/Voyage/index.jsp" >Voyage</a></td>
                <td style="width:50%"><a href="/IFRoutardWeb/Employe/Pays/index.jsp" >Pays</a></td>
            </tr>
        </table>
        </div>
        <div style="float:left; height:800px; width:69.5%; border: 2px solid black; overflow: hidden" >
            <table style="width:100%" rules="rows" bgcolor="#8DB6CD">
                <tr>
                    <td style="width:40%"><a href="#code">Nom</a></td>                  
                    <td style="width:40%"><a href="#Titre">Continent</a></td>
                </tr>
            </table>
            <hr>
                <div style=" width:100%; height:750px; overflow: auto">
                    <table style="width:100%; height:100%;" rules="rows">
                    <%--View Pays here --%>
                    <%
                        for(Pays pay : pays)
                        {

                        out.println("<tr class=\"row\" id=\""+pay.getCode()+"\" name=\""+pay.getCode()+"\">");
                        out.println("<td style=\"width:40%\">"+pay.getNom()+"</td> ");
                        out.println("<td style=\"width:40%\">"+pay.getRegion()+"</td> ");
                        out.println("</tr>");
                        }
                    %>
                    </table>
                </div>
        </div>
      
              
        <div style="float:right; width:30%;height: 800px; border: 2px solid black; overflow: hidden" align="center">  
            <br>
            <form method="post" action="/IFRoutardWeb/ActionServlet">
                <input type="hidden" value="ajouterPays" id="todo" name="todo"> 
                <input type="submit" name="submit" value="Ajouter">
                <input type="button" value="Annuler" onclick="self.location.href='index.jsp'"><br><br>
                <label>Nom du Pays</label><br>
                <input type="text" style="width:90%;" id="nom" name="nom"><br><br>
                <label>Continent</label><br>
                <select name="continent" id="continent" style="width: 90%">
                        <%
                            // add elements to al, including duplicates
                            HashSet<String> hs = new HashSet();
                            for(Pays pay : pays)
                            {
                            hs.add(pay.getRegion());
                            }
                            for(String continent : hs)
                            {
                            out.println("<option value=\""+continent+"\">"+continent+"</option>");
                            }
                        %>
                </select><br><br>
                <label>Capitale</label><br>
                <input type="text" style="width:90%;" id="capitale" name="capitale"><br><br>
                <label>Langue officielle</label><br>
                <input type="text" style="width:90%;" id="langue" name="langue"><br><br>    
                <table style="width:90%">
                    <tr>
                        <td><label>Superficiel</label></td>
                        <td><label>Population</label></td>
                    </tr>
                </table>
                <input type="text" style="width:44%;" id="superficiel" name="superficiel">
                <input type="text" style="width:44%;" id="population" name="population"><br>   
                <table style="width:90%">
                    <tr>
                        <td><label>Regime</label></td>
                        <td><label>Code</label></td>
                    </tr>
                </table>
                <input type="text" style="width:44%;" id="regime" name="regime">
                <input type="text" style="width:44%;" id="code" name="code"><br>  
            </form>
        </div>
    </body>
    
</html>
