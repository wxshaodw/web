<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
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
                    <a>首页</a>
                    <a>上一页</a>
                    <a>下一页</a>
                    <a>尾页</a>
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
</body>
</html>