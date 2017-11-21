<%-- 
    Document   : Alta Maestros
    Created on : Nov 6, 2017, 6:16:04 PM
    Author     : jorgevazquez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="welcome.jsp"%>
<br><br><br><br><br><br><br><br><br>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dar de alta</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-blue.min.css" />
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
            element2.name = "Maestro:";
            cell2.appendChild(element2);

            var cell3 = row.insertCell(2);
            var element3 = document.createElement("p");
            element3.innerHTML = "Responsabilidad:";
            cell3.appendChild(element3);

            var cell4 = row.insertCell(3);
            var element4 = document.createElement("input");
            element4.type = "text";
            element4.name = "Responsabilidad";
            cell4.appendChild(element4);


        }
    </script>
    <body>
        <div>
            <div class="demo-card-square mdl-card mdl-shadow--2dp center">
                <div class="mdl-card__title mdl-card--expand">
                    <h2 class="mdl-card__title-text">
                        <%            Boolean isAddingTeachers
                                    = (Boolean) request.getAttribute("teacher") == null ? false : true;
                            Boolean isAddingClassroom
                                    = (Boolean) request.getAttribute("classroom") == null ? false : true;
                            Boolean isAddingGroupes
                                    = (Boolean) request.getAttribute("groupes") == null ? false : true;
                            String message = (String) request.getAttribute("mensaje");

                            if (isAddingTeachers) {
                                if (message != null && !message.equals("")) {
                                    out.write(message);
                                }else{
                                    out.write("Nuevo Maestro");
                                }
                        %>
                    </h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <form action='AltaServlet' method='post'>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" name='Nomina' type="text" id="nomina" required="">
                            <label class="mdl-textfield__label" for="nomina">Nomina</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" name='Nombre' type="text" id="nombre" required>
                            <label class="mdl-textfield__label" for="nombre">Nombre</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" name='Telefono' type="text" id="telefono" pattern="[0-9]*" required>
                            <label class="mdl-textfield__label" for="telefono">Telefono</label>
                            <span class="mdl-textfield__error">Solo números</span>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" name='Correo Electronico' type="text" id="correo" required>
                            <label class="mdl-textfield__label" for="correo">Correo Electronico</label>
                        </div>
                        <input type="submit" value="Guardar" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    </form>
                </div>
            </div>
        </div>

    </body>
    <% } else if (isAddingClassroom) {
        if (message != null && !message.equals("")) {
            out.write(message);
        }%>
    <body>
        <form action='AltaServlet' method='post'>
            <table class='mdl-data-table mdl-js-data-table mdl-shadow--2dp'align='center' cellspacing ='5' border='0'>
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
            <table class='mdl-data-table mdl-js-data-table mdl-shadow--2dp'align='center' cellspacing ='5' border='0' >
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
            <table class='mdl-data-table mdl-js-data-table mdl-shadow--2dp'align='center' id='MyTable'>
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
    <% } else {%>
    <!--        Pagina incorrecta-->
    <% }%>

</html>
