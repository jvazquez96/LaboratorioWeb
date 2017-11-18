<%-- 
    Document   : welcome
    Created on : Nov 6, 2017, 12:51:44 PM
    Author     : jorgevazquez
--%>

<%@page import="Data.User"%>
<%@page import="Data.Maestro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-blue.min.css" />
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <script src="js/menu.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>Menu Principal</title>
</head>
<body>
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        <header class="mdl-layout__header">
            <div class="mdl-layout__header-row">
                <! -- Title -->
                <span class="mdl-layout-title">Sistema de inscripciones</span>
                <div class="mdl-layout-spacer"></div>
                <nav class="mdl-navigation mdl-layout--large-screen-only">
                    <a class="mdl-navigation__link" href="#" onclick="administrarMaestros()">Administrar Maestros</a>
                    <form action="MenuServlet" method="post">
                        <input hidden type="submit" name="action" value="Administrar Maestros" id="admin_maestros">
                    </form>
                    <a class="mdl-navigation__link" href="#" onclick="administrarSalones()">Administrar Salones</a>
                    <form action="MenuServlet" method="post">
                        <input hidden type="submit" name="action" value="Administrar Salones" id="admin_salones">
                    </form>
                    <a class="mdl-navigation__link" href="#" onclick="administrarGrupos()">Administrar Grupos</a>
                    <form action="MenuServlet" method="post">
                        <input hidden type="submit" name="action" value="Administrar Grupos" id="admin_grupos">
                    </form>
                    <a class="mdl-navigation__link" href="#" onclick="generarReportes()">Generar Reportes</a>
                    <form action="MenuServlet" method="post">
                        <input hidden type="submit" name="action" value="Generar Reportes" id="gen_reportes">
                    </form>
                </nav>
            </div>
        </header>
        <main class="mdl-layout__content">
            <div class="page-content">
                <% User user = (User) request.getAttribute("Usuario");%>
                <h2>Bienvenido(a) <%= user.getUsername()%></h2>
            </div>
        </main>
    </div>
</body>
</html>
