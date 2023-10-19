/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Group {
    private int id;
    private String name;
    private Intructor supervisor;
    private ArrayList<Student> students = new ArrayList<>();
    private Subject subject;
    private ArrayList<Session> sessions = new ArrayList<>();

    public Group() {
    }

    public Group(int id, String name, Intructor supervisor, Subject subject) {
        this.id = id;
        this.name = name;
        this.supervisor = supervisor;
        this.subject = subject;
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

    public Intructor getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(Intructor supervisor) {
        this.supervisor = supervisor;
    }

    public ArrayList<Student> getStudents() {
        return students;
    }

    public void setStudents(ArrayList<Student> students) {
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
