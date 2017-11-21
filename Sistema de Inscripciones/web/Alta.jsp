<%-- 
    Document   : Alta Maestros
    Created on : Nov 6, 2017, 6:16:04 PM
    Author     : jorgevazquez
--%>

<%@page import="Data.Maestro"%>
<%@page import="Data.Salon"%>
<%@page import="Data.Horario"%>
<%@page import="Data.Materia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DB.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="welcome.jsp"%>
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
                                } else {
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
    <body>
        <div>
            <div class="demo-card-square mdl-card mdl-shadow--2dp center">
                <div class="mdl-card__title mdl-card--expand">
                    <h2 class="mdl-card__title-text">
                        <% } else if (isAddingClassroom) {
                            if (message != null && !message.equals("")) {
                                out.write(message);
                            } else {
                                out.write("Nuevo Salon");
                            }
                        %>
                    </h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <form action='AltaServlet' method='post'>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" name='Numero' type="text" id="numero" required="">
                           <label class="mdl-textfield__label" for="numero">Número</label>                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" name='Capacidad' type="number" id="capacidad" required>
                            <label class="mdl-textfield__label" for="capacidad">Capacidad</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" name='Administrador' type="text" id="admin" required>
                             <label class="mdl-textfield__label" for="admin">Administrador</label>
                         </div>
                         <input type="submit" value="Guardar" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                     </form>
                 </div>
             </div>
         </div>
    </body>
    <% } else if (isAddingGroupes) {
         if (message != null && !message.equals("")) {
                    out.write(message);
                }%>
        <body>
        <form action='AltaServlet' method='post'>
        <table class='mdl-data-table mdl-js-data-table mdl-shadow--2dp'align='left' cellspacing ='5' border='0' >
        <tr>
            <td align='left'> Clave <select name ='Clave' required>
            <% 
                ArrayList<Materia> materias = DatabaseConnection.getAllSubjects();
                for (Materia materia: materias) {            %>
                <option value='<%= materia.getClave()%>'><%= materia.getClave() %></option>
                <% } %>
                </select>
            </td>
        
        </tr>
        <tr>
        <td align='left'>Número de Grupo <input type='number' name='NumeroDeGrupo' required> </td>
        </tr>
        <tr>
        <td align='left'>Horario <select name='Horario' required> 
           <%
               ArrayList<Horario> horarios = DatabaseConnection.getAllSchedules();
               for (Horario horario: horarios) { %>
               <option value='<%= horario.getFrequencia()%>'><%= horario.getFrequencia() %></option>
               <% } %>
            </select>
        </td>
        </tr>
        <tr>
        <td align='left'>Horario Laboratorio <select name='HorarioLaboratorio'>
                 <%
               for (Horario horario: horarios) { %>
               <option value='<%= horario.getFrequencia()%>'><%= horario.getFrequencia() %></option>
               <% } %>
               <option value='Sin Horario'>Sin Horario</option>
               </select>
        </td>
        </tr>
        <tr>
        <td align='left'>Salón <select name='Salon' required> 
        <%
               ArrayList<Salon> salones = DatabaseConnection.getAllClassrooms();
               for (Salon salon: salones) { %>
               <option value='<%= salon.getNumero() %>'><%= salon.getNumero() %></option>
               <% } %>   
               </select>
        </td>
        </tr>
        <tr>
        <td align='left'>Ingles <select name='Ingles' required>
                <option value='Si'>Si</option>
                <option value='No'>No</option>
        </select>
        </td>
        </tr>
        <tr>
        <td align='left'>Honors <select name = 'Honors' required>
            <option value='Si'>Si</option>
            <option value='No'>No</option>
        </select>
        </td>
        </tr>
        </table>
        <table class='mdl-data-table mdl-js-data-table mdl-shadow--2dp'align='center' id='MyTable'>
        <tr>
            <td align='left'>Nomina de Profesor </td>
            <td align='left'>
                <select name='Nomina' required>
                    <% 
                        ArrayList<Maestro> maestros = DatabaseConnection.getAllTeachers();
                        for (Maestro maestro: maestros) {%>
                        <option name='Maestro' value='<%= maestro.getNomina() %>'><%= maestro.getNomina() %> </option>
                        <% } %>
                </select>
            </td>
            <td align='left'>Responsabilidad </td>
            <td align='left'><input type='numeric' name='Responsabilidad' required></td>
            <td align='left'><button type='button' onclick="maestros()">+</button></td>
        </tr>
        </table>
            <input type='submit' value='submit'>
        </form>
        </body>
    <% } else { %>
    <!--        Pagina incorrecta-->
    <% } %>

</html>
