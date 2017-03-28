<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.csxy.gggl.web.Page" %>
<%@ page import="com.csxy.gggl.domain.Notive" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<%  Page<Notive> p=(Page<Notive>)session.getAttribute("Page");
    Notive notive=p.getList().get(Integer.parseInt(request.getParameter("no")));
    session.setAttribute("change_notive",notive );
%>
<c:set var="type"><%=notive.getN_type() %></c:set>
<c:set var="top"><%=notive.getN_top() %></c:set>
<c:set var="state"><%=notive.getN_state() %></c:set>
<table>
<tr height="60"></tr>
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
    <tr height="50px">
        <td>按部门发布：<br>
        <a>或按人员或角色发布</a></td>
        <td width="500px">
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
        <td width="500px"><input type="date" name="release_time" value="<%=notive.getN_release_time()%>"></td>
    </tr>
        <tr>
        <td>有效时间：</td>
        <td width="500px">
            <input type="date" name="begin_time" value="<%=notive.getN_begin_time() %>">
            <label>至</label>
            <input type="date" name="end_time" value="<%=notive.getN_end_time() %>">
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
</body>
</html>