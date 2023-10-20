/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Attendance {

    private boolean status;
    private String description;
    private Date date;
    private ArrayList<Student> student = new ArrayList<>();
    private ArrayList<Session> sessions = new ArrayList<>();

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public ArrayList<Student> getStudent() {
        return student;
    }

    public void setStudent(ArrayList<Student> student) {
        this.student = student;
    }

    public ArrayList<Session> getSessions() {
        return sessions;
    }

    public void setSessions(ArrayList<Session> sessions) {
        this.sessions = sessions;
    }

}
