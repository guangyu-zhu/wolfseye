<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.yuyue.CommConstants" %>
<%@ page import="java.io.File" %>
<%
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 
%>

<%
	String contextPath = request.getContextPath();
	request.setAttribute("contextPath", contextPath);
	String id = request.getParameter("id");
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
	<form action="${contextPath}/admin/uploadProductImage.do" method="post" enctype="multipart/form-data" onsubmit="document.getElementById('uploadSpan').innerHTML = 'uploading...'">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="hidden" name="width" value="<%=w%>">
		<input type="hidden" name="height" value="<%=h%>">
		<input type="file" name="formFile" style="width:138px;">
		<%
			String imageSrc = CommConstants.IMAGE_SRC+"/"+id+".jpg";
			String imagePath = request.getRealPath(imageSrc);
			File file = new File(imagePath);
			if(file.exists()){
		%>
			<img id="imgBox" style="float:right; height:63px; width:63px" src="<%=imageSrc%>">
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