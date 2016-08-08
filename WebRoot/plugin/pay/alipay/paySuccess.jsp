<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/page.tld" prefix="page"%>
<%@ page import="java.util.*"%>
<%@ page import="com.yuyue.util.*" %>
<%@ page import="com.yuyue.web.jo.*" %>

<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
%>
<h1>支付成功！</h1>
<script type="text/javascript">
	setTimeout('window.location.href = "${contextPath}/web/account.htm"',1000);
</script>
