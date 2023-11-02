/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import objects.Attendance;
import objects.Session;
import objects.Students;
import objects.User;

/**
 *
 * @author Laptop
 */
public class AttendanceReportController extends BasedRequiredAuthenticationController {

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
        HttpSession session = request.getSession();
        int id = Integer.parseInt(session.getAttribute("idofuser").toString());
        SessionDBContext ss = new SessionDBContext();
        AttendanceDBContext attDb = new AttendanceDBContext();
        
        
        ArrayList<Session> index = ss.GetIndex(id);
        request.setAttribute("index", index);
        
        ArrayList<Students> students = attDb.listStudents(id);
        request.setAttribute("students", students);
        
        
        ArrayList<Session> notYet = ss.notYetSessions(id);
        request.setAttribute("notyet", notYet);
        
        ArrayList<Attendance> attendanceInfo = attDb.getAttendanceInfo(id);
        request.setAttribute("attendanceinfo", attendanceInfo);
        
        request.getRequestDispatcher("view/attendanceReport.jsp").forward(request, response);
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        processRequest(request, response);
    }

}
