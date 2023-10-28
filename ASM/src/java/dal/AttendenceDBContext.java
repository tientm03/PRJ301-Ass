/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Attendance;
import Model.Session;
import Model.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class AttendenceDBContext extends DBContext {

    public ArrayList<Attendance> getAttendancesBySession(int sesid) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql = "SELECT s.stuid,g.gname,s.stuname,s.stugender,s.studob,s.stuaddress,s.stumail,ISNULL(a.status,0) as [status],ISNULL(a.description,'') as [description],\n"
                    + "    ISNULL(a.att_datetime,GETDATE()) as att_datetime\n"
                    + "   FROM [Session] ses	INNER JOIN [Group] g ON g.gid = ses.gid\n"
                    + "						INNER JOIN Group_Student gs ON g.gid = gs.gid\n"
                    + "						INNER JOIN Student s ON s.stuid = gs.stuid\n"
                    + "						LEFT JOIN Attendance a ON a.sesid = ses.sesid AND s.stuid = a.stuid\n"
                    + "                 WHERE ses.sesid = 1";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Student s = new Student();
                Session ses = new Session();
                s.setId(rs.getString("stuid"));
                s.setName(rs.getString("stuname"));
                s.setGender(rs.getBoolean("stugender")); 
                s.setDob(rs.getDate("studob"));
                s.setAddress(rs.getString("stuaddress"));
                s.setEmail(rs.getString("stumail")); 
                ArrayList<Student> stu = new ArrayList<>();
                stu.add(s);
                att.setStudent(stu);
                
                ses.setId(sesid);
                ArrayList<Session> session = new ArrayList<>();
                session.add(ses);
                att.setSessions(session);
                att.setStatus(rs.getBoolean("status"));
                att.setDescription(rs.getString("description"));
                att.setDate(rs.getTimestamp("att_datetime"));
                atts.add(att);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendenceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }
}
