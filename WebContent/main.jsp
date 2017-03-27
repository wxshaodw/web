<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page import="com.csxy.gggl.web.Page" %>
<%@ page import="com.csxy.gggl.domain.Notive" %>
<link rel='stylesheet' type='text/css' href='main.css'>
<script charset="utf-8" src="./kindeditor-4.1.7/jquery.js"></script>
<script charset="utf-8" type="text/javascript">
    var Editor;
    var xmlhttp;
    function reflush(page,method){
    	document.getElementById("function").action=method;
    	if(window.XMLHttpRequest){
    		xmlhttp=new XMLHttpRequest();
    	}
    	else{
    		xmlhttp=new ActivexOject("Microsoft.XMLHTTP");
    	}
    	if(xmlhttp!=null){
    		xmlhttp.onreadystatechange=state_Change;
    		xmlhttp.open("GET",page,true);
    		xmlhttp.send();
    		if(method=="Notive_servlet?method=release")
			{
			$.getScript('./kindeditor-4.1.7/kindeditor-min.js', function() {
			KindEditor.basePath = './kindeditor-4.1.7/';
			KindEditor.create('textarea[name="content"]',{
				afterBlur:function(){this.sync();}
			});
			});
			}
    	}
    	else{
    		alert("浏览器不支持");
    	}
    }
    function state_Change()
    {
    if (xmlhttp.readyState==4)
      {// 4 = "loaded"
      if (xmlhttp.status==200)
        {// 200 = "OK"
        document.getElementById("center").innerHTML=xmlhttp.responseText;
        }
      else
        {
        alert("Problem retrieving data:" + xmlhttp.statusText);
        }
      }
    }
    
    function delect(method){
    	document.getElementById("function").action=method;
    	document.getElementById("function").submit();
    }
    
    function release(){
    	document.getElementById("function").submit();
    }
    
    function update(page, method,content){
    	reflush(page, method);
			$.getScript('./kindeditor-4.1.7/kindeditor-min.js', function() {
				KindEditor.basePath = './kindeditor-4.1.7/';
				Editor=KindEditor.create('textarea[name="content"]',{
					afterBlur:function(){this.sync();}
				});
				Editor.html(content);
				});
    }
</script>
<title>公告管理系统</title>
<style type="text/css">
<!--
body {
	background-image: url(image/main_bg.jpg);
	background-size:100%;
	background-repeat: no-repeat;
}
#center{
    width:100%;
    height:78%;
    background-color: white;
}
-->
</style></head>
<body>
    <div id="north">
        <div id="north_left"><img src="./image/logo.png" height="119" id=logo></div>
        <div id="north_right">
            <div id="datetime">
                <div name="time">10:08</div>
                <div name="date">2017/2/22</div>
                <div name="">农历</div>
            </div>
            <div id="weather">
                <div name="area">东莞</div>
                <div name="weather">雨天</div>
                <div name="nl">温度</div>
            </div>
        </div>
    </div>
    <div id="funcbar">
        <button name="Manger" onClick="reflush('/gggl/massage.jsp','Notive_servlet?method=getpage')">公共管理</button>
        <button name="release" onClick="reflush('/gggl/release.jsp','Notive_servlet?method=release')">新建公告</button>
        <button name="query" onClick="reflush('/gggl/query.jsp','Notive_servlet?method=query')">公告查询</button>
    </div>    
    <form id="function" action="Notive_servlet?method=getpage"  method="post">
    <div id="center"><jsp:include page="massage.jsp" ></jsp:include></div>
    </form>

    <div id="south">
        <table align="center" weight="1500px">
            <tr>
                <td>在线5人</td>
                <td align="center">东莞理工学院城市学院</td>
            </tr>
        </table>
    <div></div>
    </div>
</body>
</html>