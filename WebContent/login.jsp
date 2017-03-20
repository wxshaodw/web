<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='login.css'>
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
    if(massage==null)massage="";
%>
<title>用户登录</title>
</head>
<body >
    <div id="login_panel" align="center">
    <form id="chat" action="user_servlet?methods=login" method="post">
    <div id="username_box" align="center">
        <label for="username">用户名：</label>
        <input type="text" id="username" name="username" maxlength="20" onmouseover="this.focus()" onfocus="this.select()" value="" placeholder="请输入用户名">
    </div>
    <div id="password_box" align="center">
        <label for="password">密&nbsp;&nbsp;&nbsp;码：</label>
        <input type="text" id="password" name="password" maxlength="20" onmouseover="this.focus()" onfocus="this.select()" value="" placeholder="请输入密码"><br>        
    </div>
    <div id="function" align="center">
        <button type="button" onclick="turn('login')" title="登录">登录</button>
        <a href="register.jsp"><button type="button">注册</button></a>
    </div>
    <div align="center"><font id="error" ><%=massage %></font></div>
    </form>
    </div>
</body>
</html>