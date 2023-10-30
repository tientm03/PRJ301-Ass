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
import dal.StudentDBContext;
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
public class Report extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int gid = Integer.parseInt(request.getParameter("gid"));
        
        SessionDBContext sedb = new SessionDBContext();
        StudentDBContext sdb = new StudentDBContext();
        AttendenceDBContext adb = new AttendenceDBContext();
        
        ArrayList<Student> stu = sdb.getStuByGroupID(gid);
        
        ArrayList<Session> ses = sedb.getSessionsByGroupID(gid);
        
        ArrayList<Attendance> atts = adb.getAttendancesByGroupID(gid);
        
        ArrayList<Float> absent=adb.getAbsent(stu, ses, atts);
        for (Session se : ses) {
            se.getId();
        }
        for (Attendance attn : atts) {
            attn.isStatus();
        }
        
        for (Student attn : stu) {
            attn.getName();
        }
        
        request.setAttribute("absent", absent);
        request.setAttribute("student", stu);
        request.setAttribute("session", ses);
        request.setAttribute("att", atts); 
        request.getRequestDispatcher("attendancereport.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   

}
