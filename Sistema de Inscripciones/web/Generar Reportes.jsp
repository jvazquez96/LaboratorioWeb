<%-- 
    Document   : Generar Reportes
    Created on : Nov 6, 2017, 4:37:39 PM
    Author     : jorgevazquez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generar reportes</title>
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
                    
                    var element1 = document.createElement("input");
                    element1.name = "nomina";
                    element1.type = "text";
                    element1.required = true;
                    div.appendChild(element1);
                }
                
                else if(valor == "rep2")
                {
                    document.getElementById("boton").disabled=false;
                    var element0 = document.createElement("label");
                    element0.innerHTML = "Materia: ";
                    div.appendChild(element0);
                    
                    var element1 = document.createElement("input");
                    element1.name = "materia";
                    element1.type = "text";
                    element1.required = true;
                    div.appendChild(element1);
                }
                
                else if(valor == "rep3")
                {
                    document.getElementById("boton").disabled=false;
                    var element0 = document.createElement("label");
                    element0.innerHTML = "Horario: ";
                    div.appendChild(element0);
                    
                    var element1 = document.createElement("input");
                    element1.name = "horario";
                    element1.type = "text";
                    element1.required = true;
                    div.appendChild(element1);
                }
                
                else if(valor == "rep4")
                {
                    document.getElementById("boton").disabled=false;
                    var element0 = document.createElement("label");
                    element0.innerHTML = "Profesor: ";
                    div.appendChild(element0);
                    
                    var element1 = document.createElement("input");
                    element1.name = "profesor";
                    element1.type = "text";
                    element1.required = true;
                    div.appendChild(element1);
                    
                    var element2 = document.createElement("label");
                    element2.innerHTML = " Horario: ";
                    div.appendChild(element2);
                    
                    var element3 = document.createElement("input");
                    element3.name = "horario";
                    element3.type = "text";
                    element3.required = true;
                    div.appendChild(element3);
                }
                
                else if(valor == "rep5")
                {
                    document.getElementById("boton").disabled=false;
                    var element0 = document.createElement("label");
                    element0.innerHTML = "Profesor: ";
                    div.appendChild(element0);
                    
                    var element1 = document.createElement("input");
                    element1.name = "profesor";
                    element1.type = "text";
                    element1.required = true;
                    div.appendChild(element1);
                    
                    var element2 = document.createElement("label");
                    element2.innerHTML = " Horario: ";
                    div.appendChild(element2);
                    
                    var element3 = document.createElement("input");
                    element3.name = "horario";
                    element3.type = "text";
                    element3.required = true;
                    div.appendChild(element3);
                }
                
                else if(valor == "rep6")
                {
                    document.getElementById("boton").disabled=false;
                    var element0 = document.createElement("label");
                    element0.innerHTML = "Día: ";
                    div.appendChild(element0);
                    
                    var element1 = document.createElement("input");
                    element1.name = "dia";
                    element1.type = "text";
                    element1.required = true;
                    div.appendChild(element1);
                    
                    var element2 = document.createElement("label");
                    element2.innerHTML = " Salón: ";
                    div.appendChild(element2);
                    
                    var element3 = document.createElement("input");
                    element3.name = "salon";
                    element3.type = "text";
                    element3.required = true;
                    div.appendChild(element3);
                }
            }
        </script>
    </head>
    <body>
        <h1>Generador de Reportes</h1>
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
</html>
