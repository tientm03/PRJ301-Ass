/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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
public class UserDBContext extends DBContext{
    public User check(String username, String password) throws SQLException {
        try {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[displayname]\n"
                + "  FROM [dbo].[User]\n"
                + "  where username=? and password=?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1,username);
        st.setString(2,password);
        ResultSet rs = st.executeQuery();
        if(rs.next()){
            User us = new User(rs.getInt("id"),rs.getString("username"), rs.getString("password"), rs.getString("displayname"));
            return us;
        }
        
            
        } catch (SQLException e) {
             Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

}
