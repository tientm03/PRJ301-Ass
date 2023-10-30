/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Session;
import Model.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class StudentDBContext extends DBContext {

    public ArrayList<Student> getStuByGroupID(int gid) {
        ArrayList<Student> stu = new ArrayList<>();
        try {
            String sql = "select s.stuid,s.stuname,s.stugender,s.studob,s.stuaddress,s.stumail from Student s join [Group_Student] as gs on s.stuid = gs.stuid\n"
                    + "						join [Group] as g on gs.gid = g.gid\n"
                    + "						where g.gid =?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Student s = new Student();
                s.setId(rs.getString("stuid"));
                s.setName(rs.getString("stuname"));
                s.setDob(rs.getDate("studob"));
                s.setGender(rs.getBoolean("stugender"));
                s.setAddress(rs.getString("stuaddress"));
                s.setEmail(rs.getString("stumail"));
                stu.add(s);
            }
        } catch (SQLException ex) {

        }
        return stu;

    }
}
