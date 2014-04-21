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
    <style>
        hr.vertical
        {
           width: 0px;
           height: 100%; /* or height in PX */
        } 
    </style>
    <body>
        <h1 align="center" style="margin:0;"><font size="30" face="Comic sans MS">IF'Routard</font></h1>
        <h2 align="center" style="margin:0;"><font size="6" face="Comic sans MS">L'agence de voyage des insaliens</font></h2>
        <div style="width:50%; display: block; margin: 0 auto; margin-top: 55px;">
        <div style="width:100%">
            <img src="img/ClientConnexion.jpg" height="100%" width="100%" id="img"/>
	</div>
        <div style="width:70%; height:200px; display: block; margin: 0 auto;">
        <div style="width:2px; height:200px; display: inline-block; background-color:black">
        </div>
        <div style="width:49%; float:left" align="right">
            <br>
            <form method="post" action="/IFRoutardWeb/ActionServlet">
                <table style="width:100%">
                    <tr>
                        <td style="width:95%" align="right"><font size="5"face="Comic sans MS">Je suis déjà client(e)</font><td>
                    </tr>
                </table>
                <br>
                <table style="width:100%">
                    <input type="hidden" name="todo" id="todo" value="processLogin" />
                    <tr style="width:95%">
                        <td style="width:40%" align="right"><font face="Comic sans MS">E-mail &nbsp;&nbsp;&nbsp;&nbsp;</font></td>
                        <td style="width:60%" align="left"><input style="width:90%" type="text" name="email" id="email" /></td>
                    </tr>
                </table>
                <br>
                <table style="width:100%">
                    <tr style="width:95%">
                        <td style="width:40%" align="right"><font face="Comic sans MS">Mot de passe &nbsp;&nbsp;&nbsp;&nbsp;</font></td>
                        <td style="width:60%" align="left"><input style="width:90%" type="password" name="pass" id="pass" /></td> 
                    </tr> 
                </table>
                <table style="width:37%">
                    <tr style="width:70%">
                        <td style="width:40%" align="left"><input type="submit" name="submit" value="Me connecter"/></td>
                    </tr> 
                </table>
            </form>
        </div>
                
        <div style="width:49%; float:right" align="left">
            <br>
                <table style="width:100%" 
                    <tr>
                        <td style="width:95%" align="left"><font size="5"face="Comic sans MS">Enregistrement</font><td>
                    </tr>
                </table>
            <br>
            <br>
	<input style="width:300px;height:50px" type="button" value ="M'inscrire et accéder aux offres" onclick="self.location.href='ClientInscription.jsp'" />
        </div>
        </div>
    </body>
</html>
