<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/page.tld" prefix="page"%>
<%@ page import="java.util.*"%>
<%@ page import="com.yuyue.util.*" %>
<%@ page import="com.yuyue.web.jo.*" %>

<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	AccountJo accountJo = (AccountJo)request.getAttribute("accountJo");
%>
    <!-- //////////////////////////////////
//////////////PAGE CONTENT///////////// 
////////////////////////////////////-->


    <div class="container">
        <h1 class="title-hero" style="font-size: 100px;">

	支付成功！ 

</h1>
        <h1>支付成功！</h1>
        <div class="gap gap-small"></div><a href="${contextPath}/web/account.htm" class="btn btn-primary btn-mega">您可以在我的帐户下载</a>
        <div class="gap"></div>
    </div>


    <!-- //////////////////////////////////
//////////////END PAGE CONTENT///////// 
////////////////////////////////////-->
