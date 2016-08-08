<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
%>
<!-- cooljz plugin BEGIN -->
<script type='text/javascript'>
var contextPath = '<%=request.getContextPath() %>';
var ajax_sep_param = '<%=CommConstants.AJAX_SAVE_SEPARATOR_PARAM%>';
var ajax_sep_kv = '<%=CommConstants.AJAX_SAVE_SEPARATOR_KV%>';
</script>
<link href="${contextPath}/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link rel='stylesheet' href='${contextPath}/plugin/pagination/style.css' type='text/css' media='all' />
<script type='text/javascript' src='${contextPath}/plugin/cooljz/script.js'></script>
<!-- cooljz plugin END -->
<!-- colorbox BEGIN -->
<link rel="stylesheet" href="${contextPath}/plugin/colorbox/theme3/colorbox.css" />
<script src="${contextPath}/plugin/colorbox/jquery.colorbox-min.js"></script>
<!-- colorbox BEGIN -->
<!-- lightbox BEGIN -->
<link rel="stylesheet" type="text/css" href="${contextPath}/plugin/lightbox/css/jquery.lightbox.css" />
<script type="text/javascript" src="${contextPath}/plugin/lightbox/js/jquery.lightbox.min.js"></script>
<!-- lightbox END -->
<!-- prettyPhoto BEGIN -->
<link href="${contextPath}/plugin/prettyPhoto/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath}/plugin/prettyPhoto/js/jquery.prettyPhoto.min.js"></script>
<!-- prettyPhoto END -->
<!-- toast message BEGIN -->
<link rel="stylesheet" href="${contextPath}/plugin/toastmessage/css/jquery.toastmessage-min.css" type="text/css">
<script type="text/javascript" src="${contextPath}/plugin/toastmessage/js/jquery.toastmessage-min.js"></script>
<script type="text/javascript">
	window._toastType = '${sessionScope.toast_type }';
	window._toastMessage = '${sessionScope.toast_message }';
</script>
<%
	session.removeAttribute("toast_type");
	session.removeAttribute("toast_message");
%>
<!-- toast message END -->

<!-- animate BEGIN -->
<link rel="stylesheet" href="${contextPath}/plugin/animate/animate.css">
<script src="${contextPath}/plugin/animate/wow.js"></script>
<script src="${contextPath}/plugin/animate/device.min.js"></script>
<script>
 	$(function(){
	if ($('html').hasClass('desktop')) {
             new WOW().init();
         }
 	});
</script>
<!-- animate END -->