<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page import="com.csxy.gggl.web.Page" %>
<%@ page import="com.csxy.gggl.domain.Notive" %>
<%@ page import="com.csxy.gggl.domain.User" %>
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
    	createEditor();
        }
      else
        {
        alert("Problem retrieving data:" + xmlhttp.statusText);
        }
      }
    }
    
    function delete_1(method){
    	if(window.confirm("删除操作执行后不能恢复，您是否确定删除")){
        	document.getElementById("function").action=method;
        	document.getElementById("function").submit();
    	}
    }
    
    function release(){
    	var release_time=document.getElementById("release_time").value;
    	var begin_time=document.getElementById("begin_time").value;
    	var end_time=document.getElementById("end_time").value;
    	document.getElementById("r_time_error").innerHTML="";
    	document.getElementById("b_e_time_error").innerHTML="";
    	if(release_time==""){
    		document.getElementById("r_time_error").innerHTML="发布时间不能为空";
    	}else if(begin_time==""){
    		document.getElementById("b_e_time_error").innerHTML="起始时间不能为空";
    	}else if(end_time==""){
    		document.getElementById("b_e_time_error").innerHTML="终止时间不能为空";
    	}else if(begin_time>end_time){
    		document.getElementById("b_e_time_error").innerHTML="起始时间不能大于终止时间";
    	}
    	else{
        	document.getElementById("function").submit();
        	alert("添加成功");
    	}
    }
    
    function update(page, method){
    	reflush(page, method);
    }
    
    function flush(method){
    	document.getElementById("function").action=method;
    	document.getElementById("function").submit();
    }
    
    function updatetodatebase(){
    	var release_time=document.getElementById("release_time").value;
    	var begin_time=document.getElementById("begin_time").value;
    	var end_time=document.getElementById("end_time").value;
    	document.getElementById("r_time_error").innerHTML="";
    	document.getElementById("b_e_time_error").innerHTML="";
    	if(release_time==""){
    		document.getElementById("r_time_error").innerHTML="发布时间不能为空";
    	}else if(begin_time==""){
    		document.getElementById("b_e_time_error").innerHTML="起始时间不能为空";
    	}else if(end_time==""){
    		document.getElementById("b_e_time_error").innerHTML="终止时间不能为空";
    	}else if(begin_time>end_time){
    		document.getElementById("b_e_time_error").innerHTML="起始时间不能大于终止时间";
    	}
    	else{
        	document.getElementById("function").submit();
        	alert("修改成功");
    	}
    }
    
    function T1(max,method){
    	var target_page=document.getElementById("target").value;
    	if(target_page=="")alert("目标页不能为空");
    	else if(target_page>max){
    		alert("跳转页号过大,请重新输入");
    	}else{
        	document.getElementById("function").action=method;
        	document.getElementById("function").submit();
    	}
    }
    
    function screen_by_type(method){
    	document.getElementById("function").action=method;
    	document.getElementById("function").submit();
    }
    
    function    locking(add_page){   
    	   document.all.ly.style.display="block";   
    	   document.all.ly.style.width=document.body.clientWidth;   
    	   document.all.ly.style.height=document.body.clientHeight; 
    	   document.getElementById(add_page).style.display="block";
    	   }   
    
    function    Lock_CheckForm(theForm){   
    	   document.all.ly.style.display='none';
    	   document.getElementById(theForm).style.display='none';
    	   }
    
    function    Lock_CheckForm_clean(theForm,box){   
    	var boxs=document.getElementsByName(box);
    	var length=boxs.length;
    	for(i=0;i<length;i++){
    		boxs[i].checked=false;
    	}
 	   document.all.ly.style.display='none';
 	   document.getElementById(theForm).style.display='none';
 	   }
    	  
    function createEditor(){
		$.getScript('./kindeditor-4.1.7/kindeditor-min.js', function() {
			KindEditor.basePath = './kindeditor-4.1.7/';
			Editor=KindEditor.create('textarea[name="content"]',{
				afterBlur:function(){this.sync();}
			});
			Editor.sync();
			});
    }
    
    function get_checkbox_value(box,text,theForm){
    	var boxs=document.getElementsByName(box);
    	var t=document.getElementById(text);
    	var length=boxs.length;
    	var str="";
    	for(i=0;i<length;i++){
    		if(boxs[i].checked==true){
    			str+=boxs[i].value+'、';
    		}
    	}
    	t.value=str;
    	Lock_CheckForm(theForm)
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
</style>
<% User User=(User)session.getAttribute("User"); %>
<c:set var="user_type" ><%=User.getU_type() %></c:set>
</head>
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
        <c:if test="${sessionScope.User_type=='管理员'}"><button name="Manger" onClick="flush('Notive_servlet?method=getPage')">公告管理</button></c:if>
        <c:if test="${sessionScope.User_type=='一般用户' }"><button name="" onClick="flush('Notive_servlet?method=getPage')">公告查看</button></c:if>
        <button name="release" onClick="reflush('/gggl/release.jsp','Notive_servlet?method=release')">新建公告</button>
        <button name="query" onClick="reflush('/gggl/query.jsp','Notive_servlet?method=query')">公告查询</button>
    </div>    
    <form id="function" action="Notive_servlet?method=getpage"  method="post">
    <div id="center">
        <jsp:include page="massage.jsp" ></jsp:include>
    </div>
    </form>

   <!--<div id="south">
        <table align="center" weight="1500px">
            <tr>
                <td>在线5人</td>
                <td align="center">东莞理工学院城市学院</td>
            </tr>
        </table>
    <div></div>
    </div>-->
</body>
</html>