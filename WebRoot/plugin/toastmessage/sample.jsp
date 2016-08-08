<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<!-- toast message begin -->
<link rel="stylesheet" href="${contextPath}/toastmessage/css/jquery.toastmessage-min.css" type="text/css">
<script type="text/javascript" src="${contextPath}/toastmessage/js/jquery.toastmessage-min.js"></script>
<script type="text/javascript">
	window._toastType = '${sessionScope.toast_type }';
	window._toastMessage = '${sessionScope.toast_message }';
</script>
<%
	session.removeAttribute("toast_type");
	session.removeAttribute("toast_message");
%>
<!-- toast message end -->

request.getSession().setAttribute("toast_message", "xxx");
request.getSession().setAttribute("toast_type", "xxx");