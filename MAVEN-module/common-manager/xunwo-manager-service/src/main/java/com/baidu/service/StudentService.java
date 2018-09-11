package com.baidu.service;


import com.baidu.bean.Student;

import java.util.List;
import java.util.Map;

public interface StudentService {
    /*获取学生测试*/
    public Object getStudent();
    /*获取学生列表*/
    public List  getStudentList();
    /*添加学生信息*/
    public int  addStudent(Student student);
    /*回显学生信息*/
    public Student getStudentById(Student student);
    /*修改学生信息*/
    public int updateStudent(Student student);
    /*删除学生信息*/
    public int  deleteStudent(Student student);
}
