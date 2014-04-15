<%-- 
    Document   : ClientConnexion
    Created on : 7 avr. 2014, 16:34:04
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IF'Routard</title>
    </head>
    <body>
        <h1 align="center">IF'Routard</h1>
	<h2 align="center">L'agence de voyage des insaliens</h2>
	<img src="qsdqsd.png"/>
	<form method="post" action="/IFRoutardWeb/ServletLoginClient">
	    <label for="email">E-mail</label> : <input type="text" name="email" id="email" /><br>
	    <label for="pass">Mot de passe</label> : <input type="password" name="pass" id="pass" /><br> 
	    <input type="submit" name="submit" value="Me connecter"/>
	</form>
	<input type="button" value ="M'inscrire et acceder aux offres" onclick="self.location.href='ClientInscription.jsp'" />
    </body>
</html>
