<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.util.StreamUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>Error Page</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<!-- END PAGE LEVEL STYLES -->
	<link href="${contextPath}/logo.ico" rel="shortcut icon">
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-404-3">
<%=StreamUtils.getFileContent("/home/web/prd/server/apache-tomcat-7.0.47/logs/catalina.out").replaceAll(">", "&gt;").replaceAll("<", "&lt;").replaceAll("\t", "<span style='padding-left:100px;'>&nbsp;</span>").replaceAll("\n", "<br>") %>
</body>
<!-- END BODY -->
</html>