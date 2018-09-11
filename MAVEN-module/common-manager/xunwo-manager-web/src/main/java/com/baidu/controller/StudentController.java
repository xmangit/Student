package com.baidu.controller;

import com.baidu.bean.Student;
import com.baidu.service.StudentService;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping(value="/student")
public class StudentController {

    @Resource
     private StudentService studentService;
    /*获取学生测试*/
    @RequestMapping(value="/helloworld")
    public String helloworld(HttpServletRequest request){
        System.out.println("---------1-----------");
       /* Object s= studentService.getStudent();
        request.setAttribute("student",s);*/
        System.out.println("---------22333-----------");
        return "helloworld";
    }

    /*获取学生列表*/
    @RequestMapping(value="/getStudentList")
    public String getStudentList(HttpServletRequest request){
        System.out.println("---------getStudentList--STAR---------");
        List<Student> slist=new ArrayList<Student>();
        slist= studentService.getStudentList();
        request.setAttribute("stulist",slist);
        System.out.println("---------getStudentList--OK---------");
        return "studentList";
    }

    /*添加学生信息*/
    @RequestMapping(value="/addStudent")
    @ResponseBody
    public Map<String,Integer>  addStudent(Student student){
        System.out.println("---------addStudent--STAR----"+student+"-----");
        Map<String,Integer>  back1= new HashMap<String,Integer>();
        int cc;
        cc= studentService.addStudent(student);
        back1.put("results",cc);
        System.out.println("---------addStudent--OK---------");
        return back1;
    }

    /*回显学生信息*/
    @RequestMapping(value="/getStudentById")
    @ResponseBody
    public Student getStudentById(Student student){
        System.out.println("---------getStudentById--STAR---------");
       /* Map<String,String> back= new HashMap<String,String>();*/
       Student s= new Student();
        s= studentService.getStudentById(student);
        System.out.println("---------getStudentById--OK---------");
        return  s;
    }

    /*修改学生信息*/
    @RequestMapping(value="/updateStudent")
    @ResponseBody
    public Map<String,Integer> updateStudent(Student student){
        System.out.println("---------updateStudent--STAR---------");
         Map<String,Integer> back= new HashMap<String,Integer>();
         int cc;

        cc= studentService.updateStudent(student);
        back.put("results",cc);
        System.out.println("---------updateStudent--OK---------");
        return back;
    }

    /*删除学生信息*/
    @RequestMapping(value="/deleteStudent")
    @ResponseBody
    public Map<String,Integer>  deleteStudent(Student student){
        System.out.println("---------deleteStudent--STAR---------");
        Map<String,Integer> back= new HashMap<String,Integer>();
        int bb;
        bb=studentService.deleteStudent(student);
        back.put("results",bb);
        System.out.println("---------deleteStudent--OK---"+bb+"------");
        return back;
    }

}
