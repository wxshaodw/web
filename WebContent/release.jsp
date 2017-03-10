<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
</head>
<body>
<table border="1" >
    <tr>
        <td>
            <select>
                <option></option>
            </select>
        </td>
        <td width="500px">
        <input type="text" value="请输入标题内容" width="80px"/>
        </td>
    </tr>
    <tr height="100px">
        <td>按部门发布：<br>
        <a>或按人员或角色发布</a></td>
        <td width="500px">
        </td>
    </tr>
    <tr>
        <td>发布状态：</td>
        <td width="500px">
        <select>
            <option>全部</option>
            <option>未发布</option>
            <option>已发布</option>
        </select>
        </td>
    </tr>
        <tr>
        <td>是否顶置：</td>
        <td width="500px">
        <select>
            <option>全部</option>
            <option>未顶置</option>
            <option>已顶置</option>
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
            <input type="text">
            <label>至</label>
            <input type="text">
        </td>
    </tr>   
        <tr>
        <td>生效状态：</td>
        <td width="500px">
            <select>
                <option>全部</option>
                
            </select>
        </td>
    </tr>    
    <tr>
        <td>操作：</td>
        <td width="500px"></td>
    </tr>
    <tr>
        <td align="center" colspan="2">
        <button type="submit">确定</button>
        <button type="reset">重置</button>
        </td>
    </tr>
</table>
</body>
</html>