<%-- 
    Document   : Administrar Grupos
    Created on : Nov 6, 2017, 4:37:25 PM
    Author     : jorgevazquez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar Grupos</title>
    </head>
    <body>
        <h1>Administrar Grupos</h1>
        <form action="AdministrarServlet" method="post">
            <input type="submit" name="action" value="Alta Grupos">
            <input type="submit" name="action" value="Modificar Grupos">
            <input type="submit" name="action" value="Eliminar Grupos">
        </form>
    </body>
</html>
