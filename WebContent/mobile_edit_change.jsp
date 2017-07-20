<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8" />
		<title>Simple Examples</title>
		<style>
			form {
				margin: 0;
			}
			textarea {
				display: block;
			}
		</style>
		<link rel="stylesheet" href="./kindeditor-4.1.7/themes/default/default.css" />
		<script charset="utf-8" src="./kindeditor-4.1.7/kindeditor.js"></script>
		<script charset="utf-8" src="./kindeditor-4.1.7/lang/zh_CN.js"></script>
				<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					designMode : true,
					items : [
								'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
								'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
								'insertunorderedlist']
				});
				editor.sync();
			});
			
			function submit_content(){
				var data_form=document.getElementById("text_content");
				editor.sync();
				data_form.submit();
			}
		</script>
</head>
<body>
		<form id="text_content" action="Notive_servlet_mobile?method=get_moblie_content" method="post">
			<textarea id="content_data" name="content" style="width:20px;height:20px;visibility:hidden;">
			<%=session.getAttribute("change_data")%>
			</textarea>
		</form>
</body>
</html>