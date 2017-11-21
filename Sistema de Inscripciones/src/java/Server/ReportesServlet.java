/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server;

import DB.DatabaseConnection;
import Data.Curso;
import Data.Maestro;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author miguelbanda
 */
public class ReportesServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
  String reporte = (String) request.getParameter("reporte");
        System.out.println("Reporte: " + reporte);
        String url = "/reporte.jsp";
        if("rep1".equals(reporte))
            {
                request.setAttribute("beanName", "Data.Curso");
                try {
                    System.out.println("Nomina: "+ request.getParameter("nomina"));
                    ArrayList<Curso> cursos = DatabaseConnection.getAllCoursesProfessor((String) request.getParameter("nomina"));
                    System.out.println("Curso: " + cursos.size());        
                    request.setAttribute("objectList", cursos);
                } catch (SQLException ex) {
                    Logger.getLogger(AdministrarServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                Logger.getLogger(ReportesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        else if("rep2".equals(reporte))
            {
                System.out.println("Materia: " + request.getParameter("materia"));
                request.setAttribute("beanName", "Data.Ensena");
                try {
                    request.setAttribute("objectList", DatabaseConnection.getListaMateria((String) request.getParameter("materia")));
                } catch (SQLException ex) {
                    Logger.getLogger(AdministrarServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                Logger.getLogger(ReportesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        else if("rep3".equals(reporte))
            {
                request.setAttribute("beanName", "Data.Salon");
                try {
                    request.setAttribute("objectList", DatabaseConnection.getSalonesDisponibles((String) request.getParameter("horario")));
                } catch (SQLException ex) {
                    Logger.getLogger(AdministrarServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                Logger.getLogger(ReportesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        else if("rep4".equals(reporte))
            {
                System.out.println("Horario: " + request.getParameter("horario"));
                request.setAttribute("beanName", "Data.Maestro");
                try {
                    request.setAttribute("objectList", DatabaseConnection.getTeachersScheduled((String) request.getParameter("horario")));
                } catch (SQLException ex) {
                    Logger.getLogger(AdministrarServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                Logger.getLogger(ReportesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        else if("rep5".equals(reporte))
            {
                request.setAttribute("beanName", "Data.Maestro");
                System.out.println("Horario: " + request.getParameter("horario"));
                try {
                    request.setAttribute("objectList", DatabaseConnection.getTeachersNotScheduled((String) request.getParameter("horario")));
                } catch (SQLException ex) {
                    Logger.getLogger(AdministrarServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                Logger.getLogger(ReportesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        else if("rep6".equals(reporte))
            {
                request.setAttribute("beanName", "Data.Curso");
                try {
                    request.setAttribute("objectList", DatabaseConnection.getCursosSalonHorario((String) request.getParameter("dia"), (String) request.getParameter("salon")));
                } catch (SQLException ex) {
                    Logger.getLogger(AdministrarServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                Logger.getLogger(ReportesServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReportesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReportesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
