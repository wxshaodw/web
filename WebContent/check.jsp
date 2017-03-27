<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.csxy.gggl.web.Page" %>
<%@ page import="com.csxy.gggl.domain.Notive" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<%
    Page<Notive> p=(Page<Notive>)session.getAttribute("Page");
    int no=Integer.parseInt(request.getParameter("no"));
    Notive notive=p.getList().get(no);
%>
<table>
<tr height="60"></tr>
<tr>
<table >
    <tr>
    <td align="center"><h1><%=notive.getN_title() %></h1></td>
    </tr>
    <tr>
    <td><%=notive.getN_context() %></td>
    </tr>
</table>
</tr>
</table>
</body>
</html>