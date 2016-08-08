<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	String index = request.getParameter("index");
	Object disableObj = request.getAttribute("disableEdit");
	String disableStr = "";
	if(disableObj != null && (Boolean)disableObj == true){
		disableStr = "disabled='disabled'";
	}
	String path = request.getParameter("path");
	String names = request.getParameter("names");
	String input = request.getParameter("input");
	String _isView = request.getParameter("isView");
	boolean isView = "true".equals(_isView);
%>
<html>
<head>
<script type="text/javascript">
	var contextPath = '${contextPath}';
</script>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="${contextPath}/admin/assets/plugins/font-awesome/css/font-awesome1.4.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<link href="${contextPath}/admin/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="${contextPath}/admin/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<!-- BEGIN UPLOAD FILE STYLES -->
<link href="${contextPath}/admin/assets/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet"/>
<link href="${contextPath}/admin/assets/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
<link href="${contextPath}/admin/assets/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
<!-- END UPLOAD FILE STYLES -->
<style type="text/css">
.btn {
	font-family: 'Microsoft Yahei';
}
.btn-group {
	width:266px !important;
}
</style>
</head>
<body style="overflow:hidden;" onchange="FormFileUpload.resetIframe();">
<form id="fileupload" action="${contextPath}/global/uploadFile.do" method="POST" enctype="multipart/form-data">
<input type="hidden" name="path" value="<%=path%>">
<input type="hidden" name="multi" value="multi">
<input type="hidden" name="index" value="<%=index%>">
<input type="hidden" name="fileType" value="files">
<%
	if(!isView){
%>
<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
<div class="row fileupload-buttonbar">
	<div class="col-lg-7">
		<!-- The fileinput-button span is used to style the file input field as button -->
		<span class="btn green fileinput-button">
			<i class="fa fa-plus"></i>
			<span>
				 添加文件...
			</span>
			<input type="file" name="formFile">
		</span>
		<button type="submit" class="btn blue start">
		<i class="fa fa-upload"></i>
		<span>
			 全部上传
		</span>
		</button>
		<button type="reset" class="btn warning cancel">
		<i class="fa fa-ban-circle"></i>
		<span>
			 全部取消
		</span>
		</button>
		<button type="button" class="btn red delete" onclick="return removeAllImage();">
		<i class="fa fa-trash"></i>
		<span>
			 全部删除
		</span>
		</button>
		<!-- The global file processing state -->
		<span class="fileupload-process">
		</span>
	</div>
</div>
<%
	}
%>
<!-- The table listing the files available for upload/download -->
	<table role="presentation" class="table table-striped clearfix">
	<tbody class="files">
	</tbody>
	</table>
</form>
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
<!-- BEGIN:File Upload Plugin JS files-->
<!-- The blueimp Gallery widget -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
	<div class="slides">
	</div>
	<h3 class="title"></h3>
	<a class="prev">
		 ‹
	</a>
	<a class="next">
		 ›
	</a>
	<a class="close white">
	</a>
	<a class="play-pause">
	</a>
	<ol class="indicator">
	</ol>
