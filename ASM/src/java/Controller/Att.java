/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Attendance;
import Model.Intructor;
import Model.Session;
import Model.Student;
import Model.User;
import dal.AttendenceDBContext;
import dal.IntructorDBContext;
import dal.SessionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class Att extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            SessionDBContext db = new SessionDBContext();
            int id = Integer.parseInt(request.getParameter("id"));
            Session ses = db.getSessions(id);
            

            AttendenceDBContext attDb = new AttendenceDBContext();
            ArrayList<Attendance> atts = attDb.getAttendancesBySession(id);
            
            
            IntructorDBContext idb = new IntructorDBContext();
            Intructor in = idb.getIntructorBySesid(id);

            User us = (User) session.getAttribute("account");
            if (in.getId() != us.getId()) {
                request.setAttribute("error", "Can't view");
                request.getRequestDispatcher("att.jsp").forward(request, response);
            } else {
                request.setAttribute("ses", ses);
                request.setAttribute("atts", atts);
                request.getRequestDispatcher("att.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Att.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session ses = new Session();
        ses.setId(Integer.parseInt(request.getParameter("sesid")));
        String[] stuids = request.getParameterValues("stuid");
        for (String stuid : stuids) {
            Attendance a = new Attendance();
            a.setSession(ses);
            Student s = new Student();
            s.setId(stuid);
            a.setStudent(s);
            a.setStatus(request.getParameter("status" + stuid).equals("present"));
            a.setDescription(request.getParameter("description" + stuid));
            ses.getAtts().add(a);
        }
        SessionDBContext sesDB = new SessionDBContext();
        sesDB.addAttendences(ses);
        response.getWriter().println("done");
    }

}
