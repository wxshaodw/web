<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr height="60"></tr>
<tr>
<table align="center" border="1" >
    <tr>
        <td>标题：</td>
        <td width="500px">
        <input type="text" name="title" placeholder="请输入标题内容" width="80px"/>
        </td>
    </tr>
    <tr>
        <td>类别：</td>
        <td>
            <select name="type">
                <option value=""></option>
                <option value="决定">决定</option>
                <option value="通知">通知</option>
                <option value="报告">报告</option>
                <option value="其他">其他</option>
            </select>
        </td>
    </tr>
    <tr height="50px">
        <td>按部门发布：<br>
        <a>或按人员或角色发布</a></td>
        <td width="500px">
        </td>
    </tr>
    <tr>
        <td>发布状态：</td>
        <td width="500px">
        <select name="state">
            <option value="未发布">未发布</option>
            <option value="已发布">已发布</option>
        </select>
        </td>
    </tr>
        <tr>
        <td>是否顶置：</td>
        <td width="500px">
        <select name="top">
            <option value="未顶置">未顶置</option>
            <option value="已顶置">已顶置</option>
        </select>
        </td>
    </tr>
        <tr>
        <td>发布时间：</td>
        <td width="500px"><input type="date" name="release_time"></td>
    </tr>
        <tr>
        <td>有效时间：</td>
        <td width="500px">
            <input type="date" name="begin_time">
            <label>至</label>
            <input type="date" name="end_time">
        </td>
    </tr>   
        <tr>
        <td>添加附件：</td>
        <td width="500px">
        </td>
    </tr>    
    <tr height="200px">
    <td colspan="2"><textarea name="content" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea></td>
    </tr>
    <tr>
        <td align="center" colspan="2">
        <input type="button" name="load" value="加载JS并创建编辑器" />
        </td>
    </tr>
</table>
</tr>
</table>
</html>