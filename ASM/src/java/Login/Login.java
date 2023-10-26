/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Login;

import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.User;
import jakarta.servlet.http.Cookie;

/**
 *
 * @author Admin
 */
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
        
    }
    
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        UserDBContext udb = new UserDBContext();
        HttpSession session = request.getSession();
        try {
            User us = udb.check(u,p);
            if(us==null){
                request.setAttribute("error","username or password is wrong");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            else{
                session.setAttribute("account", us);
                String remember = request.getParameter("remember");
            if (remember != null) {
                Cookie c_user = new Cookie("user", u);
                Cookie c_pass = new Cookie("pass", p);
                c_user.setMaxAge(900);
                c_pass.setMaxAge(900);
                response.addCookie(c_user);
                response.addCookie(c_pass);
            }
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
        }

    }
}
