<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.util.DateUtils" %>
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
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="${contextPath}/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/admin/assets/plugins/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/admin/assets/css/style-metro.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/admin/assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/admin/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="${contextPath}/admin/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="${contextPath}/admin/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link href="${contextPath}/admin/assets/css/pages/error.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL STYLES -->
	<link href="${contextPath}/logo.ico" rel="shortcut icon">
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-404-3">
	<div class="page-inner">
		<img src="${contextPath}/admin/assets/img/pages/earth.jpg" alt="">
	</div>
	<div class="container error-404">
		<h1 style="font-family:'Microsoft Yahei';">404</h1>
		<h2 style="font-family:'Microsoft Yahei';">对不起，您访问的页面错误!</h2>
		<p style="font-family:'Microsoft Yahei';">
			如果您是网站管理员, 请联系<a style="font-family:'Microsoft Yahei';" href="http://www.cooljz.com" target="_blank">酷奥建站</a>客服中心。 
		</p>
		<p>
			<a href="${contextPath}" style="font-family:'Microsoft Yahei';">返回首页</a>
			<br>
		</p>
	</div>
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->   <script src="${contextPath}/admin/assets/plugins/jquery-1.10.1.min.js" type="text/javascript"></script>
	<script src="${contextPath}/admin/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="${contextPath}/admin/assets/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      
	<script src="${contextPath}/admin/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${contextPath}/admin/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
	<!--[if lt IE 9]>
	<script src="${contextPath}/admin/assets/plugins/excanvas.min.js"></script>
	<script src="${contextPath}/admin/assets/plugins/respond.min.js"></script>  
	<![endif]-->   
	<script src="${contextPath}/admin/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="${contextPath}/admin/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="${contextPath}/admin/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="${contextPath}/admin/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
	<!-- END CORE PLUGINS -->
	<script src="${contextPath}/admin/assets/scripts/app.js"></script>  
	<script>
		jQuery(document).ready(function() {    
		   App.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>