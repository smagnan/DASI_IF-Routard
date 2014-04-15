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
	<div style="float:left" align="right">
	<form method="post" action="/IFRoutardWeb/ServletInscritClient">
	    <table>
		<tr>
		    <td align="right"><label for="civil">Civilité</label>:</td>
		    <td align="left"><select name="civil" id="civil">
		    <option value="M.">M.</option>
		    <option value="Mme.">Mme.</option>
		    <option value="Mlle.">Mlle.</option>
		    </select> </td>
		</tr>
		<tr>
		<td align="right"><label for="name">Nom</label> : </td>
		<td align="right"><input type="text" name="name" id="name" /></td>
		</tr>
		<tr>
		<td align="right"><label for="surname">Prenom</label> : </td>
		<td align="left"><input type="text" name="surname" id="surname" /></td>
		</tr>
		<tr>
		<td align="right"><label for="date">Date de naissance</label> : </td>
		<td align="left"><input type="date" value="10/04/2014" name="date" id="date"></td>
		</tr>
		<tr>
		<td align="right"><label for="tel">Téléphone</label> : </td>
		<td align="left"><input type="text" name="tel" id="tel" /></td>
		</tr>
		<tr>
		<td align="right"><label for="email">E-mail</label> : </td>
		<td align="left"><input type="text" name="email" id="email" /></td>
		</tr>
		<tr>
		<td align="right"><label for="pass">Mot de passe</label> : </td>
		<td align="left"><input type="password" name="pass" id="pass" /></td>
		</tr>
		<tr>
		<td align="right"><label for="confirm_pass">Confirmation</label> : </td>
		<td align="left"><input type="password" name="confirm_pass" id="confirm_pass" /></td>
		</tr>
		</table>
			<fieldset align="left">
			    <legend>Adress</legend>
			    <table>
				<tr>
				    <td align="right">Rue: </td>
				    <td><input type="text" size="30" name="rue" id="rue"></td>
				</tr>
				<tr>
				    <td align="right">Complément: </td>
				    <td align="left"><input type="text" size="30" name="complement" id="complement"></td>
				</tr>
				<tr>  
				    <td align="right">Ville: </td>
				    <td align="left"><input type="text" size="5" name="cp" id="cp">&nbsp;<input type="text" size="20" name="ville" id="ville"></td>
				</tr>
			    </table>
			</fieldset>
		<input type="submit" name="submit" value="Valider">	
		<input type="button" onclick="self.location.href='http://google.fr'" name="submit" value="Annuler">	    
	</form>
	</div>
	<div style="float:center; align:center;">
	    <img src="img/img.jpg" />
	</div>
    </body>
</html>
