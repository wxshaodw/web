<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
    @IMPORT url("register.css");
-->
</style>
</head>
<body>
<form action="user_servlet?methods=register method="post">
<div id="r_logo" style="margin-top: 5%">
    <img align="center" src="./image/logo.png" height="119" id=logo><br>
    <font size="30" align="center">员工关联</font>
</div>
<div  id="register" style="	margin:auto;margin-top:0;width:40%;" align="center" >
  <table  align="center" >
    <tr align="right">
      <td>用户名：</td>
      <td><input type="text" name="username" /></td>
      <td width="150px"><label name="tip_username" /></td>
    </tr>
    <tr align="right">
      <td>密&nbsp;&nbsp;&nbsp;码：</td>
      <td><input type="text" name="password" /></td>
      <td><label name="tip_password" /></td>
    </tr>
    <tr align="right">
      <td>再次输入密码：</td>
      <td><input type="text" name="repassword" /></td>
      <td><label name="tip_repassword" /></td>
    </tr>
    <tr align="right">
      <td>员工编号：</td>
      <td><input type="text" name="P_name"/></td>
      <td><button onclick="">检查员工编号</button></td>
    </tr>
    <tr id=check_result></tr>
    <tr>
        <td align="right">用户类型：</td>
        <td>
            <select id="user_type" >
                <option value="一般用户">一般用户</option>
                <option value="公告管理员">公告管理员</option>
            </select>
        </td>
    </tr>
    <tr align="center">
      <td align="center" colspan="3"><button type="submit">确定</button>
          <button type="reset">重置</button></td>
    </tr>
  </table>
  </div>
</form>
</body>
</html>