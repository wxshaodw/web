<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Bootstrap-->
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" media="screen" />
<script src="http://code.jquery.com/jquery.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
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
<title>用户登录</title>
<%
    String massage=(String)session.getAttribute("error");
    session.removeAttribute("error");
    session.setAttribute("running_state", "normal");
    session.setAttribute("condition",null);
    if(massage==null)massage="";
%>
</head>
<body>
<div id="login_panel" class="container-fluid">
   <form id="chat" action="user_servlet?methods=login" method="post">
    <div class="row" align="center" >
    <label  id="tip" class="col-md-3 col-md-offset-3"><h2>用户登录</h2></label>
    </div>
    <div id="username_box" class="row">
        <label for="username" class="col-md-3 col-md-offset-3">用户名：
        <input type="text" id="username" name="username" value="" placeholder="请输入用户名" />
        </label>
    </div>
    <div id="password_box" class="row">
        <label for="password" class="col-md-3 col-md-offset-3" >密&nbsp;&nbsp;&nbsp;码：
        <input type="password" id="password" name="password" value="" placeholder="请输入密码">    
        </label>   
    </div>
    <div id="select_type" class="row" align="left">
        <label for="usertype" class="col-md-3 col-md-offset-3" >用户类别：
        <input type="radio" name="type" value="一般用户" checked="checked" />一般用户
        <input type="radio" name="type" value="管理员" />管理员
        </label>
    </div>
    <div class="row">
    <button class="col-md-3 col-md-offset-3 btn btn-primary"  type="button" onClick="turn('login')" title="登录">登录</button>
    </div>
    <div align="center"><font id="error" ><%=massage %></font></div>
    </form>
</div>
</body>
</html>