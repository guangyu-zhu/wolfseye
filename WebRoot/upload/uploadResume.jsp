<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.yuyue.CommConstants" %>
<%@ page import="java.io.File" %>
<%
	String contextPath = request.getContextPath();
	request.setAttribute("contextPath", contextPath);
	String id = request.getParameter("id"); 
%>
<html>
	<head>
		<title></title>
		<style type="text/css">
		.col {
			color: #aaaaaa;
			font-size: 15px;
			font-family:"microsoft yahei";
		}
		</style>
	</head>
	<body>
	
	<form action="${contextPath}/web/uploadResumeDoc.do" method="post" enctype="multipart/form-data" onsubmit="document.getElementById('uploadSpan').innerHTML = 'uploading...'">
		<input type="hidden" name="id" value="<%=id%>"> 
		<input type="file" name="formFile" style="width:138px;">
		<%
			String imageSrc = CommConstants.IMAGE_SRC+"/"+id+".doc";
			String imagePath = request.getRealPath(imageSrc);
			File file = new File(imagePath);
		%>
			
		<span style="white-space: nowrap;"><span id="uploadSpan" class="col">
		<%if(file.exists()){
		%>
			文件上传成功 
		<%	
			}%>
		<input type="submit" value="上传"></span></span>

	</form>
	</body>
</html>