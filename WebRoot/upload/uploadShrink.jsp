<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.yuyue.CommConstants" %>
<%@ page import="java.io.File" %>
<%
	String contextPath = request.getContextPath();
	request.setAttribute("contextPath", contextPath);
	String name = request.getParameter("name");
	String w = request.getParameter("w");
	String h = request.getParameter("h");
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
	<form action="${contextPath}/admin/uploadShrinkImage.do" method="post" enctype="multipart/form-data" onsubmit="document.getElementById('uploadSpan').innerHTML = 'uploading...'">
		<input type="hidden" name="width" value="<%=w%>">
		<input type="hidden" name="height" value="<%=h%>">
		<input type="file" name="formFile" style="width:138px;">
		<%
			String imageSrc = CommConstants.TEMP_SRC+"/"+name;
			String imagePath = request.getRealPath(imageSrc);
			File file = new File(imagePath);
			if(file.exists()){
		%>
			<a href="${contextPath}/<%=imageSrc%>" target="_blank"><img id="imgBox" style="float:right; height:63px; width:63px" src="<%=imageSrc%>"></a>
		<%	
			}
		%>
		<br>
		<span style="white-space: nowrap;"><span class="col">像素：<%=w%>×<%=h%></span><span id="uploadSpan" class="col"><input type="submit" value="上传"></span></span>
		<script type="text/javascript">
			document.getElementById('imgBox').src = '${contextPath}/<%=imageSrc%>?'+Math.random();
		</script>
	</form>
	</body>
</html>