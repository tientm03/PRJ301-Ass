/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Attendance;
import Model.Session;
import Model.Student;
import dal.AttendenceDBContext;
import dal.SessionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Att extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SessionDBContext db = new SessionDBContext();
        int id = Integer.parseInt(request.getParameter("id"));
        Session ses = db.getSessions(id);
        request.setAttribute("ses",ses);
        
        AttendenceDBContext attDb = new AttendenceDBContext();
        ArrayList<Attendance> atts = attDb.getAttendancesBySession(id);

        request.setAttribute("atts", atts);
        request.getRequestDispatcher("att.jsp").forward(request, response);
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
            a.setStatus(request.getParameter("status"+stuid).equals("present"));
            a.setDescription(request.getParameter("description"+stuid));
            ses.getAtts().add(a);
        }
        SessionDBContext sesDB = new SessionDBContext();
        sesDB.addAttendences(ses);
        response.getWriter().println("done");
    }


}
