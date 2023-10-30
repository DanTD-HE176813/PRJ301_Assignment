/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.SessionDBContext;
import dal.TimeSlotDBContext;
import dal.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import objects.Session;
import objects.TimeSlot;
import java.sql.Date;
import util.DateUtils;
import static util.DateUtils.getSQLDatesBetween;

/**
 *
 * @author Laptop
 */
public class ViewScheduleController extends BasedRequiredAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = user.getId();
        request.setAttribute("id", id);
        String s_from = request.getParameter("from");
        String s_to = request.getParameter("to");
        ArrayList<Date> dates = new ArrayList<>();
        if (s_from == null) {
            dates = (ArrayList<Date>) DateUtils.getDatesOfCurrentWeek();
        } else {
            try {
                dates = (ArrayList<Date>) getSQLDatesBetween(s_from, s_to);
            } catch (ParseException ex) {
                Logger.getLogger(ViewScheduleController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        Date from = dates.get(0);
        Date to = dates.get(dates.size() - 1);

        TimeSlotDBContext timeDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = timeDB.list();

        SessionDBContext sesDB = new SessionDBContext();
        ArrayList<Session> sessions = sesDB.getSessions(id, from, to);

        request.setAttribute("slots", slots);
        request.setAttribute("dates", dates);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("sessions", sessions);

        request.getRequestDispatcher("view/schedule.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
