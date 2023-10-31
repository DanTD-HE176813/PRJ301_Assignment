/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import objects.Students;

/**
 *
 * @author Laptop
 */
public class StudentDBContext extends DBContext<Students> {

    @Override
    public Students get(Students model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

   
    public ArrayList<Students> list(int gid) {
        ArrayList<Students> studentsList = new ArrayList<>();
    try {
        String sql = "SELECT s.stuid, s.stuname\n"
                    + "FROM Student s\n"
                    + "INNER JOIN Group_Student gs ON s.stuid = gs.stuid\n"
                    + "WHERE gs.gid = ?;";

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setInt(1, gid);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Students s = new Students();
            s.setId(rs.getInt("stuid"));
            s.setName(rs.getString("stuname"));
            studentsList.add(s);
            
        }
    } catch (SQLException ex) {
        Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
    }
    return studentsList;
    }

    @Override
    public ArrayList<Students> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
