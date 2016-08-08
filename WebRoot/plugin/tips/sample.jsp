<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%
String contextPath = StringUtils.getContextPath(request.getContextPath());
request.setAttribute("contextPath",contextPath);
%>
<!-- tips begin -->
<link rel="stylesheet" href="${contextPath}/tips/css/tip-yellow.css" type="text/css">
<script type="text/javascript" src="${contextPath}/tips/js/jquery.poshytip.js"></script>
<!-- tips end -->
<script type="text/javascript">
	renderTips('#logoSpot','xxxxxx');
</script>
