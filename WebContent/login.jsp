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
<style type="text/css">
body{
    margin-top: 150px;
    background:url(image/login_bg.jpg);
    background-size:100%;
    background-repeat:no-repeat;
}

.form-bg{
    background: #00b4ef;
}
.form-horizontal{
    background: #fff;
    padding-bottom: 40px;
    border-radius: 15px;
    text-align: center;
}
.form-horizontal .heading{
    display: block;
    font-size: 35px;
    font-weight: 700;
    padding: 35px 0;
    border-bottom: 1px solid #f0f0f0;
    margin-bottom: 30px;
}
.form-horizontal .form-group{
    padding: 0 40px;
    margin: 0 0 25px 0;
    position: relative;
}
.form-horizontal .form-control{
    background: #f0f0f0;
    border: none;
    border-radius: 20px;
    box-shadow: none;
    padding: 0 20px 0 45px;
    height: 40px;
    transition: all 0.3s ease 0s;
}
.form-horizontal .form-control:focus{
    background: #e0e0e0;
    box-shadow: none;
    outline: 0 none;
}
.form-horizontal .form-group i{
    position: absolute;
    top: 12px;
    left: 60px;
    font-size: 17px;
    color: #c8c8c8;
    transition : all 0.5s ease 0s;
}
.form-horizontal .form-control:focus + i{
    color: #00b4ef;
}
.form-horizontal .fa-question-circle{
    display: inline-block;
    position: absolute;
    top: 12px;
    right: 60px;
    font-size: 20px;
    color: #808080;
    transition: all 0.5s ease 0s;
}
.form-horizontal .fa-question-circle:hover{
    color: #000;
}
.form-horizontal .main-checkbox{
    float: left;
    width: 20px;
    height: 20px;
    background: #11a3fc;
    border-radius: 50%;
    position: relative;
    margin: 5px 0 0 5px;
    border: 1px solid #11a3fc;
}
.form-horizontal .main-checkbox label{
    width: 20px;
    height: 20px;
    position: absolute;
    top: 0;
    left: 0;
    cursor: pointer;
}
.form-horizontal .main-checkbox label:after{
    content: "";
    width: 10px;
    height: 5px;
    position: absolute;
    top: 5px;
    left: 4px;
    border: 3px solid #fff;
    border-top: none;
    border-right: none;
    background: transparent;
    opacity: 0;
    -webkit-transform: rotate(-45deg);
    transform: rotate(-45deg);
}
.form-horizontal .main-checkbox input[type=checkbox]{
    visibility: hidden;
}
.form-horizontal .main-checkbox input[type=checkbox]:checked + label:after{
    opacity: 1;
}
.form-horizontal .text{
    float: left;
    margin-left: 7px;
    line-height: 20px;
    padding-top: 5px;
    text-transform: capitalize;
}
.form-horizontal .btn{
    font-size: 14px;
    color: #fff;
    background: #00b4ef;
    border-radius: 30px;
    padding: 10px 25px;
    border: none;
    text-transform: capitalize;
    transition: all 0.5s ease 0s;
}
@media only screen and (max-width: 479px){
    .form-horizontal .form-group{
        padding: 0 25px;
    }
    .form-horizontal .form-group i{
        left: 45px;
    }
    .form-horizontal .btn{
        padding: 10px 20px;
    }
}
</style>
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
   <div class="row">
   <div class="col-md-offset-4 col-md-4">
       <form id="chat" class="form-horizontal" action="user_servlet?methods=login" method="post">
       <span class="heading">用户登录</span>
           <div id="username_box" class="form-group">
               <input type="text" id="username" name="username" class="form-control" value="" placeholder="请输入用户名" />
           </div>
           <div id="password_box" class="form-group">
               <input type="password" id="password" name="password" class="form-control" value="" placeholder="请输入密码">    
           </div>
           <div id="select_type" class="form-group" align="left">用户类别：
               <input type="radio" name="type" value="一般用户" checked="checked" />一般用户
               <input type="radio" name="type" value="管理员" />管理员
           </div>
           <div class="form-group">
                <button class="col-md-12  btn btn-primary"  type="button" onClick="turn('login')" title="登录">登录</button>
           </div>
    <div align="center"><font id="error" ><%=massage %></font></div>
    </form>
   </div>
    </div>
    <div>
</div>
</body>
</html>