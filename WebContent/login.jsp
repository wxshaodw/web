<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
</head>
<body>
    <form>
    <div id="username_box">
        <label for="username">用户名：</label>
        <input type="text" id="username" name="username" maxlength="20" onmouseover="this.focus()" onfocus="this.select()" value="" placeholder="请输入用户名">
    </div>
    <div id="password_box">
        <label for="password">密&nbsp;&nbsp;&nbsp;码：</label>
        <input type="text" id="password" name="password" maxlength="20" onmouseover="this.focus()" onfocus="this.select()" value="" placeholder="请输入密码"><br>        
    </div>
    <div id="function">
        <button type="submit" class="" title="登录">登录</button>
        <button type="button" class="" title="注册">注册</button>
    </div>
    </form>
</body>
</html>