<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	String index = request.getParameter("index");
	String dynLinkId = request.getParameter("dynLinkId");
	String path = request.getParameter("path");
	String name = request.getParameter("name");
	String input = request.getParameter("input");
	String accept = request.getParameter("accept");
	String aclazz = request.getParameter("aclazz");
	String maxsize = request.getParameter("maxsize");
	String bgcolor = request.getParameter("bgcolor");
	String _isView = request.getParameter("isView");
	boolean isView = "true".equals(_isView);
	String rmName = (String)request.getAttribute("name");
	String preview = request.getParameter("preview");
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
.uneditable-input {
	width: 200px !important;
}
</style>
</head>
<body>
<form id="fileupload" action="${contextPath}/global/uploadFile2.do" method="POST" enctype="multipart/form-data">
<input type="hidden" name="path" value="<%=path%>">
<input type="hidden" name="multi" value="single">
<input type="hidden" name="input" value="<%=input%>">
<input type="hidden" name="index" value="<%=index%>">
<input type="hidden" name="aclazz" value="<%=aclazz%>">
<input type="hidden" name="dynLinkId" value="<%=dynLinkId%>">
<%
	if(accept != null){
%>
<input type="hidden" name="accept" value="<%=accept%>">
<%		
	}
%>
<%
	if(maxsize != null){
%>
<input type="hidden" name="maxsize" value="<%=maxsize%>">
<%		
	}
%>
<%
	if(bgcolor != null){
%>
<input type="hidden" name="bgcolor" value="<%=bgcolor%>">
<%		
	}
%>
<div class="fileupload fileupload-new" data-provides="fileupload">
	<div class="input-append">
		<div class="uneditable-input">
			<i class="fa fa-file"></i>
			<span class="fileupload-preview">
				<%
					if(rmName != null){
				%>
				<a onclick='parentPopupLink("<%=aclazz%>",this);' href="javascript:;" data="${contextPath}/upload/files/<%=path%>/<%=rmName%>"><%=StringUtils.stringLess(rmName, 10)%></a>
				<%		
					}else if(name != null && !"null".equals(name) && !name.isEmpty()){
						if(aclazz != null){
				%>
				<a onclick='parentPopupLink("<%=aclazz%>",this);' href="javascript:;" data="${contextPath}/upload/files/<%=path%>/<%=name%>"><%=StringUtils.stringLess(name, 10)%></a>
				<%			
						}else{
				%>
				<a href="${contextPath}/upload/files/<%=path%>/<%=name%>"><%=StringUtils.stringLess(name, 10)%></a>
				<%			
						}
					}
				%>
			</span>
		</div>
		<%		
			if(!isView){
		%>
			<span class="btn btn-file">
				<span class="fileupload-new">选择文件</span>
				<span class="fileupload-exists">更换</span>
				<input type="file" name="formFile" class="default" onchange="setTimeout('changeFile()',300);"/>
			</span>
			<a href="javascript:;" class="btn fileupload-exists" data-dismiss="fileupload">取消</a>
            <%
            	if(rmName != null){
            %>
            <button id="startUpload" class="btn blue start btn-sm">
                <i class="fa fa-upload"></i>
                <span>开始上传</span>
            </button>
            <button class="btn red remove btn-sm" onclick="return removeImage(this,'<%=path%>','<%=rmName%>');"><i class="fa fa-trash-o"></i><span> 删除上传</span></button>
            <%		
            	}else if(name != null && !"null".equals(name) && !name.isEmpty()){
            %>
            <button style="display:none;" id="startUpload" class="btn blue start btn-sm">
                <i class="fa fa-upload"></i>
                <span>开始上传</span>
            </button>
            <button class="btn red remove btn-sm" onclick="return removeImage(this,'<%=path%>','<%=name%>');"><i class="fa fa-trash-o"></i><span> 删除上传</span></button>
            <%
            	}else{
            %>	
            <button id="startUpload" class="btn blue start btn-sm">
                <i class="fa fa-upload"></i>
                <span>开始上传</span>
            </button>	
            <%
            	}
            %>
            <img style="display:none;" id="loadingImg" alt="loading..." src="${contextPath}/admin\/assets/plugins\/bootstrap-modal/img/ajax-loader.gif">
		<%
			}
		%>
	</div>
</div>
</form>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${contextPath}/admin/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${contextPath}/admin/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.js" type="text/javascript"></script>
<!-- END PAGE LEVEL STYLES -->
<script type="text/javascript">
function parentPopupLink(clazz,obj){
	var newHref = $(obj).attr('data');
	if(clazz == 'colorbox'){
		if(newHref.indexOf('.jpg') > 0 || newHref.indexOf('.jpeg') > 0 || newHref.indexOf('.png') > 0 || newHref.indexOf('.gif') > 0 || newHref.indexOf('.bmp') > 0
				|| newHref.indexOf('.JPG') > 0 || newHref.indexOf('.JPEG') > 0 || newHref.indexOf('.PNG') > 0 || newHref.indexOf('.GIF') > 0 || newHref.indexOf('.BMP') > 0){
			$('#<%=dynLinkId%>1',window.parent.document).attr('href',newHref);
			window.parent.document.getElementById('<%=dynLinkId%>1').click();
		}else if(newHref.indexOf('.mp4') > 0 || newHref.indexOf('.MP4') > 0){
			$('#<%=dynLinkId%>',window.parent.document).attr('href',newHref);
			window.parent.document.getElementById('<%=dynLinkId%>').click();
		}else{
			$('#<%=dynLinkId%>0',window.parent.document).attr('href',newHref);
			window.parent.document.getElementById('<%=dynLinkId%>0').click();
		}
	}
}
function changeFile(){
	var h = $('.fileupload-preview').html();
	if(typeof h == 'undefined'){
		$('#startUpload').hide();
	}else{
		if(typeof $('.remove').html() == 'undefined' || $('.remove').is(':hidden')){
			$('#startUpload').show();
		}else{
			$('#startUpload').hide();
		}
		$('#fileupload').attr('action','${contextPath}/global/uploadFile2.do?preview='+h);
		if(h == ''){
			$('#startUpload').hide();
			$('.remove').show();
		}else{
			$('#startUpload').show();
			$('.remove').hide();
			if(h.indexOf('parentPopupLink') != -1){
				$('.remove').show();
			}
		}
	}
	
}
function removeImage(obj,path,name){
	$.post('${contextPath}/global/removeFile.do',{path:path,name:name},function(data){
		$(window.parent.document).find("#<%=input%>").val('');
		$('.remove').hide();
		$('.fileupload-preview').text('');
		if(data.success == true){
			//alert('文件删除成功');
		}
		return false;
	});
	return false;
}
function resetParentInputValue(){
	<%
		if(rmName != null){
	%>		
	var value = '<%=rmName%>';
	<%
		}else if(name != null && !"null".equals(name)){
	%>
	var value = '<%=name%>';
	<%
		}else{
	%>	
	var value = '';
	<%
		}
	%>
	$(window.parent.document).find("#<%=input%>").val(value);
}
$(function(){
	
	$('#startUpload').click(function(){
		$(this).hide();
		$('#loadingImg').show();
	});
	
	changeFile();
   	$('#startUpload').hide();
<%
	if(uploadFailed != null){
%>
alert('<%=(String)uploadFailed%>');
$('.fileupload-preview').text('');
<%
	}else{
%>
   	resetParentInputValue();
<%
	}
%>
});
</script>
</body>
</html>