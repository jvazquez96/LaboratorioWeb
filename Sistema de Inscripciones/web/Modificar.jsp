<%--
    Document   : Modificar Maestros
    Created on : Nov 6, 2017, 6:16:16 PM
    Author     : jorgevazquez
--%>

<%@page import="java.lang.reflect.Method"%>
<%@page import="java.beans.PropertyDescriptor"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.beans.Introspector"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Data.Maestro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar</title>
        <script type="text/javascript"> //src="modificar.js">
            function alta() {
                //alert("alta");
                var col = document.getElementById('mytable').rows[0].cells.length;
                //alert(""+col);
                if (col == 5)
                {
                    window.open("http://localhost:8084/Sistema_de_Inscripciones/Alta.jsp?teacher=true");
                }
                else if (col == 3){
                    window.open("http://localhost:8084/Sistema_de_Inscripciones/Alta.jsp?classroom=true");
                }
            }
        </script>
    </head>
    <body>
        <%
        final String TABLE_START = "<table id='mytable' class='mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp'>";
        final String TABLE_END = "</table>";
            ArrayList objetos = (ArrayList) request.getAttribute("objectList");
            String beanName = (String) request.getAttribute("beanName");
            Class<?> tipoBean = Class.forName(beanName);
            String className = tipoBean.getName();
            //out.write("<h1>Modificando maestros</h1>");
            //out.write("<h2>Lista de maestros disponibles para modificar</h2>");

            // Get the names of the properties of inside the bean (e.g. Maestro, Salon, Grupo)
            ArrayList<Method> getters = new ArrayList();
            for (Method method : tipoBean.getMethods() ){
                // Get all getters from the bean
                String name = method.getName();
                if (name.startsWith("get") &&
                    method.getParameterTypes().length == 0 &&
                    !method.getName().toLowerCase().contains("class")) {
                    getters.add(method);
                }
            }
            out.write(TABLE_START);

            // Print the Table Header
            out.write("<thead>");
            out.write("<tr>");
            for (Method getter: getters) {
                out.write("<th>");
                out.write(getter.getName().replace("get",""));
                out.write("</th>");
            }
            out.write("</tr>");
            out.write("</thead>");


            // Print the table body
            out.write("<tbody>");
            out.write("<tr>");
            for (Object objeto : objetos) {
                if (objeto == null) {
                    continue;
                }
                out.write("<tr>");
                for (Method getter: getters) {
                    out.write("<td ondblclick='editar(this)'>");
                    // Tomar el getter del la instancia del objeto específico
                    Method getterEspecifico = objeto.getClass().getMethod(getter.getName());

                    // Hacer el 'get' a la instancia del objeto específico
                    String valor = getterEspecifico.invoke(objeto).toString();
                    out.write(valor);
                    out.write("</td>");
                }
                out.write("</tr>");

            }
            out.write("</tr>");
            out.write("</tbody>");
            out.write(TABLE_END);
            /*
             TABLE_START
            for (tipoBean objeto: objetos) {
                out.write(
                "<table class='mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp'>"
                + "<tr>"
                + "<td align='left'>Nomina: "
                + maestro.getNomina()
                + "</td>"
                + "<td align='left'><>Nombre: "
                + maestro.getNombre()
                + "</td>"
                + "</tr>"
                + "</table>");
            }
            */
        %>
        <% %>
        <form method="post" action="AdministrarServlet">
            <input type="text" name="<%= className %>" hidden="true" value="<%= className %>"/>
            <input type="submit" value="+"/>
        </form>
    </body>
</html>
