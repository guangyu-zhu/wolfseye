<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/page.tld" prefix="page"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.yuyue.util.DateUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%@ page import="com.yuyue.util.LabelConstants" %>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.cu.util.WebUtils" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	Object[] objectArray = WebUtils.getInitialDetailPageObjects(request);
	String readonly = (String)objectArray[0];
	String disabled = (String)objectArray[1];
	boolean isView = (Boolean)objectArray[2];
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
	<div class="page-content">
		<!-- BEGIN PAGE HEADER-->
		<div class="row">
			<div class="col-md-12">
				<!-- BEGIN PAGE TITLE & BREADCRUMB-->
				<h3 class="page-title">
				超级管理员 <small>帐号管理</small>
				</h3>
				<ul class="page-breadcrumb breadcrumb">
					<li class="btn-group">
						<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
						<span>
							切换操作
						</span>
						<i class="fa fa-angle-down"></i>
						</button>
						<ul class="dropdown-menu pull-right">
							<li>
								<a href="javascript:;" onclick="window.location.reload();">
									<i class="fa fa-refresh"></i>&nbsp;&nbsp;&nbsp;页面刷新
								</a>
							</li>
						</ul>
					</li>
					<li>
						<i class="fa fa-home"></i>
						<a href="#">
							后台管理
						</a>
						<i class="fa fa-angle-right"></i>
					</li>
					<li>
						<a href="#">
							超级管理员
						</a>
					</li>
				</ul>
				<!-- END PAGE TITLE & BREADCRUMB-->
			</div>
		</div>
		<!-- END PAGE HEADER-->
		<!-- BEGIN PAGE CONTENT-->
		<div class="row">
			<div class="col-md-12">
				<!-- BEGIN VALIDATION STATES-->
				<div class="portlet box green">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-user"></i>帐户管理
						</div>
						<div class="tools">
							<a href="javascript:;" class="collapse">
							</a>
							<a href="javascript:;" class="reload">
							</a>
							<a href="javascript:;" class="remove">
							</a>
						</div>
					</div>
					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<form id="main_form" class="form-horizontal">
							<div class="form-body">
								<h3 class="form-section">密码管理 <small>更改超级管理员密码</small></h3>
								<div class="form-group">
									<label class="control-label col-md-2">原始密码
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-5">
										<input <%=readonly%> type="password" id="oldpwd" data-required="1" class="form-control" value=''/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">新密码
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-5">
										<input <%=readonly%> type="password" id="newpwd" data-required="1" class="form-control" value=''/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">确认新密码
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-5">
										<input <%=readonly%> type="password" id="cfmpwd"  data-required="1" class="form-control" value=''/>
									</div>
								</div>
							</div>
							<div class="form-actions fluid">
								<div class="col-md-offset-3 col-md-8">
									<button type="button" class="btn green" id="s-btn">提交</button>
									<button type="button" class="btn default" id="s-reset">重置</button>
								</div>
							</div>
							</form>
						<!-- END FORM-->
					</div>
					<!-- END VALIDATION STATES-->
				</div>
			</div>
		</div>
		<!-- END PAGE CONTENT-->
	</div>
</div>
<!-- END CONTENT -->
<script type="text/javascript">
jQuery(document).ready(function() {   
   // initiate layout and plugins
   FormValidation.init();
   
   jQuery('#s-btn').click(function(){
	   var oldpwd = jQuery('#oldpwd').val();
	   var newpwd = jQuery('#newpwd').val();
	   var cfmpwd = jQuery('#cfmpwd').val();
	   if(newpwd == ''){
		   bootbox.alert('密码不能为空');
		   return false;
	   }
	   if(newpwd != cfmpwd){
		   bootbox.alert("2次输入密码不一致");
		   return false;
	   }
	   jQuery.post('${contextPath}/admin/master/saveConfig.do',{type:'pwd',oldPwd:oldpwd,newPwd:newpwd},function(data){
		   if(data.success == true){
			   jQuery('#oldpwd').val('');
			   jQuery('#newpwd').val('');
			   jQuery('#cfmpwd').val('');
			   bootbox.alert('密码更新成功');
		   }else{
			   bootbox.alert('密码不正确');
		   }
		   return false;
	   });
   });
   
   jQuery('#s-reset').click(function(){
	   jQuery('#oldpwd').val('');
	   jQuery('#newpwd').val('');
	   jQuery('#cfmpwd').val('');
	   return false;
   });
   
});
</script>