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
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-blue.min.css" />
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <form action="Login" method="post" class="login">
            <div class="mdl-grid">
                <img src="images/login.png">
                <div class="mdl-textfield mdl-js-textfield">    
                    <input class="mdl-textfield__input" type="text" name="usuario" id="usuario">
                    <label class="mdl-textfield__label" for="usuario">Usuario</label>
                </div>
            </div> 
            <div class="mdl-textfield mdl-js-textfield">
                <input class="mdl-textfield__input" type="password" name="password" id="password">
                <label class="mdl-textfield__label" for="password">Contraseña</label>
            </div>
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent btn" type="submit">
                Entrar
            </button>
        </form>
    </body>
</html>

