<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	String bgcolor = request.getParameter("bgcolor");
	String index = request.getParameter("index");
	Object disableObj = request.getAttribute("disableEdit");
	String disableStr = "";
	if(disableObj != null && (Boolean)disableObj == true){
		disableStr = "disabled='disabled'";
	}
	double w = Double.parseDouble(request.getParameter("w"));
	double h = Double.parseDouble(request.getParameter("h"));
	String path = request.getParameter("path");
	String name = (String)request.getAttribute("name");
	if(name == null){
		name = request.getParameter("name");
	}
	String input = request.getParameter("input");
	String _isView = request.getParameter("isView");
	boolean isView = "true".equals(_isView);
%>
<html>
<head>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="${contextPath}/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="${contextPath}/admin/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/admin/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.css" />
<!-- END THEME STYLES -->
<style type="text/css">
body{
	font-family: 'Microsoft Yahei';
	background-color: transparent;
}
.btn.yell {
	background-color: #ff8e0a !important;
	color: #fff !important;
}
.btn.yell:hover, .btn.yell:focus, .btn.yell:active, .btn.yell.active, .btn.yell.disabled, .btn.yell[disabled] {
	background-color: #ffa300 !important;
	color: #fff !important;
}
</style>
<script type="text/javascript">
function isFromPC() { 
	var sUserAgent= navigator.userAgent.toLowerCase(); 
	var bIsIpad= sUserAgent.match(/ipad/i) == "ipad"; 
	var bIsIphoneOs= sUserAgent.match(/iphone os/i) == "iphone os"; 
	var bIsMidp= sUserAgent.match(/midp/i) == "midp"; 
	var bIsUc7= sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4"; 
	var bIsUc= sUserAgent.match(/ucweb/i) == "ucweb"; 
	var bIsAndroid= sUserAgent.match(/android/i) == "android"; 
	var bIsCE= sUserAgent.match(/windows ce/i) == "windows ce"; 
	var bIsWM= sUserAgent.match(/windows mobile/i) == "windows mobile"; 
	if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) { 
		return false;
	} else { 
		return true;
	} 
}
</script>
</head>
<body>
<form id="fileupload" action="${contextPath}/global/uploadFile.do" method="POST" enctype="multipart/form-data">
<input type="hidden" name="path" value="<%=path%>">
<input type="hidden" name="multi" value="single">
<input type="hidden" name="index" value="<%=index%>">
<%
	if(bgcolor != null){
%>
<input type="hidden" name="bgcolor" value="<%=bgcolor%>">
<%		
	}
%>
	<div class="fileupload fileupload-new" data-provides="fileupload">
		<div class="fileupload-new thumbnail" style="max-width: <%=w!=-1&&h!=-1?150*w/h:200%>px; max-height: 150px;">
			<img id="singleImage" style="width: <%=w!=-1&&h!=-1?150*w/h:200%>px; height: 150px;" src="${contextPath}/upload/files/<%=path%>/<%=name %>?id=<%=Math.random() %>" alt="" />
		</div>
		<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
		<div <%=isView?"style='display:none;'":"" %>>
			<a class="btn btn-sm" onclick="rotateLeft();"><i class="fa fa-rotate-left"></i></a>
			<a class="btn btn-sm" style="clear:right;" onclick="rotateRight();"><i class="fa fa-rotate-right"></i></a>
			<a style="clear:left;" <%=disableStr %> class="btn yell edit btn-sm" onclick="return openImageEditWindow('<%=path%>','<%=name%>');"><i class="fa fa-scissors"></i><span></span>
			<%
				if(!disableStr.isEmpty()){
			%>
			<!-- span style="font-size:5px;">(仅支持jpg)</span> -->
			<%		
				}
			%>
			</a>
			<button class="btn remove btn-sm" onclick="return removeImage(this,'<%=path%>','<%=name%>');"><i class="fa fa-trash-o"></i><span></span></button>
		</div>
	</div>
</form>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${contextPath}/admin/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.js" type="text/javascript"></script>
<!-- END PAGE LEVEL STYLES -->
<script type="text/javascript">
var globalNumber = 1;
function openImageEditWindow(path,name){
	$(window.parent.document).find("#dialog_crop_image").attr('href','${contextPath}/plugin/upload/form_image_crop.jsp?index=<%=index%>&t=single&w=<%=(int)w%>&h=<%=(int)h%>&path='+path+'&name='+name.replace("\.","-")+'&from='+isFromPC());
	window.parent.document.getElementById("dialog_crop_image").click();
	return false;
}
function changeImage(){
	var h = $('.fileupload-preview img').css('height');
	var iframeWindow = $(window.parent.document.getElementById('upload-iframe-control<%=index%>'));
	if(typeof h == 'undefined'){
		h = $('#singleImage').css('height');
		h = h.replace('px','');
		<%
			if(isView){
		%>
		h = h/1+30;
		<%
			}else{
		%>
		h = h/1+70;
		<%
			}
		%>
		iframeWindow.css('height',h+'px');
	}else{
		h = h.replace('px','');
		h = h/1+70;
		iframeWindow.css('height',h+'px');
	}
}
function removeImage(obj,path,name){
	$.post('${contextPath}/global/removeFile.do',{path:path,name:name},function(data){
		if(data.success == true){
			$(window.parent.document).find("#<%=input%>").val('');
			$(window.parent.document).find("#<%=input%>").trigger('click');
			window.location.href = '${contextPath}/plugin/upload/image_upload.jsp?w=<%=w%>&h=<%=h%>&path=<%=path%>&name=<%=name%>&input=<%=input%>';
		}
	});
	return false;
}
function resetParentInputValue(){
	var value = '<%=name%>';
	$(window.parent.document).find("#<%=input%>").val(value);
	$(window.parent.document).find("#<%=input%>").trigger('click');
}
function rotateLeft(){
	$('#singleImage').attr('src','${contextPath}/admin/assets/images/status.gif');
	setTimeout('rotateLeft1()',500);
}
function rotateLeft1(){
	globalNumber = globalNumber+1;
	$.post('${contextPath}/ajax.do',{method:'rotateImg',name:'<%=name %>',path:'<%=path%>',angle:-90},function(data){
		$('#singleImage').attr('src','${contextPath}/upload/files/<%=path%>/<%=name %>?id='+globalNumber);
	});
}
function rotateRight(){
	$('#singleImage').attr('src','${contextPath}/admin/assets/images/status.gif');
	setTimeout('rotateRight1()',500);
}
function rotateRight1(){
	globalNumber = globalNumber+1;
	$.post('${contextPath}/ajax.do',{method:'rotateImg',name:'<%=name %>',path:'<%=path%>',angle:90},function(data){
		$('#singleImage').attr('src','${contextPath}/upload/files/<%=path%>/<%=name %>?id='+globalNumber);
	});
}
$(function(){
	setTimeout('changeImage()',1000);
	resetParentInputValue();
});
</script>
</body>
</html>