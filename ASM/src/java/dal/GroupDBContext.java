/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Attendance;
import Model.Group;
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
public class GroupDBContext extends DBContext {

    public ArrayList<Group> getGroupByIntructorID(int iid) {
        ArrayList<Group> group = new ArrayList<>();
        try {
            String sql = "select g.gid,g.gname from [group] g join Instructor i on g.sup_iis = i.iid where i.iid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, iid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                group.add(g);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendenceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return group;

    }
}
