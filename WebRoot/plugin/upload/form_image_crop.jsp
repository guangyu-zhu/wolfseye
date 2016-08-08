<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%@ page import="com.yuyue.cu.util.WebUtils" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	
try{
	String t = request.getParameter("t");
	String path = request.getParameter("path");
	String name = request.getParameter("name");
	String from = request.getParameter("from");
	
	int param1 = 210;
	int param2 = 330;
	int param3 = 70;
	int param4 = 40;
	int param5 = 38;
	int param6 = 40;
	int param7 = 30;
	int param8 = 100;
	int param9 = 310;
	if("true".equals(from)){
		param1 = 700;
		param2 = 1300;
		param3 = 150;
		param4 = 80;
		param5 = 75;
		param6 = 200;
		param7 = 150;
		param8 = 80;
		param9 = 1160;
	}
	
	String index = request.getParameter("index");
	if(index == null){
		index = (String)request.getAttribute("index");
	}
	int offset = name.lastIndexOf("-");
	String preFileName = name.substring(0,offset);
	String sufFileName = name.substring(offset+1);
	name = preFileName + "." + sufFileName;
	String id = request.getParameter("id");
	String imageUrl = contextPath+"/"+CommConstants.FILE_SRC+"/"+path+"/"+name;
	imageUrl += "?id="+Math.random();
	
	String filePath = request.getServletContext().getRealPath(CommConstants.FILE_SRC);
	String fileAbsPath = filePath+File.separator+path+File.separator+name;
	BufferedImage image = ImageIO.read(new File(fileAbsPath));
	int imageWidth = image.getWidth();
	int maxWidth = param1;
	double imageRate = 1;
	if(imageWidth > maxWidth){
		imageRate = (double)imageWidth/(double)maxWidth;
	}
	
	double rates = 1d;
	double w = Double.parseDouble(request.getParameter("w"));
	double h = Double.parseDouble(request.getParameter("h"));
	if((imageWidth + w) > param2){
		rates = (double)(param3)/(double)w;
	}
	if(rates < 0){
		rates *= -1;
	}
	w = (w*rates);
	h = (h*rates);
	double rate = 0;
	if(t == null){
		rate = WebUtils.getAdjustRate(param4,param5,w,h);
	}else{
		rate = WebUtils.getAdjustRate(param6,param7,w,h);
	}
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
<title><%=name%></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="${contextPath}/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="${contextPath}/admin/assets/plugins/jcrop/css/jquery.Jcrop.min.css" rel="stylesheet"/>
<link href="${contextPath}/admin/assets/css/pages/image-crop.css" rel="stylesheet"/>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link href="${contextPath}/admin/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="${contextPath}/admin/assets/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->

<style type="text/css">
body {
	text-align:center;
}
body h1, h2, h3, h4, h5, h6 {
	font-family: 'Microsoft Yahei';
}
.page-title {
	font-family: 'Microsoft Yahei';
}
.page-header-fixed .page-container {
	margin-top: 0px;
}
.page-content {
	margin-left: 0px;
}
#preview-pane .preview-container {
	width: <%=w%>px;
	height: <%=h%>px;
}
.jcrop-holder {
	text-align: center;
}
.page-content-wrapper {
	float: center;
	width: 100%;
}
.tabbable-custom {
	overflow: visible;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
					编辑图片 <small>若图片显示不正常，<a href="javascript:void(0);" onclick="window.location.reload();">点此刷新 <i class="fa fa-refresh"></i></a></small>
					</h3>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
				<div class="col-md-12">
					<div class="tabbable tabbable-custom boxless">
						<div class="tab-content">
							<div class="tab-pane active">
								<h4>用鼠标在图片上滑动设置展现区域
								&nbsp;&nbsp;&nbsp;
								<button id="submitBtn" class="btn purple btn" onclick="return submitCropImageForm();"><i class="fa fa-upload"></i><span> 提交剪裁</span></button>
								<button id="cancelBtn" class="btn warning btn" onclick="return cancelCropImage();"><i class="fa fa-ban"></i><span> 取消剪裁</span></button>
								</h4>
								<div class="row">
									<div id="crop-div" class="col-md-12 responsive-1024">
										<img src="<%=imageUrl%>" id="demo3" alt="" style="max-width: <%=maxWidth%>px;"/>
										<div id="preview-pane" style="right:-<%=w+20%>px;">
											<div class="preview-container">
												<img src="<%=imageUrl%>" class="jcrop-preview" alt="Preview"/>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<input type="hidden" id="path" name="path" value="<%=path%>"/>
<input type="hidden" id="name" name="name" value="<%=name%>"/>
<input type="hidden" id="x" name="x" value="0"/>
<input type="hidden" id="y" name="y" value="0"/>
<input type="hidden" id="w" name="w" value="<%=w%>"/>
<input type="hidden" id="h" name="h" value="<%=h%>"/>
<!-- END CONTAINER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
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
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${contextPath}/admin/assets/plugins/jcrop/js/jquery.color.js"></script>
<script src="${contextPath}/admin/assets/plugins/jcrop/js/jquery.Jcrop.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${contextPath}/admin/assets/scripts/core/app.js"></script>
<script src="${contextPath}/admin/assets/scripts/custom/form-image-crop.js"></script>
<script type="text/javascript">
function submitCropImageForm(){
	$('#submitBtn').attr('disabled','disabled');
	$('#cancelBtn').attr('disabled','disabled');
	$.post('${contextPath}/global/cropImage.do',{
		path: $('#path').val(),
		name: $('#name').val(),
		x: $('#x').val()*<%=imageRate%>,
		y: $('#y').val()*<%=imageRate%>,
		w: $('#w').val()*<%=imageRate%>,
		h: $('#h').val()*<%=imageRate%>,
		width: ${param.w},
		height: ${param.h}
	},function(){
		setInterval('refreshImageSrc()',10);
		setInterval('cancelCropImage()',90);
	});
	return false;
}
function cancelCropImage(){
	//window.opener=null;
	//window.open("","_self");
	//window.close();
	$(window.parent.document).find("#cboxClose").click();
	return false;
}
function refreshImageSrc(){
	<%
		if(id == null){
	%>	
	var iframeWindow = $(window.parent.document.getElementById('upload-iframe-control<%=index%>').contentWindow.document);
	var obj = iframeWindow.find('#singleImage');
	<%
		}else{
	%>
	var iframeWindow = $(window.parent.document.getElementById('multi-upload-iframe-control<%=index%>').contentWindow.document);
	var obj = iframeWindow.find('#<%=id%>');
	<%		
		}
	%>
	var _src = obj.attr('src');
	var src = _src.substring(0,_src.lastIndexOf('?'));
	obj.attr('src','${contextPath}/admin/assets/images/status.gif');
	obj.attr('src',src+'?id='+Math.random());
	obj.attr('width','<%=w/rates*rate%>px');
	obj.attr('height','<%=h/rates*rate%>px');
	<%
		if(t == null){
	%>
	if(typeof $('#editedSpan',$(obj).parent()).html() == 'undefined'){
		obj.after("&nbsp;<span id='editedSpan' style='font-size:13px;color:#852b99;font-family:\"Microsoft Yahei\"'><i class='fa fa-scissors'></i>&nbsp;已编辑</span>");
	}
	<%
		}
	%>
	var h = <%=(int)h*rate%>;
	var iframeWindow2 = $(window.parent.document.getElementById('upload-iframe-control<%=index%>'));
	h = h/1+param8;
	iframeWindow2.css('height',h+'px');
}
function getWidth(id){
	return $('#'+id).css('width');
}
function resetImgMarginLeft(){
	var imgWidth = getWidth('demo3');
	if(imgWidth == '0px'){
		continueResetImgPosition();
	}else{
		imgWidth = imgWidth.substring(0,imgWidth.lastIndexOf('px'));
		$('#crop-div').css('margin-left',((param9-<%=w%>-imgWidth)/2)+'px');
	}
}
function continueResetImgPosition(){
	var imgWidth = getWidth('demo3');
	if(imgWidth == '0px'){
		setTimeout('resetImgMarginLeft()',70);
	}else{
		resetImgMarginLeft();
	}
}
jQuery(document).ready(function() {
	// initiate layout and plugins
	App.init();
	FormImageCrop.init();
	continueResetImgPosition();
});
</script>
<!-- END PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>
<%		
	}catch(Exception e){
		e.printStackTrace();
%>
<script type="text/javascript">
	window.location.href = '${contextPath}/plugin/upload/error_edit.jsp';
</script>
<%		
	}
%>