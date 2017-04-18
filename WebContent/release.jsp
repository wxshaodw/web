<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.csxy.gggl.domain.Department"%>
<%@page import="com.csxy.gggl.domain.Employee"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>
<% List<Employee> employee_list=(List<Employee>)session.getAttribute("Employ_list"); %>
<% List<Department> department_list=(List<Department>)session.getAttribute("Department_list"); %>
    <style type="text/css">
<!--
.STYLE1 {font-size: 12px}
a:link {
color: #FFFFFF;
text-decoration: none;
}
a:visited {
text-decoration: none;
}
a:hover {
text-decoration: none;
}
a:active {
text-decoration: none;
}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" media="screen" />
<script src="http://code.jquery.com/jquery.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>
<table>
<tr align="center"><h2 align="center">新建公告</h2></tr>
<tr>
<table align="center" border="1" >
    <tr>
        <td>标题：</td>
        <td width="500px">
        <input type="text" name="title" placeholder="请输入标题内容" width="80px"/>
        </td>
    </tr>
    <tr>
        <td>类别：</td>
        <td>
            <select name="type">
                <option value=""></option>
                <option value="决定">决定</option>
                <option value="通知">通知</option>
                <option value="报告">报告</option>
                <option value="其他">其他</option>
            </select>
        </td>
    </tr>
    <tr>
        <td >相关人员:</td>
        <td width="350px" height="100px"><textarea id="employee" readonly="readonly" rows="4" cols="40" style="resize: none;"></textarea>
        <input class="btn btn-link" type="button" name="add_employee" value="增加"  onClick="locking('employee_add')">
        </td>
    </tr>
    <tr>
        <td>是否顶置：</td>
        <td width="500px">
        <select name="top">
            <option value="未顶置">未顶置</option>
            <option value="已顶置">已顶置</option>
        </select>
        </td>
    </tr>
        <tr>
        <td>发布时间：</td>
        <td width="500px"><input type="date" id="release_time" name="release_time"><font id="r_time_error" ></font></td>
    </tr>
        <tr>
        <td>有效时间：</td>
        <td width="500px">
            <input type="date" id="begin_time" name="begin_time" >
            <label>至</label>
            <input type="date" id="end_time" name="end_time"><font id="b_e_time_error"></font>
        </td>
    </tr>   
        <tr>
        <td>添加附件：</td>
        <td width="500px">
        </td>
    </tr>    
    <tr height="200px">
    <td colspan="2"><textarea name="content" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea></td>
    </tr>
    <tr>
        <td align="center" colspan="2">
        <button class="btn btn-success" type="button" onclick="release()">确定</button>
        </td>
    </tr>
</table>
</tr>
</table>

    <div id="ly" style="position: absolute; top: 0px; filter: alpha(opacity=60); background-color: #777;
         z-index: 2; left: 0px; display: none;">
    </div>
    <!--          浮层框架开始         -->
    <div id="employee_add"style="position: absolute; top: 20%; left: 33%; z-index: 3;background-color: #fff; display: none;" >
        <table align="center" width="500" height="300" border="0" cellpadding="0" cellspacing="0" style="border: 0    solid    #e7e3e7;
             border-collapse: collapse ;" >
            <tr align="center">
                <td style="background-color: #73A2d6; color: #fff;
                     font-weight: bold; font-size: 12px;" height="35" valign="middle">
                     <div align="right"><a href=JavaScript:; class="STYLE1" onclick="Lock_CheckForm_clean('employee_add','employee_selected')">[关闭]</a> &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
            </tr>
            <tr >
                <td class="row" valign="top" >  
                <div class="col-md-4">         
                    <ul class="nav nav-pills nav-stacked">
                        <c:forEach items="${sessionScope.Department_list}" var="dept" varStatus="no">
                            <li>
                            <a  data-toggle="tab" >${dept.getD_name()}</a>
                            </li>
                        </c:forEach> 
                    </ul>
                </div>
                <div class="col-md-8" style=" overflow:scroll;height:250px;" align="left">
                        <c:forEach items="${sessionScope.Employ_list}" var="employee" varStatus="no">
                        <label class=" btn btn-default btn-block">
                           <input name="employee_selected" type="checkbox"  value="${employee.getP_id()}">
                                                                                               员工号：${employee.getP_id()}
                                                                                               姓名：${employee.getP_name()}
                        </label>
                        </c:forEach> 
                </div>
                </td>
            </tr>
            <tr align="center">
                <td valign="bottom" ><input class="btn btn-success" width="40" height="30" type="button" value="增加" onclick="get_checkbox_value('employee_selected','employee','employee_add')"></td>
            </tr>
        </table>
    </div>
</body>
</html>