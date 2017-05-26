<%@page import="com.csxy.gggl.web.normal_Notive"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.csxy.gggl.web.Page" %>
<%@ page import="com.csxy.gggl.domain.Notive" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
    function load(){
    	document.getElementById('${sessionScope.function}').className="active";
    }
</script>
</head>
<body onload="load()" class="col-md-12">
    <form id="function" action="Notive_servlet?method=release" method="post">
        <div id="control">
            <form>
                <ul class="nav nav-pills">
                   <c:if test="${sessionScope.User.getU_type()=='管理员' }">
                       <li role="presentation" id="getPage" ><a onclick="flush('Notive_servlet?method=getPage')">全部公告</a></li>
                       <li role="presentation" id="Pending_audit"> <a onclick="flush('Notive_servlet?method=Pending_audit')">待审核公告</a></li>
                       <li role="presentation" id="audit"> <a onclick="flush('Notive_servlet?method=audit')">已审核公告</a></li>
                       <li role="presentation" id="unaudit"> <a onclick="flush('Notive_servlet?method=unaudit')">不通过审核公告</a></li>
                   </c:if>
                   <c:if test="${sessionScope.User.getU_type()=='一般用户' }">
                       <li role="presentation" id="getPage"><a onclick="flush('Notive_servlet?method=getPage')">与我相关</a></li>
                       <li role="presentation" id="getMy_Notive"> <a onclick="flush('Notive_servlet?method=getMy_Notive')">我的公告</a></li>
                       <li role="presentation" id="getUnread"> <a onclick="flush('Notive_servlet?method=getUnread')">未读公告</a></li>
                       <li role="presentation" id="getread"> <a onclick="flush('Notive_servlet?method=getread')">已读公告</a></li>
                   </c:if>
                </ul>
            </form>
        </div>
        <div id="data">
            <table id="rs" border="2" class="table-striped">
                <thead>
                <tr align="center">
                    <th style="width:150px;overflow: hidden;" align=center>发布人</th>
                    <th style="width:120px;overflow: hidden;" align=center>类型</th>
                    <th style="width:300px;overflow: hidden;" align=center>标题</th>
                    <th style="width:800px;overflow: hidden;" align=center>发布范围</th>
                    <th style="width:500px;overflow: hidden;" align=center>生效日期</th>
                    <th style="width:100px;overflow: hidden;" align=center>生效状态</th>
                    <c:if test="${sessionScope.User.getU_type()=='管理员' }">
                        <td style="width:180px;overflow: hidden;" align=center>操作</td>
                    </c:if>
                    <c:if test="${sessionScope.User.getU_type()=='一般用户' }">
                        <c:if test="${sessionScope.function=='getMy_Notive' }">
                            <td style="width:180px;overflow: hidden;" align=center>操作</td>
                        </c:if>
                    </c:if>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${Page.getList()}" var="notive" varStatus="no" >
                    <tr>
                        <td style="width:150px;overflow: hidden;" align=center>${notive.getN_authorname()}</td>
                        <td style="width:120px;overflow: hidden;" align=center>${notive.getN_type()}</td>
                        <td style="width:300px;overflow: hidden;" align=center><input type="button" class="btn btn-link" onclick="details('${no.index}')" value="${notive.getN_title()}" /></td>
                        <td style="width:800px;overflow: hidden;" align="left">
                                                                                    员工：<c:forEach items="${notive.getLink_employee_name()}" var="employee">${employee} &nbsp;</c:forEach>
                        </td>
                        <td style="width:500px;overflow: hidden;" align=center>${ notive.getN_begin_time()}至${notive.getN_end_time()}</td>
                        <td style="width:100px;overflow: hidden;" align=center>${ notive.getN_state() }</td>
                        <c:if test="${sessionScope.User.getU_type()=='管理员' }">
                        <td style="width:180px;overflow: hidden;" align=center>
                            <input class="btn btn-info" type="button" value="修改" onClick="update('/gggl/update.jsp?no='+${no.index},'Notive_servlet?method=update&update='+${notive.getN_id()})" />
                            <br/>
                            <input class="btn btn-danger" type="button" value="删除" onclick="delete_1('Notive_servlet?method=delect&delect='+${notive.getN_id()})" />
                        </td>
                        </c:if>
                        <c:if test="${sessionScope.User.getU_type()=='一般用户' }">
                            <c:if test="${sessionScope.function=='getMy_Notive' }">
                                <td  style="width:180px;overflow: hidden;" align=center>
                                <input class="btn btn-danger" type="button" value="删除" onclick="delete_1('Notive_servlet?method=delect&delect='+${notive.getN_id()})" />
                                </td>
                            </c:if>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
        </table>
        </div>
        <div id="control_right" class="navbar navbar-default navbar-fixed-bottom" style="padding-left: 14px">
                    <a href="Notive_servlet?method=turn&page_no=1">首页</a>
                    <a href="Notive_servlet?method=turn&page_no=${Page.getPrevPage()}">上一页</a>
                    <font id=page>${Page.getPageNo()} / ${Page.getTotalPageNumber()}页</font>
                    <a href="Notive_servlet?method=turn&page_no=${Page.getNextPage()}">下一页</a>
                    <a href="Notive_servlet?method=turn&page_no=${Page.getTotalPageNumber()}">尾页</a>
                    <font>跳转到：第</font><input type="number" id="target" name="target" style="width:40px;" /><font>页</font>
                    <input type="button" class="btn btn-link" value="跳转" onclick="T1('${Page.getTotalPageNumber()}','Notive_servlet?method=turn&page_no=0')">
        </div>
    </form>
</body>
</html>