    <%-- 
    Document   : Modificar Maestros
    Created on : Nov 6, 2017, 6:16:16 PM
    Author     : jorgevazquez
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Data.Maestro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar</title>
    </head>
    <body>
        <%            
        Boolean isModifyingTeachers = 
                   (Boolean) request.getAttribute("teacher") == null? false : true;
        Boolean isModifyingClassroom = 
                   (Boolean) request.getAttribute("classroom") == null? false: true;
        Boolean isModifyingGroupes = 
                   (Boolean) request.getAttribute("groupes") == null ? false : true;
        if (isModifyingTeachers) { 
            out.write("<h1>Modificando maestros</h1>");
            out.write("<h2>Lista de maestros disponibles para modificar</h2>");
            ArrayList<Maestro> maestros = (ArrayList<Maestro>)
                    request.getAttribute("teachers");
            for (Maestro maestro: maestros) {
                out.write("<table cellspacing ='5' border='2'>"
                + "<tr>"
                + "<td align='left'>Nomina: " 
                + maestro.getNomina()    
                + "</td>"
                + "<tr>"
                + "<td align='left'>Nombre "
                + maestro.getNombre()
                + "</td>"
                + "</table>");
            }
        %>
       <% } else if  (isModifyingClassroom) { %>
       <% } else if (isModifyingGroupes) { %>
       <% }%>
        <h1></h1>
    </body>
</html>
