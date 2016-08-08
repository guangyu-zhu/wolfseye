<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
%>
<html>
<head>
<meta charset="utf-8" />
</head>
<body style="overflow:hidden;padding:0px;margin:0px;">
<iframe id="ifm" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"  width="1554" height="500" src="${contextPath}/plugin/map/bmap.jsp?c=安瑞索思&l=logo.png&w=270&h=60&x=121.446934&y=31.199357"></iframe>
<script type="text/javascript">
document.getElementById('ifm').width = window.screen.width*0.8;
document.getElementById('ifm').height = window.screen.height*0.8;
</script>
</body>
</html>