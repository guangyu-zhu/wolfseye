<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
%>
<html>
<head>
</head>
<body>
<img width="100%" src="${contextPath}/plugin/upload/edit_failed.png">
</body>
</html>