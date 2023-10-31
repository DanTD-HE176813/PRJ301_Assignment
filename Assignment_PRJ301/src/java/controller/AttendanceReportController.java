/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import dal.SessionDBContext;
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
import objects.User;

/**
 *
 * @author Laptop
 */
public class AttendanceReportController extends BasedRequiredAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        int id = user.getId();
        AttendanceDBContext attDb = new AttendanceDBContext();
        ArrayList<Attendance> students = attDb.list(id);
        request.setAttribute("students", students);
        
        
        
        
        
        
//        AttendanceDBContext att = new AttendanceDBContext();
//        ArrayList<Attendance> students = att.list(id);
//        request.setAttribute("students", students);
        request.getRequestDispatcher("view/attendanceReport.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
