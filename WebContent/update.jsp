<%@page import="com.csxy.gggl.web.normal_Notive"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.csxy.gggl.domain.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.csxy.gggl.domain.Department"%>
<%@ page import="com.csxy.gggl.web.Page" %>
<%@ page import="com.csxy.gggl.domain.Notive" %>
<%@ page import="net.sf.json.JSONArray" %>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
	<%
	JSONArray json=null;
    Page<normal_Notive> p=(Page<normal_Notive>)session.getAttribute("Page");
    normal_Notive notive=p.getList().get(Integer.parseInt(request.getParameter("no")));
    session.setAttribute("change_notive",notive );
    if(notive!=null){
      	 if(notive.getLink_employee()!=null){
      	     String employee[]=new String[notive.getLink_employee().size()];
      	     String employee_select="";
      	     for(int i=0;i<employee.length;i++){
      	     	employee[i]=notive.getLink_employee().get(i);
      	     	employee_select=employee_select+notive.getLink_employee().get(i)+",";
      	     }
      	     session.setAttribute("employee_select",employee_select);
      	     session.setAttribute("e1", employee);
      	 }
      	 else{
      	     session.setAttribute("employee_select",null);
      	     session.setAttribute("e1",null);
      	 }
       }
    %> 
    
<body onload="get_date()">
<table>
<tr align="center"><h2 align="center">修改公告</h2></tr>
<tr>
<table align="center" border="1" >
    <tr>
        <td>标题：</td>
        <td width="500px">
        <input type="text" name="title" value="${change_notive.getN_title() } " width="80px"/>
        </td>
    </tr>
    <tr>
        <td>类别：</td>
        <td>
            <select name="type"  >
  <option value="" <c:if test="${change_notive.getN_type()==''}" >selected="selected"</c:if>></option>
                <option value="决定"  <c:if test="${change_notive.getN_type()=='决定'}" >selected="selected"</c:if>>决定</option>
                <option value="通知"  <c:if test="${change_notive.getN_type()=='通知'}" >selected="selected"</c:if>>通知</option>
                <option value="报告"  <c:if test="${change_notive.getN_type()=='报告'}" >selected="selected"</c:if> >报告</option>
                <option value="其他"  <c:if test="${change_notive.getN_type()=='其他'}" >selected="selected"</c:if> >其他</option>
            </select>
        </td>
    </tr>
    <tr>
        <td >相关人员:</td>
        <td width="350px" height="100px">
        <textarea id="employee" name="employee" readonly="readonly" rows="4" cols="40" style="resize: none;"><c:forEach items="${change_notive.getLink_employee_name() }" var="employee_name">${employee_name} &nbsp;</c:forEach>
        </textarea>
        <input class="btn btn-link" type="button" name="add_employee" value="增加"  onClick="locking_getvalues('${sessionScope.dept_list.size()}','employee_add')">
        </td>
    </tr>
        <td>发布状态：</td>
        <td width="500px">
        <select name="state">
            <option value="未发布" <c:if test="${change_notive.getN_state()=='未发布'}" >selected="selected"</c:if>>未发布</option>
            <option value="已发布" <c:if test="${change_notive.getN_state()=='已发布'}" >selected="selected"</c:if>>已发布</option>
        </select>
        </td>
    </tr>
        <tr>
        <td>是否顶置：</td>
        <td width="500px">
        <select name="top">
            <option value="未顶置" <c:if test="${change_notive.getN_top()=='未顶置'}" >selected="selected"</c:if> >未顶置</option>
            <option value="已顶置" <c:if test="${change_notive.getN_top()=='已顶置'}" >selected="selected"</c:if> > 已顶置</option>
        </select>
        </td>
    </tr>
        <tr>
        <td>发布时间：</td>
        <td width="500px"><input id="release_time" type="date" name="release_time" value="${change_notive.getN_release_time() }"> <font id="r_time_error" ></font> </td>
    </tr>
        <tr>
        <td>有效时间：</td>
        <td width="500px">
            <input type="date" id="begin_time" name="begin_time" value="${change_notive.getN_begin_time()}">
            <label>至</label>
            <input type="date" id="end_time" name="end_time" value="${change_notive.getN_end_time()}"><font id="b_e_time_error"></font>
        </td>
    </tr>   
    <tr height="200px">
    <td colspan="2"><textarea name="content" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;" >${change_notive.getN_context()}</textarea></td>
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
         z-index: 2; left: 0px; display: none;"  >
    </div>
    <!--          浮层框架开始         -->
    <div id="employee_add"style="position: absolute; top: 20%; left: 33%; z-index: 3;background-color: #fff; display: none;" >
        <table align="center" width="500" height="300" border="0" cellpadding="0" cellspacing="0" style="border: 0    solid    #e7e3e7;
             border-collapse: collapse ;" >
            <tr align="center">
                <td style="background-color: #73A2d6; color: #fff;
                     font-weight: bold; font-size: 12px;" height="35" valign="middle">
                     <div align="right"><a href=JavaScript:; class="STYLE1" onclick="Lock_CheckForm('employee_add')">[关闭]</a> &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
            </tr>
            <tr >
                <td class="row" valign="top" >  
                <div class="col-md-4">         
                    <ul class="nav nav-pills nav-stacked">
                        <c:forEach items="${sessionScope.dept_list}" var="dept" varStatus="no">
                            <li>
                            <a  data-toggle="tab" onclick="get_employee_list('${no.index}')">${dept.getD_name()}</a>
                            </li>
                        </c:forEach> 
                    </ul>
                </div>
                <div id="eployee_list" class="col-md-8" style=" overflow:scroll;height:250px;" align="left">
                </div>
                </td>
            </tr>
            <tr align="center">
                <td valign="bottom" ><input class="btn btn-success" width="40" height="30" type="button" value="增加" onclick="get_checkbox_value('employee','employee_add')"></td>
            </tr>
        </table>
    </div>
</body>
</html>