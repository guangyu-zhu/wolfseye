<%@ page pageEncoding="UTF-8"%>
<%@ page import=" com.yuyue.util.StringUtils"%>
<%
String contextPath = StringUtils.getContextPath(request.getContextPath());
request.setAttribute("contextPath",contextPath);
%>
<!DOCTYPE html>
<html>
<head>
	<title>wolfseye</title>
	<link href="${contextPath}/logo.ico" rel="shortcut icon">
</head>
<body>
	<jsp:forward page="/web/home.do"></jsp:forward>
</body>
</html>
