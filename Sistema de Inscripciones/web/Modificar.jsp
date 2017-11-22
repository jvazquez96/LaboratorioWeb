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
<%@include file="welcome.jsp"%>
<br><br>
        <%
            ArrayList objects = (ArrayList) request.getAttribute("objectList");
            String beanName = (String) request.getAttribute("beanName");
            ArrayList<String> primaryKeyNames = (ArrayList<String>) request.getAttribute("primaryKeyNames");
            Class<?> beanType = Class.forName(beanName);

            final String TABLE_START = "<table class='mdl-data-table mdl-js-data-table mdl-shadow--2dp' align='center' id='" + beanName + "'>";
            final String TABLE_END = "</table>";
            // Get the names of the properties of inside the bean (e.g. Maestro, Salon, Grupo)
            ArrayList<Method> getters = new ArrayList();

            for (Method method : beanType.getMethods() ){
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
            ArrayList<String> headers = new ArrayList<>();
            String headerName;
            for (Method getter: getters) {
                headerName = getter.getName().replace("get","");
                headers.add(headerName);
                if (primaryKeyNames.contains(headerName)) {
                    out.write("<th data-is-primary-key='True'>");
                }
                else {
                    out.write("<th>");
                }
                out.write(headerName);
                out.write("</th>");
            }
            // Empty header for the column with the "Borrar" button
            out.write("<th></th>");

            out.write("</tr>");
            out.write("</thead>");

            int objectId = 0;
            int j = 0;
            int rows = 0;
            // Print the table body
            out.write("<tbody>");
            for (Object objeto : objects) {
                if (objeto == null) {
                    continue;
                }
                out.write("<tr>");
                for (Method getter: getters) {
                    out.write("<td class='" + headers.get(j) + rows +"' ondblclick='editar(this, " +  objectId + ")' style='cursor: pointer' id='" + objectId +"'>");
                    // Tomar el getter del la instancia del objeto específico
                    Method getterEspecifico = objeto.getClass().getMethod(getter.getName());

                    // Hacer el 'get' a la instancia del objeto específico
                    String valor = getterEspecifico.invoke(objeto).toString();
                    out.write(valor);
                    out.write("</td>");
                    objectId++;
                    j++;
                }
                out.write("<td><button onclick='eliminar(this)'>Eliminar</button></td>");
                out.write("</tr>");
                j = 0;
                rows++;

            }
            out.write("<td>");
            out.write("<form method='post' action='AdministrarServlet'>");
            out.write("<input type='text' name=" + "'" +beanName + "'" + " value=" + "'" + beanName+  "'" + " hidden='true' value=>");
            out.write("<button class='mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent'>");
            out.write("Agregar");
            out.write("</button>");
            out.write("</form>");
            out.write("</td>");
            out.write("</tr>");
            out.write("</tbody>");
            out.write(TABLE_END);
        %>
    </body>
</html>
