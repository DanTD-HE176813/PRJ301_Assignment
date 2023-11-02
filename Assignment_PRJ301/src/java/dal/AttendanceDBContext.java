/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import jakarta.servlet.http.HttpSession;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import objects.Students;
import objects.Attendance;
import objects.Session;

public class AttendanceDBContext extends DBContext<Attendance> {

    public ArrayList<Attendance> getAttendancesBySession(int sesid) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql = "SELECT s.stuid,s.stuname,\n"
                    + "	  ISNULL(a.status,0) as [status]\n"
                    + "	  ,ISNULL(a.description,'') as [description],\n"
                    + "	  ISNULL(a.att_datetime,GETDATE()) as att_datetime\n"
                    + "	  FROM [Session] ses INNER JOIN [Group] g ON g.gid = ses.gid\n"
                    + "	  INNER JOIN Group_Student gs ON g.gid = gs.gid\n"
                    + "   INNER JOIN Student s ON s.stuid = gs.stuid\n"
                    + "	  LEFT JOIN Attendance a ON a.sesid = ses.sesid AND s.stuid = a.stuid\n"
                    + "	  WHERE ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Students s = new Students();
                Session ses = new Session();
                s.setId(rs.getInt("stuid"));
                s.setName(rs.getString("stuname"));
                att.setStudent(s);
                ses.setId(sesid);
                att.setSession(ses);
                att.setStatus(rs.getBoolean("status"));
                att.setDescription(rs.getString("description"));
                att.setDatetime(rs.getTimestamp("att_datetime"));
                atts.add(att);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    public ArrayList<Attendance> getAbsentBySession(int sesid) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql = "SELECT s.stuid, s.stuname, ISNULL(a.status, 0) as [status], ISNULL(a.description, '') as [description], ISNULL(a.att_datetime, GETDATE()) as att_datetime\n"
                    + "FROM [Session] ses\n"
                    + "INNER JOIN [Group] g ON g.gid = ses.gid\n"
                    + "INNER JOIN Group_Student gs ON g.gid = gs.gid\n"
                    + "INNER JOIN Student s ON s.stuid = gs.stuid\n"
                    + "LEFT JOIN Attendance a ON a.sesid = ses.sesid AND s.stuid = a.stuid\n"
                    + "WHERE ses.sesid = ? AND ISNULL(a.status, 0) = 0;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Students s = new Students();
                Session ses = new Session();
                s.setId(rs.getInt("stuid"));
                s.setName(rs.getString("stuname"));
                att.setStudent(s);
                ses.setId(sesid);
                att.setSession(ses);
                att.setStatus(rs.getBoolean("status"));
                att.setDescription(rs.getString("description"));
                att.setDatetime(rs.getTimestamp("att_datetime"));
                atts.add(att);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    @Override
    public Attendance get(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Students> listStudents(int gid) {
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
                Students student = new Students();
                student.setId(rs.getInt("stuid"));
                student.setName(rs.getString("stuname"));
                studentsList.add(student);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return studentsList;
    }

    public ArrayList<Attendance> getAttendanceInfo(int sesid) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql = "SELECT s.stuid, s.stuname, COALESCE(a.status, 0) AS status, gs.gid\n"
                    + "FROM [Group_Student] gs\n"
                    + "INNER JOIN [Student] s ON gs.stuid = s.stuid\n"
                    + "LEFT JOIN [Attendance] a ON gs.stuid = a.stuid\n"
                    + "LEFT JOIN [Session] ses ON a.sesid = ses.sesid\n"
                    + "WHERE gs.gid = ? AND ses.isAtt = 1;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Students s = new Students();
                Session ses = new Session();
                s.setId(rs.getInt("stuid"));
                s.setName(rs.getString("stuname"));
                att.setStudent(s);
                ses.setId(sesid);
                att.setSession(ses);
                att.setStatus(rs.getBoolean("status"));
                atts.add(att);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
