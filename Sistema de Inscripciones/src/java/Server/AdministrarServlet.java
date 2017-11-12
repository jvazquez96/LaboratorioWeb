package Server;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DB.DatabaseConnection;
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
public class AdministrarServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        String url;
        if (action.equals("Alta Maestros")) {
            url = "/Alta.jsp";
            request.setAttribute("teacher", true);
        } else if (action.equals("Modificar Maestros")) {
            url = "/Modificar.jsp";
            request.setAttribute("beanName", "Data.Maestro");
            try {
                request.setAttribute("objectList", DatabaseConnection.getAllTeachers());
            } catch (SQLException ex) {
                Logger.getLogger(AdministrarServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("Modificar Cursos")) {
            url = "/Modificar.jsp";
            request.setAttribute("beanName", "Data.Curso");
            try {
                // TODO: Add the method for getting all courses here
                request.setAttribute("objectList", DatabaseConnection.getAllTeachers());
            } catch (SQLException ex) {
                Logger.getLogger(AdministrarServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (action.equals("Eliminar Maestros")) {
            url = "/Eliminar.jsp";
            request.setAttribute("teacher", true);
        } else {
            url = "";
        }
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
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
