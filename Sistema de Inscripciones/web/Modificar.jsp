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
<br><br><br><br><br><br><br><br><br>
        <%
        final String TABLE_START = "<table class='mdl-data-table mdl-js-data-table mdl-shadow--2dp'align='center'>";
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
            //out.write("<th></th>");
            out.write("</tr>");
            out.write("</thead>");
            int iId = 0;
            int numRows = 0;


            // Print the table body
            out.write("<tbody>");
            for (Object objeto : objetos) {
                if (objeto == null) {
                    continue;
                }
                out.write("<tr>");
                for (Method getter: getters) {
                    out.write("<td ondblclick='editar(this, " +  Integer.toString(iId) + ")' class='dbl' id='" + Integer.toString(iId) +"'>");
                    // Tomar el getter del la instancia del objeto específico
                    Method getterEspecifico = objeto.getClass().getMethod(getter.getName());

                    // Hacer el 'get' a la instancia del objeto específico
                    String valor = getterEspecifico.invoke(objeto).toString();
                    out.write(valor);
                    out.write("</td>");
                    iId++;
                }
                //out.write("<td><button id='borrar' onclick='borrar(this)'>Borrar fila</button></td>");
                out.write("</tr>");
                numRows++;

            }
            int numCols = (iId - 1) / numRows;
            out.write("<tr>");
            // Para poner el signo de más hasta la derecha
            System.out.println("cols - " + numCols);
            while(numCols != 0){
                out.write("<td>");
                out.write("</td>");
                numCols--;
            }
            out.write("<td>");
            out.write("<form method='post' action='AdministrarServlet'>");
            out.write("<input type='text' name=" + "'" +className + "'" + " value=" + "'" + className+  "'" + " hidden='true' value=>");
            out.write("<button class='mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent'>");
            out.write("Agregar");
            out.write("</button>");
            //out.write("<input type='submit' value='+'>");
            out.write("</form>");
            out.write("</td>");
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
<!-- <form method="post" action="AdministrarServlet">
 <input type="text" name="<%= className %>" hidden="true" value="<%= className %>"/>
 <input type="submit" value="+"/>-->
<!-- </form>-->
    </body>
</html>
