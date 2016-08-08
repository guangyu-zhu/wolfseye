<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%@ page import="com.yuyue.web.jo.*" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
%>
<!-- 定义css，javascript文件引用 -->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>后台管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="${contextPath}/admin/assets/plugins/font-awesome/css/font-awesome1.4.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="${contextPath}/admin/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/bootstrap-toggle-buttons/static/stylesheets/bootstrap-toggle-buttons.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/bootstrap-datetimepicker1.4/css/datetimepicker.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/chosen-bootstrap/chosen/chosen.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="${contextPath}/admin/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/style-metro.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/pages/tasks.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="${contextPath}/admin/assets/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="${contextPath}/admin/assets/css/custom.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="${contextPath}/logo.ico"/>
<!-- BEGIN PAGINATION STYLES -->
<link href="${contextPath}/admin/assets/css/pagination.css" rel="stylesheet" type="text/css"/>
<!-- END PAGINATION STYLES -->
<style type="text/css">
body {
	font-family: 'Microsoft Yahei', 'Open Sans', sans-serif;
}
.dropdown-menu {
	font-family: 'Microsoft Yahei','Segoe UI',Helvetica, Arial, sans-serif;
}
.page-title {
	font-family: 'Microsoft Yahei', 'Open Sans', sans-serif;
}
h1, h2, h3, h4, h5, h6 {
	font-family: 'Microsoft Yahei', 'Open Sans', sans-serif;
}
.labelRight {
	width: 55px !important;
}
.toggle-button, .toggle-button label {
	margin-top: -1px !important;
}
.basic-toggle-button {
	width: 97px !important;
}
.chzn-container-single .chzn-single {
	box-shadow: none !important;
	background-image: none !important;
	filter: none !important;
	box-shadow: none !important;
	-webkit-box-shadow: none !important;
	-moz-box-shadow: none !important;
	height: 31px !important;
	border-color: #e5e5e5;
	margin: 0 !important;
}
.chzn-container .chzn-results .highlighted {
  background-color: #e2e2e2 !important;
  background-image: -moz-linear-gradient(top, #e2e2e2, #e2e2e2) !important;
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#e2e2e2), to(#e2e2e2)) !important;
  background-image: -webkit-linear-gradient(top, #e2e2e2, #e2e2e2) !important;
  background-image: -o-linear-gradient(top, #e2e2e2, #e2e2e2) !important;
  background-image: linear-gradient(to bottom, #e2e2e2, #e2e2e2) !important;
  background-repeat: repeat-x;
  color: #000;
}
</style>
<!-- BEGIN JAVASCRIPTS -->
<script type="text/javascript">
	var contextPath = '${contextPath}';
</script>
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${contextPath}/admin/assets/plugins/respond.min.js"></script>
<script src="${contextPath}/admin/assets/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="${contextPath}/admin/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${contextPath}/admin/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/chosen-bootstrap/chosen/chosen.jquery.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- END CONTENT -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="${contextPath}/admin/assets/plugins/bootstrap-toggle-buttons/static/js/jquery.toggle.buttons.js"></script>
<script type="text/javascript" src="${contextPath}/admin/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="${contextPath}/admin/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
<script type="text/javascript" src="${contextPath}/admin/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugin/ckeditor/ckeditor.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL STYLES -->
<script type="text/javascript" src="${contextPath}/admin/assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>
<script type="text/javascript" src="${contextPath}/admin/assets/plugins/bootstrap-datetimepicker1.4/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${contextPath}/admin/assets/scripts/custom/ui-alert-dialog-api.js"></script>
<script type="text/javascript" src="${contextPath}/admin/assets/scripts/core/app.js"></script>
<script type="text/javascript" src="${contextPath}/admin/assets/scripts/custom/form-validation.js"></script>
<script type="text/javascript" src="${contextPath}/admin/assets/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- END PAGE LEVEL STYLES -->

<!-- Cooljz Plugin -->
<jsp:include page="plugin.jsp"></jsp:include>

<script type="text/javascript">
jQuery(document).ready(function() {    
   App.init(); // initlayout and core plugins
   //AppComponent.init();
   FormValidation.init(); // initiate layout and plugins
});
</script>
<!-- END JAVASCRIPTS -->
</head>
<!-- END HEAD -->
