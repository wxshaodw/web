<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='gggl_i.css'>
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
        <button>未读公告</button>
        <button>已读公告</button>
        <button>公告查询</button>
    </div>
    <div id="center">
        <div id="control">
            <form>
                <div id="control_left">
                    <img />
                    <font>公告通知</font>
                    <select id="type">
                        <option>所有类型</option>
                    </select>
                    <font>发布日期：</font>
                    <input type="text"/>
                    <input type="button" value="确定" />
                </div>
                <div id="control_right">
                    <font id=page>1/7页</font>
                    <a></a>
                    <a></a>
                    <a></a>
                    <a></a>
                    <font>跳转到：第</font>
                    <input id="page" />
                    <font>页</font>
                    <a>跳转</a>
                </div>
            </form>
        </div>
        <div id="data">
            <table align=center id="rs" border="2">
                <tr>
                    <td style="width:150px;overflow: hidden;" align=center>发布人</td>
                    <td style="width:120px;overflow: hidden;" align=center>类型</td>
                    <td style="width:150px;overflow: hidden;" align=center>标题</td>
                    <td style="width:800px;overflow: hidden;" align=center>发布范围</td>
                    <td style="width:180px;overflow: hidden;" align=center>生效日期</td>
                </tr>
        </table>
        </div>
        <div id="quicket">
            <font>快捷操作：</font>
            <button>标记所有公告为已读</button>
            <button>按生效日期排列</button>
        </div>
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