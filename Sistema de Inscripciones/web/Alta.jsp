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
           Boolean isAddingTeachers = 
                   (Boolean) request.getAttribute("teacher") == null? false : true;
           Boolean isAddingClassroom = 
                   (Boolean) request.getAttribute("classroom") == null? false: true;
           Boolean isAddingGroupes = 
                   (Boolean) request.getAttribute("groupes") == null ? false : true;
           String message = (String) request.getAttribute("mensaje");
               
            if (isAddingTeachers) {
                out.write("<h1> Agregando Maestros</h1>");
                if (message != null && !message.equals("")) {
                    out.write(message);
                }
        %>
        <body>
        <form action='AltaServlet' method='post'>
        <table cellspacing ='5' border='0'>
        <tr>
        <td align='left'>Nomina <input type='text' name='Nomina' required> </td>
        </tr>
        <tr>
        <td align='left'>Nombre <input type='text' name='Nombre' required> </td>
        </tr>
        <tr>
        <td align='left'>Telefono <input type='text' name='Telefono'></td>
        </tr>
        <tr>
        <td align='left'>Correo Electronico <input type='text' name='Correo Electronico' required></td>
        </tr>
        <tr>
        <td><br><input type='submit' value='submit'></td>
        </tr>
        </table>
        </form>
        </body>
        <% } else if (isAddingClassroom) {
                if (message != null && !message.equals("")) {
                    out.write(message);
                }%>
        <body>
        <form action='AltaServlet' method='post'>
        <table cellspacing ='5' border='0'>
        <tr>
        <td align='left'>Número <input type='text' name='Numero' required> </td>
        </tr>
        <tr>
        <td align='left'>Capacidad <input type='number' name='Capacidad' required> </td>
        </tr>
        <tr>
        <td align='left'>Administrador <input type='text' name='Administrador' required></td>
        </tr>
        <tr>
        <td><br><input type='submit' value='submit'></td>
        </tr>
        </table>
        </form>
        </body>
        <% } else if (isAddingGroupes) { %>
        <% }  else {%>
<!--        Pagina incorrecta-->
        <% } %>

</html>
