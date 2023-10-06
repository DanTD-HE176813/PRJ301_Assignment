/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package objects;

import java.util.Date;

/**
 *
 * @author Laptop
 */
public class Students {
    private String Sid;
    private String Sname;
    private String Sgroup;
    private String Scourse;
    private boolean Sgender;
    private Date Sdob;
    private Departments Sdept;
    
    public String getSid() {
        return Sid;
    }

    public String getSname() {
        return Sname;
    }

    public void setSname(String Sname) {
        this.Sname = Sname;
    }

    public String getGroup() {
        return Sgroup;
    }

    public void setGroup(String Sgroup) {
        this.Sgroup = Sgroup;
    }

    public String getScourse() {
        return Scourse;
    }

    public void setScourse(String Scourse) {
        this.Scourse = Scourse;
    }

    public boolean isSgender() {
        return Sgender;
    }

    public void setSgender(boolean Sgender) {
        this.Sgender = Sgender;
    }

    public Date getSdob() {
        return Sdob;
    }

    public void setSdob(Date Sdob) {
        this.Sdob = Sdob;
    }
    
}
