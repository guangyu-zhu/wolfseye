<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/page.tld" prefix="page"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.yuyue.util.DateUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%@ page import="com.yuyue.util.LabelConstants" %>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.cu.util.WebUtils" %>
<%@ page import="com.yuyue.web.jo.PrdJo" %>
<%@ taglib uri="http://ckfinder.com" prefix="ckfinder"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	PrdJo prd = (PrdJo)request.getAttribute("objectDetail");
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
				产品发布  <small>添加更新产品</small>
				</h3>
				<ul class="page-breadcrumb breadcrumb">
					<li class="btn-group">
						<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
						<span>
							切换操作
						</span>
						<i class="fa fa-angle-down"></i>
						</button>
						<jsp:include page="../include/operation.jsp?name=prd" flush="true"/>
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
							产品发布
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
							<i class="fa fa-code-fork"></i>产品
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
						<form action="${contextPath}/admin/prd/save.do" method="post" id="main_form" class="form-horizontal">
						<%
							if(!isView){
								if(prd == null){
						%>
						<input type="hidden" name="id" value="0">
						<%			
								}else{
						%>
						<input type="hidden" name="id" value="<%=prd.getId()%>">
						<%			
								}
							}
						%>
							<div class="form-body">
								<%
									if(isView){
								%>
								<h3 class="form-section">查看 <small>产品</small></h3>
								<%	
									}else{
								%>
								<%
										if(prd == null){
								%>
								<h3 class="form-section">创建 <small>添加产品</small></h3>
								<%	
										}else{
								%>
								<h3 class="form-section">编辑 <small>更新产品</small></h3>
								<%
										}
									}
								%>

								<!-- 日内回顾图片 -->
								<div class="form-group">
									<label class="control-label col-md-2">日内回顾图片 805×288
										<span class="required">
											*
										</span>
									</label>
									<div class="col-md-8">
										<page:uploadImage 
											name='todayImage' 
											value='<%=prd!=null?StringUtils.toHtmlString(prd.getTodayImage()):""%>' 
											width='805' 
											height='288' 
											path='prd' 
											clazz=' requiredColumn ' 
											other='alert-title="日内回顾图片"' 
											isView='<%=isView %>'/>
									</div>
								</div>

								<!-- 日内回顾更多图片 -->
								<div class="form-group">
									<label class="control-label col-md-2">日内回顾更多图片 805×288
										<span class="required">
											*
										</span>
									</label>
									<div class="col-md-8">
										<page:multiUploadImage 
											name='moreTodayImages' 
											value='<%=prd!=null?StringUtils.toHtmlString(prd.getMoreTodayImages()):""%>' 
											width='805' 
											height='288' 
											path='prd' 
											isView='<%=isView %>'/>
									</div>
								</div>

								<!-- 日后前瞻图片 -->
								<div class="form-group">
									<label class="control-label col-md-2">日后前瞻图片 805×288
										<span class="required">
											*
										</span>
									</label>
									<div class="col-md-8">
										<page:uploadImage 
											name='predictImage' 
											value='<%=prd!=null?StringUtils.toHtmlString(prd.getPredictImage()):""%>' 
											width='805' 
											height='288' 
											path='prd' 
											clazz=' requiredColumn ' 
											other='alert-title="日后前瞻图片"' 
											isView='<%=isView %>'/>
									</div>
								</div>

								<!-- 日后前瞻更多图片 -->
								<div class="form-group">
									<label class="control-label col-md-2">日后前瞻更多图片 805×288
										<span class="required">
											*
										</span>
									</label>
									<div class="col-md-8">
										<page:multiUploadImage 
											name='morePredictImages' 
											value='<%=prd!=null?StringUtils.toHtmlString(prd.getMorePredictImages()):""%>' 
											width='805' 
											height='288' 
											path='prd' 
											isView='<%=isView %>'/>
									</div>
								</div>

								<!-- 交通灯预警 -->
								<div class="form-group">
									<label class="control-label col-md-2">交通灯预警
										<span class="required">
											*
										</span>
									</label>
									<div class="col-md-3">
										<select <%=disabled%> name="alertLevel" alert-title="交通灯预警" class="chosen form-control requiredColumn ">
											<option value="">请选择交通灯预警</option>
											<%=WebUtils.generateEnumOption(response, LabelConstants.ALERT_LEVEL_1, prd!=null?prd.getAlertLevel():0)%>
											<%=WebUtils.generateEnumOption(response, LabelConstants.ALERT_LEVEL_2, prd!=null?prd.getAlertLevel():0)%>
											<%=WebUtils.generateEnumOption(response, LabelConstants.ALERT_LEVEL_3, prd!=null?prd.getAlertLevel():0)%>
										</select>
									</div>
								</div>

								<!-- 持仓比例 -->
								<div class="form-group">
									<label class="control-label col-md-2">持仓比例
										<span class="required">
											*
										</span>
									</label>
									<div class="col-md-1">
										<input <%=readonly%>   type="text" name="holdPercentage" data-trigger="hover" data-original-title="持仓比例只能为数字" data-required="1" alert-title="持仓比例" class="form-control numericColumn tooltips requiredColumn " value='<%=prd!=null?prd.getHoldPercentage():"0"%>'/>
									</div>
								</div>

								<!-- 操作提示 -->
								<div class="form-group">
									<label class="control-label col-md-2">操作提示
										<span class="required">
											*
										</span>
									</label>
									<div class="col-md-5">
										<textarea <%=readonly%>   class="form-control requiredColumn " alert-title="操作提示" rows="5" name="notification"><%=prd!=null?StringUtils.toTextAreaString(prd.getNotification()):""%></textarea>
									</div>
								</div>

								<!-- 公示日期 -->
								<div class="form-group">
									<label class="control-label col-md-2">公示日期
										<span class="required">
											*
										</span>
									</label>
									<div class="col-md-3">
										<div class="input-append date form_date input-group">
											<input <%=readonly%> name="showDate" size="16" type="text" value="<%=prd!=null&&prd.getShowDate()!=null?CommConstants.SDF_1.format(prd.getShowDate()):""%>" readonly alert-title="公示日期" class="m-wrap form-control requiredColumn ">
											<span class="add-on input-group-addon"><i class="icon-calendar fa fa-calendar"></i></span>
										</div>
									</div>
								</div>

								<!-- 是否显示 -->
								<div class="form-group">
									<label class="control-label col-md-2">是否显示
										<span class="required">
											*
										</span>
									</label>
									<div class="col-md-5">
										<div class="controls">
											<div class="basic-toggle-button">
												<input <%=disabled %> type="checkbox" name="display" class="toggle" <%=prd!=null&&prd.getDisplay()==true?"checked='checked'":"" %> value="1" />
											</div>
										</div>
									</div>
								</div>

								<!-- 排列序号 -->
								<div class="form-group">
									<label class="control-label col-md-2">排列序号
										<span class="required">
											*
										</span>
									</label>
									<div class="col-md-1">
										<input <%=readonly%>   type="text" name="sortId" data-trigger="hover" data-original-title="排列序号只能为数字" data-required="1" alert-title="排列序号" class="form-control numericColumn tooltips requiredColumn " value='<%=prd!=null?prd.getSortId():"0"%>'/>
									</div>
								</div>


							</div>
							<div class="form-actions fluid">
								<div class="col-md-offset-3 col-md-8">
									<%
										if(isView){
									%>	
									<button type="button" class="btn green" onclick="window.location.href='${contextPath}/admin/prd/detail.do?id=<%=prd.getId()%>';">编辑</button>
									<button type="button" class="btn default" onclick="window.location.href='${contextPath}/admin/prd/list.do';">返回</button>
									<%
										}else{
									%>
									<button type="button" class="btn green" id="submitFormBtn">提交</button>
									<button type="button" class="btn default" onclick="window.location.href='${contextPath}/admin/prd/list.do';">取消</button>
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
<!-- afterAjaxSelectFun() : this function is for after ajax select -->
<script type="text/javascript">
jQuery(document).ready(function() {   
   // initiate layout and plugins
   FormValidation.init();
   
   jQuery('.altitudeMap').each(function(){
	   jQuery(this).find('.viewMap').click(function(){
		   var url = jQuery(this).attr('data');
			url = url + '&c=title&l=nan&x=' + jQuery(this).parent().find('.mapX').val() + '&y=' + jQuery(this).parent().find('.mapY').val();
			jQuery(this).attr('href',url);
	   });
   });
   
   jQuery('#submitFormBtn').click(function(){
	   var success = true;
	   jQuery('.requiredColumn').each(function(){
		   if(jQuery(this).val() == ''){
				success = false;
				bootbox.alert(jQuery(this).attr('alert-title')+"不能为空!");
				return false;
			}
	    });
	   jQuery('.numericColumn').each(function(){
	    	var value = jQuery(this).val();
			if(!isNumeric(value)){
				success = false;
				bootbox.alert(jQuery(this).attr('alert-title')+"只能为数字!");
				return false;
			}
	    });
	   jQuery('.floatColumn').each(function(){
	    	var value = jQuery(this).val();
			if(!isFloat(value)){
				success = false;
				bootbox.alert(jQuery(this).attr('alert-title')+"只能为浮点数字!");
				return false;
			}
	    });
	   jQuery('[maxLength]').each(function(){
		   var value = jQuery(this).val();
		   var maxLength = jQuery(this).attr('maxLength');
		   if(value.length > maxLength){
			    success = false;
				bootbox.alert(jQuery(this).attr('alert-title')+"长度不能大于"+maxLength);
				return false;
		   }
	   });
	   jQuery('[minLength]').each(function(){
		   var value = jQuery(this).val();
		   var minLength = jQuery(this).attr('minLength');
		   if(value.length < minLength){
			    success = false;
				bootbox.alert(jQuery(this).attr('alert-title')+"长度不能小于"+minLength);
				return false;
		   }
	   });
	   jQuery('[maxSize]').each(function(){
		   var value = jQuery(this).val();
		   var maxSize = jQuery(this).attr('maxSize');
		   if(value > maxSize){
			    success = false;
				bootbox.alert(jQuery(this).attr('alert-title')+"不能大于"+maxSize);
				return false;
		   }
	   });
	   jQuery('[minSize]').each(function(){
		   var value = jQuery(this).val();
		   var minSize = jQuery(this).attr('minSize');
		   if(value < minSize){
			    success = false;
				bootbox.alert(jQuery(this).attr('alert-title')+"不能小于"+minSize);
				return false;
		   }
	   });
	   jQuery('.toggle').each(function(){
			var isChecked = jQuery(this).attr("checked");
	   		if(isChecked){
	   			jQuery(this).val(1);
	   		}else{
	   			jQuery(this).val(0);
	   		}
	   		jQuery(this).attr("checked","checked");
		});
	   if(success == true){
		   jQuery('#submitFormBtn').attr('disabled', 'disabled');
		   jQuery('#main_form').submit();
	   }
   });
   jQuery('.basic-toggle-button').toggleButtons();
   <%
   		if(!isView){
   %>
   jQuery(".form_datetime").datetimepicker({
	    isRTL: App.isRTL(),
	    format: "yyyy-mm-dd hh:ii",
	    pickerPosition: (App.isRTL() ? "bottom-right" : "bottom-left")
	});
   jQuery(".form_date input").datepicker({
	   	dateFormat: 'yy-mm-dd',
 		autoclose: true
	});
   <%
   		}
   %>
});
</script>
