<%-- 
    Document   : index
    Created on : 31 mars 2014, 17:44:00
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>IF'Routard</h1>
	<form method="post" action="/IFRoutardWeb/TestServlet">
	    <p>
		<label for="civil">Civilité</label>:<select name="civil" id="civil">
		    <option value="M.">M.</option>
		    <option value="Mme.">Mme.</option>
		    <option value="Mlle.">Mlle.</option>
		    </select> 
		<br>
		<label for="name">Nom</label> : <input type="text" name="name" id="name" /><br>
		<label for="surname">Prenom</label> : <input type="text" name="surname" id="surname" /><br>
		<label for="date">Date de naissance</label> : <input type="date" value="10/04/2014" name="date" id="date">
		<label for="tel">Téléphone</label> : <input type="text" name="tel" id="tel" /><br>
		<label for="email">E-mail</label> : <input type="text" name="email" id="email" /><br>
		<label for="pass">Mot de passe</label> : <input type="password" name="pass" id="pass" /><br>
		<label for="confirm_pass">Confirmation</label> : <input type="password" name="confirm_pass" id="confirm_pass" /><br>
		<input type="submit" name="submit" value="Valider">
		<input type="button" onclick="self.location.href='http://google.fr'" name="submit" value="Annuler">
	    </p>
	</form>
    </body>
</html>
