<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
%>
</body>
<!-- END BODY -->
</html>