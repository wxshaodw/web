<%@page import="com.csxy.gggl.web.normal_Notive"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.csxy.gggl.domain.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.csxy.gggl.domain.Department"%>
<%@ page import="com.csxy.gggl.web.Page" %>
<%@ page import="com.csxy.gggl.domain.Notive" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<% 
    List<Employee> employee_list=(List<Employee>)session.getAttribute("Employ_list");
    List<Department> department_list=(List<Department>)session.getAttribute("Department_list");
    Page<normal_Notive> p=(Page<normal_Notive>)session.getAttribute("Page");
    normal_Notive notive=p.getList().get(Integer.parseInt(request.getParameter("no")));
    session.setAttribute("change_notive",notive );
    if(notive.getLink_dept()!=null){
        int dept[]=new int[notive.getLink_dept().size()];
        for(int i=0;i<dept.length;i++){
        	dept[i]=Integer.parseInt(notive.getLink_dept().get(i));
        }
        request.setAttribute("d1", dept);
    }
    if(notive.getLink_employee()!=null){
        int employee[]=new int[notive.getLink_employee().size()];
        for(int i=0;i<employee.length;i++){
        	employee[i]=Integer.parseInt(notive.getLink_employee().get(i));
        }
        request.setAttribute("e1", employee);
    }
 %>
<c:set var="type"><%=notive.getN_type() %></c:set>
<c:set var="top"><%=notive.getN_top() %></c:set>
<c:set var="state"><%=notive.getN_state() %></c:set>
<table>
<tr align="center"><h2 align="center">修改公告</h2></tr>
<tr>
<table align="center" border="1" >
    <tr>
        <td>标题：</td>
        <td width="500px">
        <input type="text" name="title" value="<%=notive.getN_title() %>" width="80px"/>
        </td>
    </tr>
    <tr>
        <td>类别：</td>
        <td>
            <select name="type" value="<%=notive.getN_type() %>" >
  <option value="" <c:if test="${type==''}" >selected="selected"</c:if>></option>
                <option value="决定"  <c:if test="${type=='决定'}" >selected="selected"</c:if>>决定</option>
                <option value="通知"  <c:if test="${type=='通知'}" >selected="selected"</c:if>>通知</option>
                <option value="报告"  <c:if test="${type=='报告'}" >selected="selected"</c:if> >报告</option>
                <option value="其他"  <c:if test="${type=='其他'}" >selected="selected"</c:if> >其他</option>
            </select>
        </td>
    </tr>
    <tr>
        <td>相关部门:</td>
        <td><input id="dept" type="text" readonly="readonly" >
        <input type="button" name="add_dept" value="增加" onclick="locking('dept_add')" ></td>
    </tr>
    <tr>
        <td>相关人员:</td>
        <td><input id="employee" type="text" readonly="readonly">
        <input type="button" name="add_employee" value="增加"  onClick="locking('employee_add')">
        </td>
    </tr>
    <tr>
        <td>发布状态：</td>
        <td width="500px">
        <select name="state">
            <option value="未发布" <c:if test="${state=='未发布'}" >selected="selected"</c:if>>未发布</option>
            <option value="已发布" <c:if test="${state=='已发布'}" >selected="selected"</c:if>>已发布</option>
        </select>
        </td>
    </tr>
        <tr>
        <td>是否顶置：</td>
        <td width="500px">
        <select name="top">
            <option value="未顶置" <c:if test="${top=='未顶置'}" >selected="selected"</c:if> >未顶置</option>
            <option value="已顶置" <c:if test="${top=='已顶置'}" >selected="selected"</c:if> > 已顶置</option>
        </select>
        </td>
    </tr>
        <tr>
        <td>发布时间：</td>
        <td width="500px"><input type="date" id="release_time" value="<%=notive.getN_release_time()%>"> <font id="r_time_error" ></font> </td>
    </tr>
        <tr>
        <td>有效时间：</td>
        <td width="500px">
            <input type="date" id="begin_time" value="<%=notive.getN_begin_time() %>">
            <label>至</label>
            <input type="date" id="end_time" value="<%=notive.getN_end_time() %>"><font id="b_e_time_error"></font>
        </td>
    </tr>   
        <tr>
        <td>添加附件：</td>
        <td width="500px">
        </td>
    </tr>    
    <tr height="200px">
    <td colspan="2"><textarea name="content" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;" ><%=notive.getN_context() %></textarea></td>
    </tr>
    <tr>
        <td align="center" colspan="2">
        <button type="button" onclick="updatetodatebase()">确定</button>
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
                        <td width="70"><input type="checkbox" name="employee_selected" <c:forEach items="${e1 }" var="select_e"><c:if test="${employee.getP_id()==select_e}">checked=true;</c:if></c:forEach> value="${employee.getP_id()}" /></td>
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
                        <td width="70"><input type="checkbox" name="department_selected" <c:forEach items="${d1 }" var="select_d"><c:if test="${department.getD_id()==select_d}">checked=true;</c:if></c:forEach>  value="${department.getD_id()}"/></td>
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