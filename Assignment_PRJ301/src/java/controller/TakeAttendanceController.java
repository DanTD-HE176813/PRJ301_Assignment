/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttendenceDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import dal.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import objects.Attendance;
import objects.Session;
import objects.Students;

/**
 *
 * @author Laptop
 */
public class TakeAttendanceController extends BasedRequiredAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        SessionDBContext db = new SessionDBContext();
        int id = Integer.parseInt(request.getParameter("id"));
        Session ses = db.getSessions(id);
        request.setAttribute("ses",ses);
        
        AttendenceDBContext attDb = new AttendenceDBContext();
        ArrayList<Attendance> atts = attDb.getAttendancesBySession(id);
        request.setAttribute("students", atts);
        request.getRequestDispatcher("view/takeAttendance.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        Session ses = new Session();
        ses.setId(Integer.parseInt(request.getParameter("sesid")));
        String[] stuids = request.getParameterValues("stuid");
        for (String stuid : stuids) {
            Attendance a = new Attendance();
            a.setSession(ses);
            Students s = new Students();
            s.setId(Integer.parseInt(stuid));
            a.setStudent(s);
            a.setStatus(request.getParameter("status"+stuid).equals("present"));
            a.setDescription(request.getParameter("description"+stuid));
            ses.getAtts().add(a);
        }
        SessionDBContext sesDB = new SessionDBContext();
        sesDB.addAttendences(ses);
        response.getWriter().println("done");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
