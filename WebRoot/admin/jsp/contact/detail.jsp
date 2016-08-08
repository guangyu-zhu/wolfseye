<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/page.tld" prefix="page"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.yuyue.util.DateUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%@ page import="com.yuyue.util.LabelConstants" %>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.cu.util.WebUtils" %>
<%@ page import="com.yuyue.web.jo.ContactJo" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	ContactJo contact = (ContactJo)request.getAttribute("objectDetail");
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
				网站留言发布  <small>添加更新发布的网站留言</small>
				</h3>
				<ul class="page-breadcrumb breadcrumb">
					<li class="btn-group">
						<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
						<span>
							切换操作
						</span>
						<i class="fa fa-angle-down"></i>
						</button>
						<jsp:include page="../include/operation.jsp?name=contact" flush="true"/>
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
							网站留言发布
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
							<i class="fa fa-ticket"></i>网站留言
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
						<form action="${contextPath}/admin/contact/save.do" method="post" id="main_form" class="form-horizontal">
						<%
							if(!isView){
								if(contact == null){
						%>
						<input type="hidden" name="id" value="0">
						<%			
								}else{
						%>
						<input type="hidden" name="id" value="<%=contact.getId()%>">
						<%			
								}
							}
						%>
							<div class="form-body">
								<%
									if(isView){
								%>
								<h3 class="form-section">查看 <small>网站留言网站留言</small></h3>
								<%	
									}else{
								%>
								<%
										if(contact == null){
								%>
								<%	
										}else{
								%>
								<h3 class="form-section">编辑 <small>更新网站留言网站留言</small></h3>
								<%
										}
									}
								%>
								<div class="form-group">
									<label class="control-label col-md-2">姓名
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-5">
										<input class="form-control" readonly='readonly' value='<%=contact!=null?StringUtils.toHtmlString(contact.getName()):""%>'>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">邮箱
									<span class="required">
										 
									</span>
									</label>
									<div class="col-md-5">
										<a class="form-control" href="mailto:<%=contact!=null?StringUtils.toHtmlString(contact.getEmail()):""%>"><%=contact!=null?StringUtils.toHtmlString(contact.getEmail()):""%></a>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">留言时间
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-3">
										<input class="form-control" readonly='readonly' value="<%=contact!=null?CommConstants.SDF_5.format(contact.getCreateDate()):""%>">
									</div>
								</div>
								<div class="form-group last">
									<label class="control-label col-md-2">内容
									<span class="required">
										 
									</span>
									</label>
									<div class="col-md-8">
										<textarea class="form-control" rows="10" readonly='readonly'><%=contact!=null?StringUtils.toHtmlString(contact.getContent()):""%></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">阅读状态
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-8">
										<div class="controls">
											<div class="basic-toggle-button">
												<input <%=disabled %> type="checkbox" class="display_toggle toggle" name="isOpen" <%=contact!=null&&contact.getIsOpen()==true?"checked='checked'":"" %> value="1" />
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">回复状态
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-8">
										<div class="controls">
											<div class="basic-toggle-button">
												<input <%=disabled %> type="checkbox" class="display_toggle toggle" name="isReply" <%=contact!=null&&contact.getIsReply()==true?"checked='checked'":"" %> value="1" />
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">优先级
									<span class="required">
										 
									</span>
									</label>
									<div class="col-md-1">
										<input <%=readonly%> type="text" id="sortId" name="sortId" data-trigger="hover" data-original-title="优先级别只能为数字" data-required="1" class="form-control tooltips" value='<%=contact!=null?contact.getSortId():"0"%>'/>
									</div>
								</div>
							</div>
							<div class="form-actions fluid">
								<div class="col-md-offset-3 col-md-8">
									<%
										if(isView){
									%>	
									<button type="button" class="btn green" onclick="window.location.href='${contextPath}/admin/contact/detail.do?id=<%=contact.getId()%>';">编辑</button>
									<button type="button" class="btn default" onclick="window.location.href='${contextPath}/admin/contact/list.do';">返回</button>
									<%
										}else{
									%>
									<button type="submit" class="btn green" id="submitFormBtn">提交</button>
									<button type="button" class="btn default" onclick="window.location.href='${contextPath}/admin/contact/list.do';">取消</button>
									<%
										}
									%>
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
   jQuery('#submitFormBtn').click(function(){
   		if(jQuery('#title').val() == ''){
			bootbox.alert("网站留言名不能为空!");
			return false;
		}
   		var sortId = jQuery('#sortId').val();
		if(!isNumeric(sortId)){
			bootbox.alert("优先级只能为数字!");
			return false;
		}
		$('.display_toggle').each(function(){
			var isChecked = $(this).attr("checked");
	   		if(isChecked){
	   			jQuery(this).val(1);
	   		}else{
	   			jQuery(this).val(0);
	   		}
	   		jQuery(this).attr("checked","checked");
		});
   		jQuery('#main_form').submit();
   });
   jQuery('.basic-toggle-button').toggleButtons();
});
</script>