<%@page import="com.csxy.gggl.web.normal_Notive"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.csxy.gggl.web.Page" %>
<%@ page import="com.csxy.gggl.domain.Notive" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" media="screen" />
<script src="http://code.jquery.com/jquery.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<%
    Page<normal_Notive> p=(Page<normal_Notive>)session.getAttribute("Page");
    int no=Integer.parseInt(request.getParameter("no"));
    normal_Notive notive=p.getList().get(no);
%>
<body class="container-fluid">

<div class="row">
    <h2 class="text-center"><%=notive.getN_title() %></h2>
</div>
<div class="text-uppercase">
    <label class="col-md-3">发布人：<%=notive.getN_authorname() %></label>
    <label class="col-md-3">发布日期：<%=notive.getN_release_time() %></label>
    <label class="col-md-3">公告状态：<%=notive.getN_state() %></label>
</div>
<div class="lead">
    <%=notive.getN_context() %>
</div>
<div align="center" class="navbar-fixed-bottom">
    <c:if test="${sessionScope.User_type=='管理员'}">
    <button class="col-md-3 col-md-offset-5 btn btn-success" >审核通过</button>
    <button class="btn btn-danger" >审核不通过</button>
    </c:if>
    <c:if test="${sessionScope.User_type=='一般用户'}">
    <button class="col-md-3 col-md-offset-5 btn btn-success" >已读</button>
    </c:if>
</div>
</body>
</html>