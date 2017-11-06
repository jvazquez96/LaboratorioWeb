<%-- 
    Document   : welcome
    Created on : Nov 6, 2017, 12:51:44 PM
    Author     : jorgevazquez
--%>

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
            Maestro maestro = (Maestro) request.getAttribute("Maestro");
        %>
        <h1>Bienvenido(a) <%= maestro.getNombre()%></h1>
        <a href="Menu"
    </body>
</html>
