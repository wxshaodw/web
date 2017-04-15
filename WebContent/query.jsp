<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<table>
<tr height="150" align="center"><h2 align="center">查询公告</h2></tr>
<tr>
<table id="query" align="center" border="1" >
        <tr>
        <td>类型：</td>
        <td width="500px">
            <select name="type">
                <option value="全部">全部</option>
                <option value="决定">决定</option>
                <option value="通知">通知</option>
                <option value="报告">报告</option>
                <option value="其他">其他</option>
            </select>
        </td>
    </tr>
    <tr>
        <td>发布状态：</td>
        <td width="500px">
        <select name="state">
            <option value="全部">全部</option>
           <option value="待审核">待审核</option>
            <option value="待生效">待生效</option>
            <option value="已生效">已生效</option>
            <option value="已失效">已失效</option>
        </select>
        </td>
    </tr>
        <tr>
        <td>是否顶置：</td>
        <td width="500px">
        <select name="top">
            <option value="全部">全部</option>
            <option value="未顶置">未顶置</option>
            <option value="已顶置">已顶置</option>
        </select>
        </td>
    </tr>
        <tr>
        <td>标题：</td>
        <td width="500px"><input type="text"></td>
    </tr>
        <tr>
        <td>发布日期：</td>
        <td width="500px">
            <input name="begin_time" type="date">
            <label>至</label>
            <input name="end_time" type="date">
        </td>
    </tr>    
    <tr>
        <td align="center" colspan="2">
        <button type="submit">确定</button>
        <button type="reset">重置</button>
        </td>
    </tr>
</table>
</tr>
</table>
</body>
</html>