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
    <script>
        n = 0;
        function maestros()
        {
            var table = document.getElementById("MyTable");
            
            //MAESTRO y registro
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);

            var cell1 = row.insertCell(0);
            var element1 = document.createElement("p");
            element1.innerHTML = "Maestro";
            cell1.appendChild(element1);
            
            var cell2 = row.insertCell(1);
            var element2 = document.createElement("input");
            element2.type = "text";
            element2.name="Maestro:";
            cell2.appendChild(element2);
            
            var cell3 = row.insertCell(2);
            var element3 = document.createElement("p");
            element3.innerHTML = "Responsabilidad:";
            cell3.appendChild(element3);
            
            var cell4 = row.insertCell(3);
            var element4 = document.createElement("input");
            element4.type = "text";
            element4.name="Responsabilidad";
            cell4.appendChild(element4);
            
            
        }
    </script>
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
        <% } else if (isAddingGroupes) { 
        if (message != null && !message.equals("")) {
                    out.write(message);
                }%>
        <body>
        <form action='AltaServlet' method='post'>
        <table cellspacing ='5' border='0' >
        <tr>
        <td align='left'>Clave <input type='text' name='Clave' required> </td>
        </tr>
        <tr>
        <td align='left'>Número de Grupo <input type='number' name='NumeroDeGrupo' required> </td>
        </tr>
        <tr>
        <td align='left'>Horario <input type='text' name='Horario' required> </td>
        </tr>
        <tr>
        <td align='left'>Horario Laboratorio <input type='text' name='HorarioLaboratorio' required> </td>
        </tr>
        <tr>
        <td align='left'>Salón <input type='text' name='Salon' required> </td>
        </tr>
        <tr>
        <td align='left'>Ingles <input type='number' name='Ingles' required> </td>
        </tr>
        <tr>
        <td align='left'>Honors <input type='number' name='Honors' required></td>
        </tr>
        </table>
        <table id='MyTable'>
        <tr>
            <td align='left'>Nomina de Profesor </td>
            <td align='left'><input type='text' name='Maestro' required></td>
            <td align='left'>Responsabilidad </td>
            <td align='left'><input type='text' name='Responsabilidad' required></td>
            <td align='left'><button type='button' onclick="maestros()">+</button></td>
        </tr>
        </table>
            <input type='submit' value='submit'>
        </form>
        </body>
        <% }  else {%>
<!--        Pagina incorrecta-->
        <% } %>

</html>
