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
<form action="user_servlet?methods=register" method="post">
<div id="r_logo" style="margin-top: 5%">
    <img align="center" src="./image/logo.png" height="119" id=logo><br>
    <font size="30" align="center">用户注册</font>
</div>
<div  id="register" style="	margin:auto;margin-top:0;width:40%;" align="center" >
  <table  align="center" >
      <td>员工姓名：</td>
      <td><input type="text" name="P_name"/></td>
      <td><label name="tip_P_name" /></td>
    </tr>
    <tr align="right">
      <td>联系电话：</td>
      <td><input type="text" name="P_mobile"/></td>
      <td><label name="tip_P_mobile" /></td>
    </tr>
    <tr align="right">
      <td>联系地址：</td>
      <td><input type="text" name="P_address"/></td>
      <td><label name="tip_P_address" /></td>
    </tr>
    <tr align="right">
      <td>所属部门：</td>
      <td><select name="P_dept">
      </select></td>
      <td><label name="tip_P_dept" /></td>
    </tr>
    <tr align="center">
      <td>注：带*为必填内容</td>
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