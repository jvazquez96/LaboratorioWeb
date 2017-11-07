<%-- 
    Document   : Alta Maestros
    Created on : Nov 6, 2017, 6:16:04 PM
    Author     : jorgevazquez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dar de alta</title>
    </head>
        <% 
           Boolean isAddingTeachers = (Boolean) request.getAttribute("teacher") == null? false : true;
           Boolean isAddingClassroom = (Boolean) request.getAttribute("classroom") == null? false: true;
            if (isAddingTeachers) {
                out.write("<h1> Agregando Maestros</h1>");
                String message = (String) request.getAttribute("mensaje");
                if (message != null && !message.equals("")) {
                    out.write(message);
                } else {
                    out.write("No se pudo insertar");
                }
                out.write("<body>"
                        + "<form action='AltaMaestro' method='post'> "
                        + "<table cellspacing ='5' border='0'>"
                        + "<tr>"
                        + "<td align='left'>Nomina <input type='text' name='Nomina'> </td> "
                        + "</tr>"
                        + "<tr>"
                        + "<td align='left'>Nombre <input type='text' name='Nombre'> </td>"
                        + "</tr>"
                        + "<tr>"
                        + "<td align='left'>Telefono <input type='text' name='Telefono'></td>"
                        + "</tr>"
                        + "<tr>"
                        + "<td align='left'>Correo Electronico <input type='text' name='Correo Electronico'></td>"
                        + "</tr>"
                        + "<tr>"
                        + "<td><br><input type='submit' value='submit'></td>"
                        + "</tr>"
                        + "</table>"
                        + "</form>"
                        + "</body>");
            } else if (isAddingClassroom) {
                out.write("<h1> Agregando Salones</h1>");
            } else {
                out.write("<h1> Agregando Grupos</h1>");
            }
        %>
</html>