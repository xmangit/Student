package com.baidu.dao;

import com.baidu.bean.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentDao {

    /*获取学生测试*/
    public Object getStudent();
    /*获取学生列表*/
    public List getStudentList();
    /*添加学生信息*/
    public int addStudent(@Param("s") Student student);
    /*回显学生信息*/
    public Student getStudentById(@Param("s") Student student);
    /*修改学生信息*/
    public int updateStudent(@Param("s") Student student);
    /*删除学生信息*/
    public int  deleteStudent(@Param("s") Student student);

}
