/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server;

import static DB.DatabaseConnection.isClassroomAdded;
import static DB.DatabaseConnection.isTeacherAdded;
import Data.Maestro;
import Data.Salon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jorgevazquez
 */
public class AltaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomina = request.getParameter("Nomina");
        String clave = request.getParameter("Clave");
        String numeroDeSalon = request.getParameter("Numero");
        Boolean isAddingTeacher = nomina != null;
        Boolean isAddingClassroom = numeroDeSalon != null;
        Boolean isAddingGroupes = clave != null;
        if (isAddingTeacher) {
            request.setAttribute("mensaje", addTeacher(request));
            request.setAttribute("teacher", true);
        } else if (isAddingClassroom) {
            request.setAttribute("mensaje", addClassroom(request));
            request.setAttribute("classroom", true);
        }
       
        String url = "/Alta.jsp";
        RequestDispatcher dispatcher = 
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
        
    }
    
    private String addTeacher(HttpServletRequest request) {
        String nomina = request.getParameter("Nomina");
        String nombre = request.getParameter("Nombre");
        String numero = request.getParameter("Telefono");
        String correo = request.getParameter("Correo Electronico");
        Maestro nuevoMaestro = new Maestro(nomina, nombre, correo, numero);
        String message = "";
        try {
            if (isTeacherAdded(nuevoMaestro)) {
                message = "Se ha agregado un nuevo maestro(a)";
            } else {
                message = "El maestro que se quiere agregar ya existe";
            }
        } catch (SQLException ex) {
            Logger.getLogger(AltaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }
    
    private String addClassroom(HttpServletRequest request) {
        String message = "";
        String numeroDeSalon = request.getParameter("Numero");
        int capacidad = Integer.valueOf(request.getParameter("Capacidad"));
        String administrador = request.getParameter("Administrador");
        Salon nuevoSalon = new Salon(numeroDeSalon, administrador, capacidad);
        try {
            if (isClassroomAdded(nuevoSalon)) {
                message = "Se ha agregado un nuevo salon";
            } else {
                message = "El salon que se quiere agregar ya existe";
            }
        } catch (SQLException ex) {
            Logger.getLogger(AltaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
