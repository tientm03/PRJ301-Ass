/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Attendance;
import Model.Group;
import Model.Intructor;
import Model.Session;
import Model.Student;
import Model.User;
import dal.AttendenceDBContext;
import dal.GroupDBContext;
import dal.IntructorDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
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
public class Report extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) {
            request.setAttribute("error", "You have to log in first!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            int iid = Integer.parseInt(request.getParameter("iid"));
            User us = (User) session.getAttribute("account");
            if (iid != us.getId()) {
                request.setAttribute("error", "Can't view");
                request.getRequestDispatcher("attendancereport.jsp").forward(request, response);
            } else {
                GroupDBContext gdb = new GroupDBContext();
                ArrayList<Group> group = gdb.getGroupByIntructorID(iid);
                request.setAttribute("group", group);
                request.getRequestDispatcher("attendancereport.jsp").forward(request, response);
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int gid = Integer.parseInt(request.getParameter("gid"));
        int iid = Integer.parseInt(request.getParameter("iid"));
        SessionDBContext sedb = new SessionDBContext();
        StudentDBContext sdb = new StudentDBContext();
        AttendenceDBContext adb = new AttendenceDBContext();

        GroupDBContext gdb = new GroupDBContext();
        
        //lay ra tat ca group ma intructor day
        ArrayList<Group> group = gdb.getGroupByIntructorID(iid);
        request.setAttribute("group", group);
        
        //lay ra sinh vien trong lop co gid tuong ung
        ArrayList<Student> stu = sdb.getStuByGroupID(gid);
        request.setAttribute("student", stu);
        
        //lay ra tat ca session ma lop do phai hoc
        ArrayList<Session> ses = sedb.getSessionsByGroupID(gid);
        request.setAttribute("sessions", ses);

        //lay ra bangdiemdanh cua lop do group co gid tuong ung
        ArrayList<Attendance> atts = adb.getAttendancesByGroupID(gid);
        request.setAttribute("att", atts);

        //tinh so buoi nghi cua sinh vien
        ArrayList<Float> absent = adb.getAbsent(stu, ses, atts);
        request.setAttribute("absent", absent);

        //lay ra 1 session theo gid
        Session s = sedb.get1SessionsByGroupID(gid);
        request.setAttribute("session", s); 
        
        //lay ra nhung session chua duoc diem danh
        ArrayList<Session> sesnotatt = sedb.notYetSessions(gid);
        request.setAttribute("sesnotatt", sesnotatt);

        request.getRequestDispatcher("attendancereport.jsp").forward(request, response);

    }

}
