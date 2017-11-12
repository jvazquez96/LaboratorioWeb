<%-- 
    Document   : Administrar Salones
    Created on : Nov 6, 2017, 4:35:16 PM
    Author     : jorgevazquez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar Salones</title>
    </head>
    <body>
        <h1>Administrar Salones</h1>
        <form action="AdministrarServlet" method="post">
            <input type="submit" name="action" value="Alta Salones">
            <input type="submit" name="action" value="Modificar Salones">
            <input type="submit" name="action" value="Eliminar Salones">
        </form>
    </body>
</html>
