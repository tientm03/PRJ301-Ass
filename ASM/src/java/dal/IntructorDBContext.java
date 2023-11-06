/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Intructor;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class IntructorDBContext extends DBContext {

    public Intructor check(String displayname) throws SQLException {
        String sql = "select i.iid,i.iname,i.igender,i.idob,i.iaddress,i.imail,u.username,u.password,u.displayname from Instructor as i "
                + "join [User] as u on i.iid = u.id where displayname = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, displayname);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Intructor i = new Intructor();
                i.setId(rs.getInt("iid"));
                i.setName(rs.getString("iname"));
                i.setGender(rs.getBoolean("igender"));
                i.setDob(rs.getDate("idob"));
                i.setAddress(rs.getString("iaddress"));
                i.setEmail(rs.getString("imail"));

                User us = new User();
                us.setUsername(rs.getString("username"));
                us.setPassword(rs.getString("password"));
                us.setDisplayname(rs.getString("displayname"));

                i.setUser(us);
                return i;
            }

        } catch (SQLException e) {
            Logger.getLogger(IntructorDBContext.class.getName()).log(Level.SEVERE, null, e);

        }
        return null;
    }

  
}
