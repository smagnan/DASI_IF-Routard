<%-- 
    Document   : Testjsp
    Created on : 14 avr. 2014, 15:27:55
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
        <title>Consultation du catalogue client</title>
    </head>
    <body>
	<%@include file="headerClient.jsp" %>
	<h1 align="center">Recherche de voyage</h1>
	<table>
	<tr>
	    <td align="center">Par pays</td>
	    <td align="center">Par type de voyage</td>
	</tr>
	<tr>
	    <form method="post" action="/IFRoutardWeb/ServletRecherchePays">
	    <td align="center"><input type="text" size="40" name="pays" id="pays"><br/>
	    <input type="submit"></td>
	    </form>
	     <td align="center"><select name="voyage" id="voyage" size="40" name="type" id="type">
		    <option value="Circuit">Circuit accompagné</option>
		    <option value="Sejour">Séjour</option>
		    <%-- <%
		     List<Voyage> voyages = ServiceVoyage.obtenirVoyages();
		    for(Voyage voys : voyages)
		    {
			out.println("<option value=\""+voys.getTitre()+"\">"+voys.getTitre()+"</option>");
		    }
		    %> --%>
		    
		    </select> </td>
	</tr>
	<tr>
	    <td align="center"><input type="submit"></td>
	    <td align="center"><input type="submit"></td>
	</tr>
	</table>
    </body>
</html>
