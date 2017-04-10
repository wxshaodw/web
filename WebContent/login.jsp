<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='login.css'>
<link rel="stylesheet" href="kindeditor-4.1.7/themes/simple/simple.css" />
<link rel="stylesheet" href="kindeditor-4.1.7/plugins/code/prettify.css" />
<script charset="utf-8" src="kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="kindeditor-4.1.7/lang/zh_CN.js"></script>
<script charset="utf-8" src="kindeditor-4.1.7/plugins/code/prettify.js"></script>
<script type="text/javascript">
    function turn(method){
    	var username=document.getElementById("username").value;
    	var password=document.getElementById("password").value;
    	if(username==""){
    		document.getElementById("error").innerHTML="请输入用户名";
    	}
    	else if(password==""){
    		document.getElementById("error").innerHTML="请输入密码";
    	}
    	else{
    		document.getElementById("chat").submit();
    	}
    }
</script>
<%
    String massage=(String)session.getAttribute("error");
    session.removeAttribute("error");
    session.setAttribute("running_state", "normal");
    session.setAttribute("condition",null);
    if(massage==null)massage="";
%>
<title>用户登录</title>
</head>
<body >
    <div id="login_panel">
    <form id="chat" action="user_servlet?methods=login" method="post">
    <div align="center"><label id="tip">用户登录</label></div>
    <div id="username_box">
        <label for="username">用户名：</label>
        <input type="text" id="username" name="username" maxlength="20" onmouseover="this.focus()" onfocus="this.select()" value="" placeholder="请输入用户名">
    </div>
    <div id="password_box">
        <label for="password">密&nbsp;&nbsp;&nbsp;码：</label>
        <input type="password" id="password" name="password" maxlength="20" onmouseover="this.focus()" onfocus="this.select()" value="" placeholder="请输入密码">       
    </div>
    <div id="select_type">
        <h4>用户类别：</h4>
        <input type="radio" name="type" value="一般用户" checked="checked" />一般用户
        <input type="radio" name="type" value="管理员" />管理员
    </div>
    <div id="function" align="center">
        <button type="button" onclick="turn('login')" title="登录">登录</button>
       <!-- <a href="register.jsp"><button type="button">注册</button></a> -->
    </div>
    <div align="center"><font id="error" ><%=massage %></font></div>
    </form>
    </div>
</body>
</html>