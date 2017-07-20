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
			.ke-container.ke-container-default{
			width:350px!important;
			height:400px!important;
			}
		</style>
		<link rel="stylesheet" href="./kindeditor-4.1.7/themes/default/default.css" />
		<script charset="utf-8" src="./kindeditor-4.1.7/kindeditor.js"></script>
		<script charset="utf-8" src="./kindeditor-4.1.7/lang/zh_CN.js"></script>
		<script>
			var editor;
			function submit_content(){
				editor.sync();
	        	document.getElementById("data_form").submit();
			}
			
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					resizeType : 1,
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					designMode : true,
					items : [
								'fontname', 'fontsize', '|','bold', 'italic', 'underline',
								'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
								'insertunorderedlist']
				});
				editor.sync();
			});
		</script>
</head>
<body>
		<form id="data_form" action="Notive_servlet_mobile?method=get_moblie_content" method="post">
			<textarea  name="content" style="width:350px;height:400px;visibility:hidden;"></textarea>
		</form>
		
</body>
</html>