<%@page import="com.csxy.gggl.service.Notive_service"%>
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
<script type="text/javascript">
function w_close(){
	  window.opener.location.href ="Notive_servlet?method=getPage";
	  window.close();  
}
</script>
<style type="text/css">
    #notive_title{
	background-color:#57DCF9
	}
	#notive_info{
	background-color:#FCFCB4
	}
	#notive_content{
	background-color:#DFDFDF}
	#notive_function{
	background-color: #A5D6E9}
 </style>
</head>
<%
    Page<normal_Notive> p=(Page<normal_Notive>)session.getAttribute("Page");
    int no=Integer.parseInt(request.getParameter("no"));
    normal_Notive notive=p.getList().get(no);
    Notive_service notive_service=new Notive_service();
    
%>
<c:set var="notive" value="<%=notive %>"></c:set>
<body id="notive_content" class="container-fluid">

<div id="notive_title" class="row">
    <h2 class="text-center"><%=notive.getN_title() %></h2>
</div>
<div id="notive_info" class="row text-uppercase">
    <label class="col-md-4">发布人：<%=notive.getN_authorname() %></label>
    <label class="col-md-4">发布日期：<%=notive.getN_release_time() %></label>
    <label class="col-md-4">公告状态：<%=notive.getN_state() %></label>
</div>
<div  class="row lead">
    <%=notive.getN_context() %>
</div>
<div id="notive_function" align="center" class="navbar-fixed-bottom">
    <c:if test="${sessionScope.User.getU_type()=='管理员'}">
    <c:if test="${notive.getN_state()=='待审核'}">
    <a class="col-md-3 col-md-offset-5 btn btn-success" href="Notive_servlet?method=Noitve_audit&no=<%=no%>&state=通过" onClick="w_close()" >审核通过</a>
    <a class="btn btn-danger" href="Notive_servlet?method=Noitve_audit&no=<%=no%>&state=不通过" onClick="w_close()" >审核不通过</a>
    </c:if>
    </c:if>
    <c:if test="${sessionScope.User.getU_type()=='一般用户'}">
    <a class="col-md-3 col-md-offset-5 btn btn-success" href="Notive_servlet?method=Noitve_read&id=<%=notive.getN_id()%>&state=已读" onClick="w_close()" >已读</a>
    </c:if>
</div>
</body>
</html>