<%-- 
    Document   : EmployeGestionVoyage
    Created on : Apr 17, 2014, 11:27:36 PM
    Author     : MinhHoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="metier.service.ServiceVoyage"
        import="metier.modele.Pays"
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
        <table style="width:100%" rules="all" >
            <tr style="width:100%">
                <td style="width:50%" bgcolor="#C1CDCD"><a href="/IFRoutardWeb/Employe/Voyage/index.jsp" >Voyage</a></td>
                <td style="width:50%"><a href="/IFRoutardWeb/Employe/Pays/index.jsp" >Pays</a></td>
            </tr>
        </table>
        </div>
        <div style="float:left; height:800px; width:69.5%; border: 2px solid black; overflow: hidden" >
            <table style="width:100%" rules="rows">
                <tr bgcolor="#8DB6CD">
                    <td style="width:40%"><a href="index.jsp?sort=nom">Nom</a></td>                  
                    <td style="width:40%"><a href="index.jsp?sort=continent">Continent</a></td>
                </tr>
            </table>
            <hr>
                 <div style=" width:100%; height:750px; overflow: auto">
                    <table style="width:100%" rules="rows">
                    <%--View Pays here --%>
                    <%
                        for(Pays pay : pays)
                        {
                        out.println("<tr class=\"row\" onclick=\"self.location.href='EmployeModifierPays.jsp?paysmodifie="+pay.getCode()+"';\" id=\""+pay.getCode()+"\" name=\""+pay.getCode()+"\">");
                        out.println("<td style=\"width:40%\">"+pay.getNom()+"</td> ");
                        out.println("<td style=\"width:40%\">"+pay.getRegion()+"</td> ");
                        out.println("</tr>");
                        }
                    %>
                    </table>
                </div>
        </div>
      
              
        <div style="float:right; width:30%;height: 800px; border: 2px solid black; overflow: hidden" align="center">   
            <input type="button" style="height:100px; position:relative; margin: -20px -50px; width:200px; top:50%;" onclick="self.location.href='/IFRoutardWeb/Employe/Pays/EmployeAjouterPays.jsp'" name="NewVoy" id="NewVoy" value="Nouveau Pays">
        </div>
    </body>
</html>
