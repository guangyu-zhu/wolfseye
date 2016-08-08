<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/page.tld" prefix="page"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.yuyue.util.DateUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%@ page import="com.yuyue.util.LabelConstants" %>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.cu.util.WebUtils" %>
<%@ page import="com.yuyue.cu.core.web.jo.PreferenceJo" %>
<%@ taglib uri="http://ckfinder.com" prefix="ckfinder"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	PreferenceJo preference = (PreferenceJo)request.getAttribute("objectDetail");
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
				偏好设置发布  <small>添加更新发布的偏好设置</small>
				</h3>
				<ul class="page-breadcrumb breadcrumb">
					<li class="btn-group">
						<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
						<span>
							切换操作
						</span>
						<i class="fa fa-angle-down"></i>
						</button>
						<jsp:include page="../include/operation.jsp?name=preference" flush="true"/>
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
							偏好设置发布
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
							<i class="fa fa-coffee"></i>偏好设置
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
						<form action="${contextPath}/admin/preference/save.do" method="post" id="main_form" class="form-horizontal">
						<%
							if(!isView){
								if(preference == null){
						%>
						<input type="hidden" name="id" value="0">
						<%			
								}else{
						%>
						<input type="hidden" name="id" value="<%=preference.getId()%>">
						<%			
								}
							}
						%>
							<div class="form-body">
								<%
									if(isView){
								%>
								<h3 class="form-section">查看 <small>偏好设置</small></h3>
								<%	
									}else{
								%>
								<%
										if(preference == null){
								%>
								<%	
										}else{
								%>
								<h3 class="form-section">编辑 <small>更新偏好设置</small></h3>
								<%
										}
									}
								%>
								<div class="form-group" style="display:none;">
									<label class="control-label col-md-2">访问路径
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-5">
										<input class="form-control" readonly='readonly' name="uri" value='<%=preference!=null?StringUtils.toHtmlString(preference.getUri()):""%>'>
									</div>
								</div>
								<div class="form-group" style="display:none;">
									<label class="control-label col-md-2">标签代号
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-5">
										<input class="form-control" readonly='readonly' name="labelKey" value='<%=preference.getLabelKey()%>'>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">标签名
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-5">
										<input class="form-control" readonly='readonly' value='<%=LabelConstants.getLabelConstants(preference.getLabelKey()).getName() %>'>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">内容
									<span class="required">
										 
									</span>
									</label>
									<div class="col-md-9">
									<%
										if(preference.getContentType() == CommConstants.PREFERENCE_TYPE_SINGLE_IMAGE){
									%>
									<input type="hidden" name="contentType" value="<%=CommConstants.PREFERENCE_TYPE_SINGLE_IMAGE%>">
									<input type="hidden" name="width" value="<%=preference.getWidth() %>">
									<input type="hidden" name="height" value="<%=preference.getHeight() %>">
									<page:uploadImage 
											name='singleImage' 
											value='<%=preference!=null?StringUtils.toHtmlString(preference.getSingleImage()):""%>' 
											width='<%=preference.getWidth() %>' 
											height='<%=preference.getHeight() %>' 
											path='preference' 
											isView='<%=isView %>'/>
									<%		
										}else if(preference.getContentType() == CommConstants.PREFERENCE_TYPE_MULTI_IMAGE){
									%>
									<input type="hidden" name="contentType" value="<%=CommConstants.PREFERENCE_TYPE_MULTI_IMAGE%>">
									<input type="hidden" name="width" value="<%=preference.getWidth() %>">
									<input type="hidden" name="height" value="<%=preference.getHeight() %>">
									<page:multiUploadImage 
											name='multiImage' 
											value='<%=preference!=null?StringUtils.toHtmlString(preference.getMultiImage()):""%>' 
											width='<%=preference.getWidth() %>' 
											height='<%=preference.getHeight() %>' 
											path='preference' 
											isView='<%=isView %>'/>
									<%
										}else if(preference.getContentType() == CommConstants.PREFERENCE_TYPE_SINGLE_FILE){
									%>
									<input type="hidden" name="contentType" value="<%=CommConstants.PREFERENCE_TYPE_SINGLE_FILE%>">
									<page:uploadFile 
											name='singleFile' 
											value='<%=preference!=null?StringUtils.toHtmlString(preference.getSingleFile()):""%>' 
											path='preference' 
											isView='<%=isView %>'/>
									<%		
										}else if(preference.getContentType() == CommConstants.PREFERENCE_TYPE_MULTI_FILE){
									%>
									<input type="hidden" name="contentType" value="<%=CommConstants.PREFERENCE_TYPE_MULTI_FILE%>">
									<page:multiUploadFile 
											name='multiFile' 
											value='<%=preference!=null?StringUtils.toHtmlString(preference.getMultiFile()):""%>' 
											path='preference' 
											isView='<%=isView %>'/>		
									<%		
										}else if(preference.getContentType() == CommConstants.PREFERENCE_TYPE_INPUT){
									%>
									<input type="hidden" name="contentType" value="<%=CommConstants.PREFERENCE_TYPE_INPUT%>">
									<input <%=readonly%> type="text" name="input" class="form-control" value='<%=preference!=null?StringUtils.toHtmlString(preference.getInput()):""%>'/>
									<%		
										}else if(preference.getContentType() == CommConstants.PREFERENCE_TYPE_TEXTAREA){
									%>
									<input type="hidden" name="contentType" value="<%=CommConstants.PREFERENCE_TYPE_TEXTAREA%>">
									<textarea <%=readonly%> name="textarea" rows="5" class="form-control"><%=preference!=null?StringUtils.toHtmlString(preference.getTextarea()):""%></textarea>
									<%		
										}else if(preference.getContentType() == CommConstants.PREFERENCE_TYPE_CK_CONTENT){
									%>
									<input type="hidden" name="contentType" value="<%=CommConstants.PREFERENCE_TYPE_CK_CONTENT%>">
									<%
										if(isView){
									%>
									<div style="border:1px solid #eee"><%=preference!=null?StringUtils.toHtmlString(preference.getCkContent()):""%></div>
									<%	
										}else{
									%>
									<textarea class="form-control" id="ckContent" name="ckContent" rows="6"><%=WebUtils.getCkValue(preference!=null?preference.getCkContent():"") %></textarea>
									<ckfinder:setupCKEditor basePath="/es/ckfinder/" editor="ckContent" /> 
									<ckeditor:replace replace="ckContent" basePath="/es/admin/assets/plugins/ckeditor/" />
									<%		
										}
									%>
									<%		
										}
									%>
									</div>
								</div>
							</div>
							<div class="form-actions fluid">
								<div class="col-md-offset-3 col-md-8">
									<%
										if(isView){
									%>	
									<button type="button" class="btn green" onclick="window.location.href='${contextPath}/admin/preference/detail.do?id=<%=preference.getId()%>';">编辑</button>
									<button type="button" class="btn default" onclick="window.location.href='${contextPath}/admin/preference/list.do';">返回</button>
									<%
										}else{
									%>
									<button type="submit" class="btn green" id="submitFormBtn">提交</button>
									<button type="button" class="btn default" onclick="window.location.href='${contextPath}/admin/preference/list.do';">取消</button>
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
   		jQuery('#main_form').submit();
   });
});
</script>