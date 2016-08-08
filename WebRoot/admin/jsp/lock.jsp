<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.util.DateUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%@ page import="com.yuyue.cu.util.Constants" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>酷建站 - 网站后台管理中心</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="${contextPath}/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="${contextPath}/admin/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="${contextPath}/admin/assets/css/pages/lock.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="logo.ico"/>
<style type="text/css">
h1, h2, h3, h4, h5, h6 {
	font-family: 'Microsoft Yahei';
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body>
<div class="page-lock">
	<div class="page-logo">
		<a class="brand" href="index.html">
			<img src="${contextPath}/admin/images/logo.png" alt="logo"/>
		</a>
	</div>
	<div class="page-body">
		<img class="page-lock-img" src="${contextPath}/admin/images/admin.jpg" alt="">
		<div class="page-lock-info">
			<h1>管理员</h1>
			<span class="email">
				 <a href="http://<%=Constants.HOSTS.split(",")[0]%>${contextPath}" target="_blank">
					http://<%=Constants.HOSTS.split(",")[0]%>
				</a>
			</span>
			<span class="locked">
				 锁定
			</span>
			<form class="login-form" action="${contextPath}/admin/login.do" method="post">
				<div class="input-group input-medium">
					<input type="hidden" name="username" value="administrator">
					<input type="password" name="password" class="form-control" placeholder="Password">
					<span class="input-group-btn">
						<button type="submit" class="btn blue icn-only"><i class="m-icon-swapright m-icon-white"></i></button>
					</span>
				</div>
				<div class="relogin">
					 忘记密码 ?  
					 请点击
					<a href="mailto:service@cooljz.com">
						 这里
					</a>
				 	发送我们邮件
				</div>
			</form>
		</div>
	</div>
	<div class="page-footer">
		 2014 &copy; Ankon     <a href="http://www.cooljz.com" target="_blank">网站制作：酷奥建站</a>
	</div>
</div>
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${contextPath}/admin/assets/plugins/respond.min.js"></script>
<script src="${contextPath}/admin/assets/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="${contextPath}/admin/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${contextPath}/admin/assets/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="${contextPath}/admin/assets/scripts/core/app.js"></script>
<script src="${contextPath}/admin/assets/scripts/custom/lock.js"></script>
<script>
jQuery(document).ready(function() {    
   App.init();
   Lock.init();
});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>