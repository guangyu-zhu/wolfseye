<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/page.tld" prefix="page"%>
<%@ page import="java.util.List" %>
<%@ page import="com.yuyue.util.DateUtils" %>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.web.jo.NewsJo" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	List<NewsJo> list = (List<NewsJo>)request.getAttribute("objectList");
%>



