<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='main.css'>
<script type="text/javascript">
    var xmlhttp;
    function reflush(url){
    	
    	if(window.XMLHttpRequest){
    		xmlhttp=new XMLHttpRequest();
    	}
    	else{
    		xmlhttp=new ActivexOject("Microsoft.XMLHTTP");
    	}
    	if(xmlhttp!=null){
    		xmlhttp.onreadystatechange=state_Change;
    		xmlhttp.open("GET",url,true);
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
        }
      else
        {
        alert("Problem retrieving data:" + xmlhttp.statusText);
        }
      }
    }
</script>
<title>公告管理系统</title>
</head>
<body>
    <div id="north">
        <div id="north_left"><img id=logo src="./image/logo.jpg"></div>
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
    <div id="testbar">
        <div id="testbar_left"><button id="menu">菜单</button></div>
        <div id="testbar_center">当前任务</div>
        <div id="testbar_right">拓展功能</div>
    </div>
    <div id="funcbar">
        <button onclick="reflush('/gggl/massage.jsp')">未读公告</button>
        <button onclick="reflush('/gggl/massage.jsp')">已读公告</button>
        <button onclick="reflush('/gggl/massage.jsp')">公告查询</button>
    </div>
    <div id="center">
    </div>
    <div id="south">
        <table align="center" weight="1500px">
            <tr>
                <td>在线5人</td>
                <td align="center">东莞理工学院城市学院</td>
                <td align="right">
                    <a>额外1</a>
                    <a>额外2</a>
                    <a>额外3</a>
                </td>
            </tr>
        </table>
    <div></div>
    </div>
</body>
</html>