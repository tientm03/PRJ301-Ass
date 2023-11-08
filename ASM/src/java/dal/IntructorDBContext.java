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

    public Intructor getIntructorBySesid(int sesid) throws SQLException {
        Intructor i = new Intructor();
        String sql = "select i.iid from Instructor i join [Session] s on i.iid = s.iid where s.sesid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sesid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                i.setId(rs.getInt("iid"));
                i.setName(rs.getString("iname"));
                i.setGender(rs.getBoolean("igender"));
                i.setDob(rs.getDate("idob"));
                i.setAddress(rs.getString("iaddress"));
                i.setEmail(rs.getString("imail"));
                return i;
            }

        } catch (SQLException e) {
            Logger.getLogger(IntructorDBContext.class.getName()).log(Level.SEVERE, null, e);

        }
        return i;
    }

}
