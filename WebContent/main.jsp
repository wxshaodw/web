<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page import="com.csxy.gggl.web.Page" %>
<%@ page import="com.csxy.gggl.domain.Notive" %>
<%@ page import="com.csxy.gggl.domain.User" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" media="screen" />
<script src="http://code.jquery.com/jquery.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script charset="utf-8" src="./kindeditor-4.1.7/jquery.js"></script>
<script charset="utf-8" type="text/javascript">
    var Editor;
    var xmlhttp;
    function reflush(page,method,guideid){
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
    function details(N_id){
		var url="/gggl/check.jsp?no="+N_id
		window.open(url,"","width=900,height=700,Left=250,Top=30");
	}
</script>
<title>公告管理系统</title>
<% User User=(User)session.getAttribute("User"); %>
<c:set var="user_type" ><%=User.getU_type() %></c:set>
</head>
<body  class="container-fluid">
    <div id="north" class="row">
        <div class="col-md-4" id="north_left"><img class="img-rounded" src="./image/logo.png" height="119" id=logo></div>
        <div class="row"  id="north_right">
            <div class="col-md-1 pull-right" id="datetime">
                <div name="time">10:08</div>
                <div name="date">2017/2/22</div>
                <div name="">农历</div>
            </div>
            <div class="col-md-1 pull-right" id="weather">
                <div name="area">东莞</div>
                <div name="weather">雨天</div>
                <div name="nl">温度</div>
            </div>
        </div>
    </div>
    <ul id="guide" class="nav nav-tabs">
      <c:if test="${sessionScope.User_type=='管理员'}"><li role="presentation" class="active"><a onClick="flush('Notive_servlet?method=getPage')" data-toggle="tab">公告管理</a></li></c:if>
      <c:if test="${sessionScope.User_type=='一般用户' }"><li role="presentation"  class="active"><a onClick="flush('Notive_servlet?method=getPage')" data-toggle="tab">公告查看</a></li></c:if>
      <li role="presentation" class=""><a onClick="reflush('/gggl/release.jsp','Notive_servlet?method=release')" data-toggle="tab">新建公告</a></li>
      <li role="presentation" class=""><a onClick="reflush('/gggl/query.jsp','Notive_servlet?method=query')" data-toggle="tab">公告查询</a>
    </ul>
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