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
    var checkedIds=[];
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
        document.getElementById("data").innerHTML=xmlhttp.responseText;
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
    	var method_1=document.getElementById("function").action;
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
    		method_1=method_1+"&employee_selected="+checkedIds;
    		document.getElementById("function").action=method_1;
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
    	var method_1=document.getElementById("function").action;
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
    		method_1=method_1+"&employee_selected="+checkedIds;
    		document.getElementById("function").action=method_1;
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
    
    function    locking_getvalues(add_page){
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
    	checkedIds=[];
    	document.getElementById("eployee_list").innerHTML="";
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
    
    function get_checkbox_value(text,theForm){
    	var t=document.getElementById(text);
    	t.value=checkedIds;
    	Lock_CheckForm(theForm)
    	
    }
    
    function details(N_id){
		var url="/gggl/check.jsp?no="+N_id
		window.open(url,"","width=900,height=700,Left=250,Top=30");
	}
    
    function get_employee_list(no){
    	var url="/gggl/employee_list.jsp?no="+no;
    	if(window.XMLHttpRequest){
    		xmlhttp=new XMLHttpRequest();
    	}
    	else{
    		xmlhttp=new ActivexOject("Microsoft.XMLHTTP");
    	}
    	if(xmlhttp!=null){
    		xmlhttp.onreadystatechange=state_Change_1;
    		xmlhttp.open("GET",url,true);
    		xmlhttp.send();
    	}
    	else{
    		alert("浏览器不支持");
    	}
    }
    function state_Change_1()
    {
    if (xmlhttp.readyState==4)
      {// 4 = "loaded"
      if (xmlhttp.status==200)
        {// 200 = "OK"
        document.getElementById("eployee_list").innerHTML=xmlhttp.responseText;
    	getChecked();
        }
      else
        {
        alert("Problem retrieving data:" + xmlhttp.statusText);
        }
      }
    }
    
    function changeIds(){
        var oneches=document.getElementsByName("employee_selected");
        var num=0;
      for(var i=0;i<oneches.length;i++){
          if(oneches[i].checked==true){
              //避免重复累计id （不含该id时进行累加）
              for(var j=0;j<checkedIds.length;j++){
            	  if(oneches[i].value==checkedIds[j]){
            		  num=1;
            		  break;
            	  }
              }
              if(num==0){
            	  checkedIds.push(oneches[i].value);
              }
              num=0;
          }
          if(oneches[i].checked==false){
              //取消复选框时 含有该id时将id从全局变量中去除
              for(var j=0;j<checkedIds.length;j++){
            	  if(oneches[i].value==checkedIds[j]){
            		  checkedIds.splice(j, 1);
            	  }
              }
          }
      }
   }

function getChecked(){
         var oneches=document.getElementsByName("employee_selected");
      for(var i=0;i<oneches.length;i++){
    	  for(var j=0;j<checkedIds.length;j++){
    		  if(oneches[i].value==checkedIds[j]){
                  oneches[i].checked=true;
    		  }
    	  }
          }
   }
</script>
<title>公告管理系统</title>
<style type="text/css">
#north{
	background:url(image/bg_2.jpg);
    background-size:100%;
    background-repeat:no-repeat;
}
#center{
    background-color: white;
}
</style>
</head>
<body  class="container-fluid">
    <div id="north" class="row">
        <div class="col-md-12" id="north_left">
            <div class="pull-right"><h4>${sessionScope.Employee.getP_name() },欢迎你<a href="user_servlet?methods=sign_out">注销</a></h4></div>
        </div>
        <img class="img-rounded" src="./image/logo.png" height="119" id=logo>
            <ul id="guide" class="col-md-12 nav nav-tabs">
                <c:if test="${sessionScope.User.getU_type()=='管理员'}"><li role="presentation" class="active"><a onClick="flush('Notive_servlet?method=getPage')" data-toggle="tab">公告管理</a></li></c:if>
                <c:if test="${sessionScope.User.getU_type()=='一般用户' }"><li role="presentation"  class="active"><a onClick="flush('Notive_servlet?method=getPage')" data-toggle="tab">公告查看</a></li></c:if>
                <li role="presentation" class=""><a onClick="reflush('/gggl/release.jsp','Notive_servlet?method=release')" data-toggle="tab">新建公告</a></li>
                <li role="presentation" class=""><a onClick="reflush('/gggl/query.jsp','Notive_servlet?method=query')" data-toggle="tab">公告查询</a>
            </ul>
    </div>
    <form id="function" action="Notive_servlet?method=getpage"  method="post">
    <div id="center">
        <div id="data">
        <jsp:include page="massage.jsp" ></jsp:include>
        <div>
    </div>
    </form>
</body>
</html>