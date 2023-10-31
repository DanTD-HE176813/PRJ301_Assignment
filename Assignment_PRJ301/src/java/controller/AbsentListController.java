/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AttendenceDBContext;
import dal.SessionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import objects.Attendance;
import objects.Session;
import objects.User;

/**
 *
 * @author Laptop
 */
public class AbsentListController extends BasedRequiredAuthenticationController {
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        SessionDBContext db = new SessionDBContext();
        int id = Integer.parseInt(request.getParameter("sesid"));
        Session ses = db.getSessions(id);
        request.setAttribute("ses",ses);
        AttendenceDBContext attDb = new AttendenceDBContext();
        ArrayList<Attendance> absent = attDb.getAbsentBySession(id);
        request.setAttribute("absentstudents", absent);
        
        request.getRequestDispatcher("view/absentList.jsp").forward(request, response);
    }

}
