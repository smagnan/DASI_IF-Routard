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
	<table align="center">
	    <tr>

		<td align="center">
		    <form method="post" action="/IFRoutardWeb/ActionServlet">
			 <%-- Passage param Todo par champ HIDDEN, A changer --%> 
			<input type="hidden" name="todo" id="todo" value="processRecherche_Pays" />
			Par pays <br/>
			<input type="text" size="40" name="pays" id="pays"><br/>
			<input type="submit" name="recherche_Pays" value="Recherche"/>
		    </form>
		</td>
		<td align="center">
		    <form method="post" action="/IFRoutardWeb/ActionServlet">
			 <%-- Passage param Todo par champ HIDDEN, A changer --%> 
			<input type="hidden" name="todo" id="todo" value="processRecherche_Type" />
			Par type de voyage <br/>
			<select name="voyage" id="voyage" name="type" id="type">
			    <option value="Circuit">Circuit accompagné</option>
			    <option value="Sejour">Séjour</option>
			    <%-- <%
			     List<Voyage> voyages = ServiceVoyage.obtenirVoyages();
			    for(Voyage voys : voyages)
			    {
				out.println("<option value=\""+voys.getTitre()+"\">"+voys.getTitre()+"</option>");
			    }
			    %> --%>

			</select><br/>
			<input type="submit" name="recherche_Type" value="Recherche"/>
		    </form>
		</td>
	    </tr>
	</table>
    </body>
</html>
