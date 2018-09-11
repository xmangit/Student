package com.baidu.service.impl;

import com.baidu.bean.Student;
import com.baidu.dao.StudentDao;
import com.baidu.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {

    @Resource
    private StudentDao studentDao;
    /*获取学生测试*/
    @Override
    public Object getStudent() {
        Object s=studentDao.getStudent();
        return s;
    }
    /*获取学生测试*/
    @Override
    public List getStudentList() {
        /* Map<String,String> back= new HashMap<String,String>();*/
        /*List<Student> slist=new ArrayList<Student>();*/
        List<Student> slist=new ArrayList<Student>();
        slist=studentDao.getStudentList();
        return slist;
    }
    /*添加学生信息*/
    @Override
    public int addStudent(Student student) {
        int cc;
        cc=studentDao.addStudent(student);
        System.out.println("---------addStudent--3----"+cc+"-----");


        return cc;
    }
    /*回显学生信息*/
    @Override
    public Student getStudentById(Student student) {
        Student s=new Student();
        s=studentDao.getStudentById(student);
        return s;
    }
    /*修改学生信息*/
    @Override
    public int updateStudent(Student student) {
        int cc;
        cc=studentDao.updateStudent(student);
        System.out.println("============"+cc);
        return cc;
    }
    /*删除学生信息*/
    @Override
    public int  deleteStudent(Student student) {

            int aa;
            aa=studentDao.deleteStudent(student);
            System.out.println("============"+aa);
            return aa;


    }

}