</div>
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<script id="template-upload" type="text/x-tmpl">
        {% for (var i=0, file; file=o.files[i]; i++) { %}
            <tr class="template-upload fade" data="">
                <td>
                    <span class="preview"></span>
                </td>
                <td>
                    <p class="name">{%=file.name.substring(file.name.lastIndexOf(".")+1)%}</p>
                    {% if (file.error) { %}
                        <div><span class="label label-danger">Error</span> {%=file.error%}</div>
                    {% } %}
                </td>
                <td>
                    <p class="size">{%=o.formatFileSize(file.size)%}</p>
                    {% if (!o.files.error) { %}
                        <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                        <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                        </div>
                    {% } %}
                </td>
                <td class="btn-group">
                    {% if (!o.files.error && !i && !o.options.autoUpload) { %}
                        <button class="btn blue start btn-sm">
                            <i class="fa fa-upload"></i>
                            <span>开始上传</span>
                        </button>
                    {% } %}
                    {% if (!i) { %}
                        <button class="btn warning cancel btn-sm" onclick="FormFileUpload.cancelHeight();">
                            <i class="fa fa-ban"></i>
                            <span>取消上传</span>
                        </button>
                    {% } %}
                </td>
            </tr>
        {% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
        {% for (var i=0, file; file=o.files[i]; i++) { %}
            <tr class="template-download fade">
                <td>
                    <span class="preview">
                        {% if (file.thumbnailUrl) { %}
                            <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                        {% } %}
                    </span>
                </td>
                <td>
                    <p class="name">
                        {% if (file.url) { %}
                            <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                        {% } else { %}
                            <span>{%=file.name%}</span>
                        {% } %}
                    </p>
                    {% if (file.error) { %}
                        <div><span class="label label-danger">Error</span> {%=file.error%}</div>
                    {% } %}
                </td>
                <td>
                    <span class="size">{%=o.formatFileSize(file.size)%}</span>
                </td>
                <td>
                    {% if (file.deleteUrl) { %}
                        <button onclick="FormFileUpload.cancelHeight();" class="btn red delete btn-sm" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                            <i class="fa fa-trash-o"></i>
                            <span>Delete</span>
                        </button>
                        <input type="checkbox" name="delete" value="1" class="toggle">
                    {% } else { %}
                        <button class="btn yellow cancel btn-sm" onclick="FormFileUpload.cancelHeight();">
                            <i class="fa fa-ban"></i>
                            <span>取消上传</span>
                        </button>
                    {% } %}
                </td>
            </tr>
       	{% } %}
</script>
<script src="${contextPath}/admin/assets/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/vendor/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/vendor/load-image.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/vendor/canvas-to-blob.min.js"></script>
<!-- blueimp Gallery script -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
    <script src="${contextPath}/admin/assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
    <![endif]-->
<!-- END:File Upload Plugin JS files-->
<script type="text/javascript">
var index = '<%=index%>';

function removeImage(obj,path,name){
	$.post('${contextPath}/global/removeFile.do',{path:path,name:name},function(data){
		if(data.success == true){
			$(obj).parent().parent().remove();
			FormFileUpload.cancelHeight();
			resetParentInputValue();
		}
	});
	return false;
}

function removeAllImage(){
	$('.files .remove').each(function(){
		$(this).click();
	});
	return false;
}

function resetParentInputValue(){
	var value = '';
	$('.template-upload').each(function(){
		value += ($(this).attr('data')+',');
	});
	$(window.parent.document).find("#<%=input%>").val(value);
}
</script>
<script src="${contextPath}/admin/assets/scripts/core/app.js"></script>
<script src="${contextPath}/admin/assets/scripts/custom/form-fileupload2.js"></script>
<script type="text/javascript">
jQuery(document).ready(function() {
   // initiate layout and plugins
   App.init();
   FormFileUpload.init();
   FormFileUpload.resetIframe();
   
   $.post('${contextPath}/global/findFiles.do',{
	   		names:'<%=names%>',
			path:'<%=path%>'
		},function(data){
			var files = data.result;
			for (var i in files) { 
				var file = files[i];
				var imgId = 'img'+Math.ceil(100000*Math.random());
				var block = $('<tr class="template-upload fade in" data="'+file.name+'"><td><span class="preview"><a href="${contextPath}/upload/files/<%=path%>/'+file.name+'" target="_blank">'+file.name+'</a></span></td><td><p class="name">'+file.type+'</p></td><td><p class="size">'+file.size+'</p></td><td class="btn-group" <%=isView?"style=\"display:none;\"":""%>><button class="btn red remove btn-sm" onclick="return removeImage(this,\''+file.path+'\',\''+file.name+'\');"><i class="fa fa-trash-o"></i><span> 删除文件</span></button></td></tr>');
				$('.files').append(block);
			}
			FormFileUpload.resetIframe();
	});
});
</script>
</body>
</html>

