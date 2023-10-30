/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.http.HttpSession;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import objects.Group;
import objects.Session;
import objects.Students;

/**
 *
 * @author sonnt
 */
public class StudentDBContext extends DBContext<Students> {

    @Override
    public Students get(Students model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Students> list() {
        ArrayList<Students> students = new ArrayList<>();
        try {
            String sql = "SELECT s.stuid,s.stuname\n"
                    + "FROM [Student] AS s\n"
                    + "LEFT JOIN [Group_Student] AS g ON s.stuid = g.stuid WHERE g.gid = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setString(1, String.valueOf(ss.getGroup()));
            
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Students s = new Students();
                s.setId(rs.getInt("stuid"));
                s.setName(rs.getString("stuname"));

                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return students;

    }

}
