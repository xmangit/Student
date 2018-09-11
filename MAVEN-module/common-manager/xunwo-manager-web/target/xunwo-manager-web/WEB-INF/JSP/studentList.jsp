<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: lxbggsmd
  Date: 2018/9/7
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js">
    </script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <script>
        $(function(){


             addStudentCommit=function(){
                var age=$("#studentage").val();
                var sname=$("#studentname").val();
                $.post("${pageContext.request.contextPath}/student/addStudent",{age:age,sname:sname},function(data){
                        var a=data.results;
                        alert(a);
                        if(a===1){
                            alert("ok");
                            window.location.reload();
                        }else{
                            alert("failure");
                            window.location.reload();
                        }
                    },"json"
                )
            };
             getStudentById=function(sid){

                $.post("${pageContext.request.contextPath}/student/getStudentById",{sid:sid},function(data){

                        $("#updatestudentid").val(data.sid);
                        $("#updatestudentage").val(data.age);
                        $("#updatestudentname").val(data.sname);
                    },"json"
                )
            };
            updateStudent=function(){
                var sid=$("#updatestudentid").val();
                var age=$("#updatestudentage").val();
                var sname=$("#updatestudentname").val();
                $.post("${pageContext.request.contextPath}/student/updateStudent",{sid:sid,age:age,sname:sname},function(data){
                        var a=data.results;
                        alert(a);
                        if(a===1){
                            alert("ok");
                            window.location.reload();
                        }else{
                            alert("failure");
                            window.location.reload();
                        }
                    },"json"
                )
            };
            deleteStudent= function(sid){
                $.post("${pageContext.request.contextPath}/student/deleteStudent",{sid:sid},function(aaa){
                    var a=aaa.results;
                    alert(a);
                    if(a===1){
                        alert("ok");
                        window.location.reload();
                    }else{
                        alert("failure");
                        window.location.reload();
                    }

                    },"json"
                )
            };
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').focus()
            })


        });
    </script>


</head>
<body>
    <div>
           <table class="table table-striped" >
               <tr>
                   <td>StudentID</td>
                   <td>StudentAGE</td>
                   <td>StudentNAME</td>
                   <td>
                       <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addModal">
                           Add
                       </button>
                   </td>
               </tr>
               <c:forEach items="${stulist}" var="s">
                   <tr>
                       <td>${s.sid}</td>
                       <td>${s.age}</td>
                       <td>${s.sname}</td>
                       <td>
                           <div class="dropdown">
                               <button class="btn btn-success" id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                   Set Up
                                   <span class="caret"></span>
                               </button>
                               <ul class="dropdown-menu" aria-labelledby="dLabel">
                                   <button class="btn btn-primary" data-toggle="modal" data-target="#updateModal" onclick='getStudentById(${s.sid})'>
                                       UpData
                                   </button>
                                   <button class="btn btn-danger" onclick='deleteStudent(${s.sid})'>
                                       Delete
                                   </button>
                               </ul>
                           </div>
                       </td>
                   </tr>
               </c:forEach>
           </table>

    </div>

    <div id="addPage">



        <!-- 添加模态框 -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <table class="table table-striped">
                                <tr>
                                    <td>
                                        input age
                                    </td>
                                    <td>
                                        <input type="text"  class="form-control" id="studentage">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        input yourname
                                    </td>
                                    <td>
                                        <input type="text" class="form-control"  id="studentname">
                                    </td>
                                </tr>
                            </table>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="addStudentCommit()">Add commit</button>
                    </div>
                </div>
            </div>
        </div>



        <!-- 修改模态框 -->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myUpdateLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myUpdateLabel">Modal title</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <table class="table table-striped">
                                <tr>
                                    <td>
                                        serial number
                                    </td>
                                    <td>
                                        <input type="text" id="updatestudentid" disabled="disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        input age
                                    </td>
                                    <td>
                                        <input type="text"  class="form-control" id="updatestudentage" >
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        input yourname
                                    </td>
                                    <td>
                                        <input type="text" class="form-control"  id="updatestudentname">
                                    </td>
                                </tr>
                            </table>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="updateStudent()">Update commit</button>
                    </div>
                </div>
            </div>
        </div>



</body>

</html>
