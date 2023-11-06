/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package objects;

import dal.IBaseModel;
import java.util.ArrayList;

/**
 *
 * @author sonnt
 */
public class Group implements IBaseModel {

    private int id;
    private String name;
    private Instructor supervisor;
    private ArrayList<Students> students = new ArrayList<>();
    private Subject subject;
    private ArrayList<Session> sessions = new ArrayList<>();
    private String iid;

    public Group() {
    }

    public String getIid() {
        return iid;
    }

    public void setIid(String iid) {
        this.iid = iid;
    }

    public Group(int id, String name, String iid) {
        this.id = id;
        this.name = name;
        this.iid = iid;
    }

    public Group(int id, String name) {
        this.id = id;
        this.name = name;
        supervisor = null;
        students = null;
        subject = null;
        sessions = null;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Instructor getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(Instructor supervisor) {
        this.supervisor = supervisor;
    }

    public ArrayList<Students> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Students> students) {
        this.students = students;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public ArrayList<Session> getSessions() {
        return sessions;
    }

    public void setSessions(ArrayList<Session> sessions) {
        this.sessions = sessions;
    }

}
