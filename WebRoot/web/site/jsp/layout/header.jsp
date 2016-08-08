<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>狼眼</title>
  <meta charset="utf-8">
  <meta name="format-detection" content="telephone=no"/>

  <link rel="stylesheet" href="${contextPath}/web/site/css/grid.css">
  <link rel="stylesheet" href="${contextPath}/web/site/css/style.css">
  <link rel="stylesheet" href="${contextPath}/web/site/css/camera.css">
  <link rel="stylesheet" href="${contextPath}/web/site/css/mailform1.css">
  <script src="${contextPath}/web/site/js/jquery.js"></script>
  <script src="${contextPath}/web/site/js/jquery-migrate-1.2.1.js"></script> 
  <script type="text/javascript">
   var contextPath = '${contextPath}';
  </script>
  <!-- Cooljz Plugin -->
<jsp:include page="plugin.jsp"></jsp:include>

<style type="text/css">
	body,h1,h2,h3,h4,h5,h6,h7,h8,span,p,a,div,ul,li,form,input,label{
		font-family:'Microsoft Yahei';
	}
</style>
  <!--[if lt IE 9]> 
  <html class="lt-ie9">
  <div style=" clear: both; text-align:center; position: relative;">
    <a href="http://windows.microsoft.com/en-US/internet-explorer/..">
      <img src="${contextPath}/web/site/images/warning_bar_0000_us.jpg" border="0" height="42" width="820"
           alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
    </a>
  </div>
  <script src="${contextPath}/web/site/js/html5shiv.js"></script>
  <![endif]-->
  <script src='${contextPath}/web/site/js/device.min.js'></script>
</head>
<body>
<div class="page">
  <!--========================================================
                            HEADER
  =========================================================-->
  <header>
    <div class="top-row">
      <div class="container">
        <div class="brand">
          <h1 class="brand_name">
            <a href="＃">狼眼</a>
          </h1>
          <p class="brand_slogan">
            教您读懂大盘
          </p>
        </div>
        <div class="phone1">
          <p>热线咨询</p>
          <strong>
            <a href="callto:#">+1-234-567-8900</a>
          </strong>
        </div>
      </div>
    </div>
  </header>
