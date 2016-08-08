<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%
String contextPath = StringUtils.getContextPath(request.getContextPath());
request.setAttribute("contextPath",contextPath);
%>
<link rel="stylesheet" href="${contextPath}/fancybox/css/jquery.fancybox.css" type="text/css" media="screen">
<script type="text/javascript" src="${contextPath}/fancybox/js/jquery.fancybox.pack.js"></script>