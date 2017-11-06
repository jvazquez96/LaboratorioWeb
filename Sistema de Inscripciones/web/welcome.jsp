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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido!</title>
    </head>
    <body>
        <% 
            User user = (User) request.getAttribute("Usuario");
        %>
        <h1>Bienvenido(a) <%= user.getUsername()%></h1>
        <form action="MenuServlet" method="post">
            <input type="submit" name="action" value="Administrar Maestros">
            <input type="submit" name="action" value="Administrar Salones">
            <input type="submit" name="action" value="Administrar Grupos">
            <input type="submit" name="action" value="Generar Reportes">
        </form>
    </body>
</html>
