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
        <title>Inscription</title>
    </head>
    <body>
        <table>
            <tr>
                <td><img src="img/boussole.jpg" width="70" height="70"/></td> 
                <td><strong><font size="7" color="#FF8000">IF'Routard</font></strong></td>
            </tr>
        </table>
        <hr>
        <div style="width:40%; display: block; margin: 0 auto; margin-top: 55px;">
            <div style="float:left;width:40%" align="right">
            <form method="post" action="/IFRoutardWeb/ActionServlet">
                <%-- Passage param Todo par champ HIDDEN, A changer --%> 
                <input type="hidden" name="todo" id="todo" value="processInscrpition" />
                <table style="width:100%">
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
                    <td align="left"><input style="width:98%" type="text" name="name" id="name" /></td>
                    </tr>
                    <tr>
                    <td align="right"><label for="surname">Prenom</label> : </td>
                    <td align="left"><input style="width:98%" type="text" name="surname" id="surname" /></td>
                    </tr>
                    <tr>
                    <td align="right"><label for="date">Date de naissance</label> : </td>
                    <td align="left"><input style="width:98%" type="date" value="10/04/2014" name="date" id="date"></td>
                    </tr>
                    <tr>
                    <td align="right"><label for="tel">Téléphone</label> : </td>
                    <td align="left"><input style="width:98%" type="tel" name="tel" id="tel" /></td>
                    </tr>
                    <tr>
                    <td align="right"><label for="email">E-mail</label> : </td>
                    <td align="left"><input style="width:98%" type="text" name="email" id="email" /></td>
                    </tr>
                    <tr>
                    <td align="right"><label for="pass">Mot de passe</label> : </td>
                    <td align="left"><input style="width:98%" type="password" name="pass" id="pass" /></td>
                    </tr>
                    <tr>
                    <td align="right"><label for="confirm_pass">Confirmation</label> : </td>
                    <td align="left"><input style="width:98%" type="password" name="confirm_pass" id="confirm_pass" /></td>
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
                                        <td align="left"><input type="text" size="5" name="cp" id="cp">&nbsp;<input type="text" size="18.5" name="ville" id="ville"></td>
                                    </tr>
                                </table>
                            </fieldset>
                    <input type="submit" name="submit" value="Valider">	
                    <input type="button" onclick="self.location.href='index.jsp'" name="submit" value="Annuler">	    
            </form>
            </div>
            <div style="width:50% ;float:right; align:center;">
                <img src="img/img.jpg" width="305" height="424"/>
            </div>
        </div>
    </body>
</html>
