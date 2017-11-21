<%-- 
    Document   : Generar Reportes
    Created on : Nov 6, 2017, 4:37:39 PM
    Author     : jorgevazquez
--%>

<%@page import="Data.Salon"%>
<%@page import="Data.Horario"%>
<%@page import="Data.Materia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DB.DatabaseConnection"%>
<%@include file="welcome.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <script>
            function ajax_reporte(valor)
            {
                var div = document.getElementById("campos");
                
                while (div.hasChildNodes()) {
                    div.removeChild(div.lastChild);
                }
                
                if(valor == "x")
                    document.getElementById("boton").disabled=true;
                
                if(valor == "rep1")
                {
                    document.getElementById("boton").disabled=false;
                    var element0 = document.createElement("label");
                    element0.innerHTML = "Nomina: ";
                    div.appendChild(element0);
                    
                    var select = document.createElement("select");
                    <%
                    ArrayList<Maestro> maestros = DatabaseConnection.getAllTeachers();
                    for (Maestro maestro: maestros) { %>
                        select.options.add(new Option('<%= maestro.getNomina() %>', "nomina", false, false));
                    <% } %>
                    select.required = true;
                    div.appendChild(select);
                }
                
                else if(valor == "rep2")
                {
                    document.getElementById("boton").disabled=false;
                    var element0 = document.createElement("label");
                    element0.innerHTML = "Materia: ";
                    div.appendChild(element0);
                    
                    var select = document.createElement("select");
                    <% 
                    ArrayList<Materia> materias = DatabaseConnection.getAllSubjects();
                    for (Materia materia: materias) { %>
                        select.options.add(new Option('<%= materia.getClave()%>', 'materia', false, false));
                    <% } %>
                    select.required = true;
                    div.appendChild(select);
                }
                
                else if(valor == "rep3")
                {
                    document.getElementById("boton").disabled=false;
                    var element0 = document.createElement("label");
                    element0.innerHTML = "Horario: ";
                    div.appendChild(element0);
                    
                    var select = document.createElement("select");
                    <%
                    ArrayList<Horario> horarios = DatabaseConnection.getAllSchedules();    
                    for (Horario horario: horarios) {%>
                        select.options.add(new Option('<%= horario.getFrequencia()%>', 'horario'. false, false));
                    <% } %>
                    select.required = true;
                    div.appendChild(select);
                }
                
                else if(valor == "rep4")
                {
                    document.getElementById("boton").disabled=false;
                    var element0 = document.createElement("label");
                    element0.innerHTML = "Profesor: ";
                    div.appendChild(element0);
                    
                    var select1 = document.createElement("select");
                     <%
                    ArrayList<Maestro> maestros4 = DatabaseConnection.getAllTeachers();
                    for (Maestro maestro: maestros4) { %>
                        select1.options.add(new Option('<%= maestro.getNomina() %>', "profesor", false, false));
                    <% } %>
                    select1.required = true;
                    div.appendChild(select1);
                    
                    var element2 = document.createElement("label");
                    element2.innerHTML = " Horario: ";
                    div.appendChild(element2);
                    
                    var element3 = document.createElement("select");
                    <%
                    ArrayList<Horario> horarios4 = DatabaseConnection.getAllSchedules();    
                    for (Horario horario: horarios4) {%>
                        element3.options.add(new Option('<%= horario.getFrequencia()%>', 'horario'. false, false));
                    <% } %>
                    element3.required = true;
                    div.appendChild(element3);
                }
                
                else if(valor == "rep5")
                {
                    document.getElementById("boton").disabled=false;
                    var element0 = document.createElement("label");
                    element0.innerHTML = "Profesor: ";
                    div.appendChild(element0);
                    
                    var element1 = document.createElement("select");
                    <%
                    ArrayList<Maestro> maestros5 = DatabaseConnection.getAllTeachers();
                    for (Maestro maestro: maestros5) { %>
                        element1.options.add(new Option('<%= maestro.getNomina() %>', "profesor", false, false));
                    <% } %>
                    element1.required = true;
                    div.appendChild(element1);
                    
                    var element2 = document.createElement("label");
                    element2.innerHTML = " Horario: ";
                    div.appendChild(element2);
                    
                    var element3 = document.createElement("select");
                     <%
                    ArrayList<Horario> horarios5 = DatabaseConnection.getAllSchedules();    
                    for (Horario horario: horarios5) {%>
                        element3.options.add(new Option('<%= horario.getFrequencia()%>', 'horario'. false, false));
                    <% } %>
                    element3.required = true;
                    div.appendChild(element3);
                }
                
                else if(valor == "rep6")
                {
                    document.getElementById("boton").disabled=false;
                    var element0 = document.createElement("label");
                    element0.innerHTML = "Día: ";
                    div.appendChild(element0);
                    
                    var element1 = document.createElement("select");
                    element1.options.add(new Option("LuJu", "dia", false, false));
                    element1.options.add(new Option("MaVi", "dia", false, false));
                    element1.options.add(new Option("Mie", "dia", false, false));
                    element1.required = true;
                    div.appendChild(element1);
                    
                    var element2 = document.createElement("label");
                    element2.innerHTML = " Salón: ";
                    div.appendChild(element2);
                    
                    var element3 = document.createElement("select");
                    <%
                    ArrayList<Salon> salones = DatabaseConnection.getAllClassrooms();    
                    for (Salon salon: salones) {%>
                        element3.options.add(new Option('<%= salon.getNumero()%>' , 'salon', false, false));
                    <% } %> 
                    element3.required = true;
                    div.appendChild(element3);
                }
            }
        </script>
<!--    </head>-->
    <body>
<!--        <h1>Generador de Reportes</h1>-->
        <form name="myform" action="reportes.php">
        Reportes disponibles: 
        <select name="reporte" onchange="ajax_reporte(this.value)">
            <option value="x">Selecciona un reporte</option>
            <option value="rep1">Cursos impartidos por un profesor</option>
            <option value="rep2">Lista de grupos de una materia</option>
            <option value="rep3">Lista de salones disponibles en un determinado horario oficial</option>
            <option value="rep4">Lista de profesores que tienen clase en un determinado horario.</option>
            <option value="rep5">Lista de profesores que no tienen clase en un determinado horario </option>
            <option value="rep6">Lista de los cursos que se imparten un determinado día en un determinado
salón. </option>
        </select>
        <br>
         <br>
        <div id="campos"></div>
        <br>
        <input type="submit" id="boton" value="Generar reporte" disabled="true"/>
        </form>
    </body>
</div>
</html>
