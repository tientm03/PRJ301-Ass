/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package TimeTableController;

import Model.Session;
import Model.TimeSlot;
import dal.SessionDBContext;
import dal.TimeSlotDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import DateUtils.Utils;
import static DateUtils.Utils.getSQLDatesBetween;


/**
 *
 * @author Admin
 */
public class TimeTable extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String s_from = request.getParameter("from");
        String s_to = request.getParameter("to");
        ArrayList<Date> dates = new ArrayList<>();
        if(s_from ==null)// this week
        {
            dates = (ArrayList<Date>) Utils.getDatesOfCurrentWeek();
        }
        else
        {
            try {
                dates = (ArrayList<Date>) getSQLDatesBetween(s_from,s_to);
            } catch (ParseException ex) {
                Logger.getLogger(TimeTable.class.getName()).log(Level.SEVERE, null, ex);
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

        request.getRequestDispatcher("schedule.jsp").forward(request, response);

    }

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        try {
//            processRequest(request, response);
//        } catch (SQLException | ParseException ex) {
//            Logger.getLogger(TimeTable.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    } 
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        try {
//            processRequest(request, response);
//        } catch (SQLException | ParseException ex) {
//            Logger.getLogger(TimeTable.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }

}
