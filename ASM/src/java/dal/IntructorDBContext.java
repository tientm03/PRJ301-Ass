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

/**
 *
 * @author Admin
 */
public class IntructorDBContext extends DBContext{
    public Intructor check(String username) throws SQLException {
        String sql =    "select i.iid,i.iname,i.igender,i.idob,i.iaddress,i.iemail,u.username,u.password,u.displayname from Instructor as i join [User] as u on i.iname = u.username \n" +
                        "where username=?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1,username);
        ResultSet rs = st.executeQuery();
        if(rs.next()){
            Intructor i = new Intructor();
            i.setId(rs.getInt("i.iid"));
            i.setName(rs.getString("i.iname"));
            i.setGender(rs.getBoolean("i.igender"));
            i.setDob(rs.getDate("i.idob"));
            i.setAddress(rs.getString("i.iaddress"));
            i.setEmail(rs.getString("i.iemail"));
            
            User us = new User();
            us.setUsername(rs.getString("u.username"));
            us.setPassword(rs.getString("u.password"));
            us.setDisplayname(rs.getString("u.displayname"));
            
            i.setUser(us);
            return i;
        }
        try {
            
        } catch (Exception e) {
        }
        return null;
    }
}
