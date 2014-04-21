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
        <br><br><br>
        <p align="center" style="font-size:70px; margin:0;"><font face="Comic sans MS">Recherche de voyage</font></p><br/><br>
	<table align="center">
	    <tr>
		<td align="center" style="width:50%">
		    <form method="post" action="ClientRecherche_Pays.jsp">
			<font face="Comic sans MS" size="5">Par pays</font><br/><br/>
			<input type="text" size="40" name="pays" id="pays" value="Argentine"><br/>
			<input type="submit" name="recherche_Pays" value="Recherche"/>
		    </form>
		</td>
		<td align="center" style="width:50%">
		    <form method="post" action="ClientRecherche_Type.jsp">
			<font face="Comic sans MS" size="5">Par type de voyage</font><br/><br/>
			<select name="type" name="type" id="type" style="width:100%">
			    <option value="Circuit">Circuit accompagné</option>
			    <option value="Sejour">Séjour</option>
			</select><br/>
			<input type="submit" name="recherche_Type" value="Recherche"/>
		    </form>
		</td>
	    </tr>
	</table>
    </body>
</html>
