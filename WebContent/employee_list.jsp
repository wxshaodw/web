<%@page import="com.csxy.gggl.web.normal_Notive"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.csxy.gggl.web.normal_Dept"%>
<%@page import="com.csxy.gggl.domain.Employee"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<%
 int no=Integer.parseInt(request.getParameter("no"));
 List<normal_Dept> dept_list=(List<normal_Dept>)session.getAttribute("dept_list");
 List<Employee> employees=dept_list.get(no).getEmployee_list();

%>
<body>
    <c:forEach items="<%=employees %>" var="employee" varStatus="no">
        <label class=" btn btn-default btn-block">
            <input name="employee_selected" type="checkbox"   <c:forEach items="${e1 }" var="select_e"><c:if test="${employee.getP_id()==select_e}">checked=true;</c:if></c:forEach> value="${employee.getP_id()}" onclick="changeIds()" />
                                           员工号：${employee.getP_id()}
                                            姓名：${employee.getP_name()}
        </label>
    </c:forEach> 
</body>
</html>