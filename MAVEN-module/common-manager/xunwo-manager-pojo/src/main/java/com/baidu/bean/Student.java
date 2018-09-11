package com.baidu.bean;

public class Student {
    private int sid;
    private int age;
    private String sname;

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }
    public Student() {

    }
    public Student(int sid, int age, String sname) {
        this.sid = sid;
        this.age = age;
        this.sname = sname;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sid=" + sid +
                ", age=" + age +
                ", sname='" + sname + '\'' +
                '}';
    }


}

