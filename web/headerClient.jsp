<%-- 
    Document   : headerClient
    Created on : 14 avr. 2014, 15:46:34
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<p><b>IF'Routard</b> <%= session.getAttribute("theName")%>&nbsp;&#124;&nbsp;<a href="ClientRecherche.jsp">Nouvelle Recherche</a>&nbsp;&#124;&nbsp;<a href="ClientConnexion.jsp">Déconnexion</a></p>
<hr/>