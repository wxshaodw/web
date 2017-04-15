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
        <td>相关部门:</td>
        <td><input id="dept" type="text" readonly="readonly">
        <input type="button" name="add_dept" value="增加" onclick="locking('dept_add')" ></td>
    </tr>
    <tr>
        <td>相关人员:</td>
        <td><input id="employee" type="text" readonly="readonly">
        <input type="button" name="add_employee" value="增加"  onClick="locking('employee_add')">
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
        <button type="button" onclick="release()">确定</button>
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
            <tr align="center">
                <td valign="top" align="center">
                <table   border="0" >
                    <tr align="center">
                        <td width="70">选择</td>
                        <td width="160">工号</td>
                        <td width="160">姓名</td>
                        <td width="170">所属部门</td>
                   </tr>
                   <tr>
                   <td valign="top" colspan="4">
                    <div style="overflow: auto;height:300;width: 500" >
                    <table align="center" border="1">
                        <c:forEach items="<%=employee_list %>" var="employee" varStatus="no">
                        <tr>
                        <td width="70"><input type="checkbox" name="employee_selected" value="${employee.getP_id()}" /></td>
                        <td width="160">${employee.getP_id()}</td>
                        <td width="160">${employee.getP_name()}</td>
                        <td width="170">${employee.getP_department()}</td>
                        </tr>
                        </c:forEach>
                    </table>
                    </div>
                </td>
                </tr>
                </table>
                </td>
            </tr>
            <tr align="center">
                        <td valign="bottom" ><input width="40" height="30" type="button" value="增加" onclick="get_checkbox_value('employee_selected','employee','employee_add')"></td>
            </tr>
        </table>
    </div>
        <!--          浮层框架开始         -->
    <div id="dept_add"style="position: absolute; top: 20%; left: 33%; z-index: 3;background-color: #fff; display: none;" >
        <table align="center" width="500" height="500" border="0" cellpadding="0" cellspacing="0" style="border: 0    solid    #e7e3e7;
             border-collapse: collapse ;" >
            <tr align="center">
                <td style="background-color: #73A2d6; color: #fff;
                     font-weight: bold; font-size: 12px;" height="35" valign="middle">
                     <div align="right"><a href=JavaScript:; class="STYLE1" onclick="Lock_CheckForm_clean('dept_add','department_selected');">[关闭]</a> &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
            </tr>
            <tr align="center">
                <td valign="top" align="center">
                <table >
                    <tr align="center">
                        <td width="70">选择</td>
                        <td width="160">部门编号</td>
                        <td width="160">部门名称</td>
                        <td width="170">总人数</td>
                   </tr>
                  <tr>
                   <td valign="top" colspan="4">
                    <div style="overflow: auto;height:300;width: 500" >
                    <table align="center" border="1">
                        <c:forEach items="<%=department_list %>" var="department" varStatus="no">
                        <tr>
                        <td width="70"><input type="checkbox" name="department_selected"  value="${department.getD_id()}"/></td>
                        <td width="160">${department.getD_id()}</td>
                        <td width="160">${department.getD_name()}</td>
                        <td width="170">${department.getD_amount()}</td>
                        </tr>
                        </c:forEach>
                    </table>
                    </div>
                </td>
                </tr>
                </table>
                </td>
            </tr>
            <tr align="center">
                <td valign="bottom" ><input width="40" height="30" type="button" value="增加" onclick="get_checkbox_value('department_selected','dept','dept_add')"></td>
            </tr>
        </table>
    </div>
</body>
</html>