<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script>
function fz()
{
    var str='赋值';//定义变量
    var oText=document.getElementById('text1');
    oText.value=str;//给文本框赋值并显示
}
</script>
</head>
 
<body>
<input type="button" value="123" onclick="fz()">
<input type="text" id="text1"/>
</body>
</html>