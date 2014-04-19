<%-- 
    Document   : headerClient
    Created on : 14 avr. 2014, 15:46:34
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<p>
    <img src="img/user.png"/>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <font size="6"><b>IF'Routard</b></font> 
    <font size="4" color="royalblue"><b><%= session.getAttribute("theName")%></b></font>
    &nbsp;&nbsp;&#124;&nbsp;&nbsp;
    <a href="ClientRecherche.jsp">Nouvelle Recherche</a>
    &nbsp;&nbsp;&#124;&nbsp;&nbsp;
    <a href="ClientConnexion.jsp">Déconnexion</a></p>
<hr/>