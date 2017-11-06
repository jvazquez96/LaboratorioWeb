<%-- 
    Document   : hello
    Created on : Nov 6, 2017, 12:55:26 PM
    Author     : jorgevazquez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Sistema de inscripciones</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Login</h1>
        <form action="Login" method="post">
            <table cellspacing="5" boder="0">
                <tr>
                    <td align="right">Usuario <input type="text" name="usuario"> </td>
                </tr>
                <tr>
                    <td align="right">Password <input type="password" name="password">
                </tr>
                <tr>
                    <td><br><input type="submit" value="submit"></td>
                </tr>
            </table>
        </form>
    </body>
</html>

