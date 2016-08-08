<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	String index = request.getParameter("index");
	String bgcolor = request.getParameter("bgcolor");
	double w = Double.parseDouble(request.getParameter("w"));
	double h = Double.parseDouble(request.getParameter("h"));
	String path = request.getParameter("path");
	String name = request.getParameter("name");
	String input = request.getParameter("input");
	String _isView = request.getParameter("isView");
	boolean isView = "true".equals(_isView);
	Object uploadFailed = request.getAttribute("uploadFailed");
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
</style>
</head>
<body>
<form id="fileupload" action="${contextPath}/global/uploadFile.do" method="POST" enctype="multipart/form-data">
<input type="hidden" name="path" value="<%=path%>">
<input type="hidden" name="multi" value="single">
<input type="hidden" name="w" value="<%=w%>">
<input type="hidden" name="h" value="<%=h%>">
<input type="hidden" name="input" value="<%=input%>">
<input type="hidden" name="index" value="<%=index%>">
<%
	if(bgcolor != null){
%>
<input type="hidden" name="bgcolor" value="<%=bgcolor%>">
<%		
	}
%>
	<div class="fileupload fileupload-new" data-provides="fileupload">
		<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
			<img id="initialImg" src="${contextPath}/admin/assets/img/no_image.gif" alt="" />
		</div>
		<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px; min-height:50px;"></div>
		<div <%=isView?"style='display:none;'":"" %>>
			<span class="btn btn-file"><span class="fileupload-new">添加图片</span>
			<span class="fileupload-exists">更换图片</span>
			<input type="file" name="formFile" class="default" onchange="setTimeout('changeImage()',300);"/></span>
			<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">取消图片</a>
			<button id="startUpload" class="btn blue start btn-sm">
                <i class="fa fa-upload"></i>
                <span>开始上传</span>
            </button>
            <img id="img_load" style="width:30px;height:30px;display:none;" src="${contextPath}/admin/assets/images/status.gif">
		</div>
	</div>
</form>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${contextPath}/admin/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.js" type="text/javascript"></script>
<!-- END PAGE LEVEL STYLES -->
<script type="text/javascript">
function changeImage(){
	jQuery('#startUpload').html('<i class="fa fa-upload"></i><span>开始上传</span>');
	jQuery('#img_load').hide();
	var h = $('.fileupload-preview img').css('height');
	var tl = $('.fileupload-preview').text().length;
	var iframeWindow = $(window.parent.document.getElementById('upload-iframe-control<%=index%>'));
	if(typeof h == 'undefined' && tl == 0){
		iframeWindow.css('height','207px');
		$('#startUpload').hide();
	}else{
		$('#startUpload').show();
		h = h.replace('px','');
		h = h/1+70;
		iframeWindow.css('height',h+'px');
	}
}
function resetParentInputValue(){
	var value = '<%=name%>';
	$(window.parent.document).find("#<%=input%>").val(value);
}
$(function(){
	jQuery('#startUpload').live('mouseup',function(){
		jQuery(this).html('上传中...');
		jQuery('#img_load').show();
		jQuery(this).click();
	});
   	$.post('${contextPath}/global/findFiles.do',{
   		name:'<%=name%>',
		path:'<%=path%>'
	},function(data){
		var src = data.src;
		$('#initialImg').attr('src',src);
		if(src != '${contextPath}<%=CommConstants.NO_IMAGE_SRC%>'){
			window.location.href = '${contextPath}/plugin/upload/image_upload_edit.jsp?index=<%=index%>&w=<%=w%>&h=<%=h%>&path=<%=path%>&name=<%=name%>&input=<%=input%>&isView=<%=isView%>';
		}
		changeImage();
	});
<%
	if(uploadFailed != null){
%>
alert('<%=(String)uploadFailed%>');
<%
	}
%>
});
</script>
</body>
</html>