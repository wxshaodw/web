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
<% Page<normal_Notive> p=(Page<normal_Notive>)session.getAttribute("Page");
   List<normal_Notive> list=p.getList();
   %>
</head>
<body>
    <form id="function" action="Notive_servlet?method=release" method="post">
        <div id="control">
            <form>
                <div id="control_left">
                   <c:if test="${sessionScope.User_type=='管理员' }">
                       <button onclick="flush('Notive_servlet?method=getPage')">全部公告</button>
                       <button onclick="flush('Notive_servlet?method=Pending_audit')">待审核公告</button>
                       <button onclick="flush('Notive_servlet?method=audit')">已审核公告</button>
                   </c:if>
                   <c:if test="${sessionScope.User_type=='一般用户' }">
                   <button onclick="flush('Notive_servlet?method=getPage')">与我相关</button>
                   <button onclick="flush('Notive_servlet?method=getMy_Notive')">我的公告</button>
                   <button onclick="flush('Notive_servlet?method=getUnread')">未读公告</button>
                   <button onclick="flush('Notive_servlet?method=getread')">已读公告</button>
                   </c:if>
                    <img />
                    <font>公告通知</font>
                    <select id="type">
                        <option value=""></option>
                        <option value="决定">决定</option>
                        <option value="通知">通知</option>
                        <option value="报告">报告</option>
                        <option value="其他">其他</option>
                    </select>
                    <font>发布日期：</font>
                    <input type="date"/>
                    <input type="button" value="确定" />
                </div>
                <div id="control_right">
                    <font id=page>${Page.getPageNo()} / ${Page.getTotalPageNumber()}页</font>
                    <a href="Notive_servlet?method=turn&page_no=1">首页</a>
                    <a href="Notive_servlet?method=turn&page_no=${Page.getPrevPage()}">上一页</a>
                    <a href="Notive_servlet?method=turn&page_no=${Page.getNextPage()}">下一页</a>
                    <a href="Notive_servlet?method=turn&page_no=${Page.getTotalPageNumber()}">尾页</a>
                    <font>跳转到：第</font><input type="number" id="target" name="target" /><font>页</font>
                    <input type="button" value="跳转" onclick="T1('${Page.getTotalPageNumber()}','Notive_servlet?method=turn&page_no=0')">
                </div>
            </form>
        </div>
        <div id="data">
            <table align=center id="rs" border="2">
                <tr>
                    <td style="width:150px;overflow: hidden;" align=center>发布人</td>
                    <td style="width:120px;overflow: hidden;" align=center>类型</td>
                    <td style="width:300px;overflow: hidden;" align=center>标题</td>
                    <td style="width:400px;overflow: hidden;" align=center>发布范围</td>
                    <td style="width:500px;overflow: hidden;" align=center>生效日期</td>
                    <td style="width:100px;overflow: hidden;" align=center>生效状态</td>
                    <c:if test="${sessionScope.User_type=='管理员' }">
                        <td style="width:180px;overflow: hidden;" align=center>操作</td>
                    </c:if>
                    <c:if test="${sessionScope.User_type=='一般用户' }">
                        <c:if test="${sessionScope.function=='getMy_Notive' }">
                            <td style="width:180px;overflow: hidden;" align=center>操作</td>
                        </c:if>
                    </c:if>
                </tr>
                <c:forEach items="${Page.getList()}" var="notive" varStatus="no" >
                    <tr>
                        <td style="width:150px;overflow: hidden;" align=center>${notive.getN_authorname()}</td>
                        <td style="width:120px;overflow: hidden;" align=center>${notive.getN_type()}</td>
                        <td style="width:300px;overflow: hidden;" align=center><a href="/gggl/check.jsp?no=${no.index}">${notive.getN_title()}</a></td>
                        <td style="width:400px;overflow: hidden;" align="left">
                                                                                                    部门：<c:forEach items="${notive.getLink_dept()}" var="dept">${dept}&nbsp;</c:forEach><br/>
                                                                                                    员工：<c:forEach items="${notive.getLink_employee()}" var="employee">${employee} &nbsp;</c:forEach>
                        </td>
                        <td style="width:500px;overflow: hidden;" align=center>${ notive.getN_begin_time()}至${notive.getN_end_time()}</td>
                        <td style="width:100px;overflow: hidden;" align=center>${ notive.getN_state() }</td>
                        <c:if test="${sessionScope.User_type=='管理员' }">
                        <td style="width:180px;overflow: hidden;" align=center>
                            <input type="button" value="修改" onClick="update('/gggl/update.jsp?no='+${no.index},'Notive_servlet?method=update&update='+${notive.getN_id()})" />
                            <input type="button" value="删除" onclick="delete_1('Notive_servlet?method=delect&delect='+${notive.getN_id()})" />
                        </td>
                        </c:if>
                        <c:if test="${sessionScope.User_type=='一般用户' }">
                            <c:if test="${sessionScope.function=='getMy_Notive' }">
                                <td style="width:180px;overflow: hidden;" align=center>
                                <input type="button" value="删除" onclick="delete_1('Notive_servlet?method=delect&delect='+${notive.getN_id()})" />
                                </td>
                            </c:if>
                        </c:if>
                    </tr>
                </c:forEach>
        </table>
        </div>
    </form>
</body>
</html>