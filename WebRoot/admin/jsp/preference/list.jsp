<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/page.tld" prefix="page"%>
<%@ page import="java.util.List" %>
<%@ page import="com.yuyue.util.DateUtils" %>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.cu.core.web.jo.PreferenceJo" %>
<%@ page import="com.yuyue.util.LabelConstants" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	List<PreferenceJo> list = (List<PreferenceJo>)request.getAttribute("objectList");
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
	<div class="page-content">
		<!-- BEGIN PAGE HEADER-->
		<div class="row">
			<div class="col-md-12">
				<!-- BEGIN PAGE TITLE & BREADCRUMB-->
				<h3 class="page-title">
				偏好设置发布 <small>添加更新发布的偏好设置</small>
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
			<!-- BEGIN SAMPLE TABLE PORTLET-->
				<div class="portlet box purple">
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
					<div class="portlet-body">
						<div class="table-scrollable">
							<table class="table table-striped table-bordered table-hover">
							<thead>
							<tr>
								<th scope="col" style="width:88px !important">
								</th>
								<th scope="col">
									 标签名
								</th>
								<th scope="col" style="width:107px !important">
									 更新日期
								</th>
							</tr>
							</thead>
							<tbody>
							<%
								if(list != null){
									for(PreferenceJo preference : list){
										if(preference != null){
							%>
								<tr>
									<td>
										<a href="${contextPath}/admin/preference/detail.do?id=<%=preference.getId()%>" class="btn btn-sm purple">
											<i class="fa fa-pencil-square-o"></i>
										</a>
										<a href="${contextPath}/admin/preference/detail.do?id=<%=preference.getId()%>&t=v" class="btn btn-sm yellow">
											<i class="fa fa-eye"></i>
										</a>
									</td>
									<td>
										 <%=LabelConstants.getLabelConstants(preference.getLabelKey()).getName() %>
									</td>
									<td>
										 <%=DateUtils.formatDate(preference.getUpdateDate(),"yyyy-MM-dd") %>
									</td>
								</tr>
							<%			
										}
									}
								}
							%>
							</tbody>
							</table>
						</div>
						<page:pagination url="${contextPath}/admin/preference/list.do" key=""/>
					</div>
				</div>
				<!-- END SAMPLE TABLE PORTLET-->
			</div>
		</div>
		<!-- END PAGE CONTENT-->
	</div>
</div>
<!-- END CONTENT -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    jQuery(document).ready(function() {       
       UIAlertDialogApi.init();
	   var readyToDel;
	   jQuery('.delAct').each(function(){
	   		jQuery(this).click(function(){
				readyToDel = jQuery(this).attr('data');
				bootbox.confirm('确定要删除 '+jQuery(this).attr('product')+' 吗？', function(result) {
                   if(result){
				   		window.location.href = readyToDel;
				   }
         		}); 
			});
	   });
	   jQuery('#product_search').click(function(){
	   		var txt = jQuery('#product_search_text').val();
			window.location.href = '${contextPath}/admin/preference/list.do?s='+txt;
	   });
	   jQuery('#product_add').click(function(){
	   		window.location.href = '${contextPath}/admin/preference/detail.do';
	   });
	});
</script>
<!-- END PAGE LEVEL SCRIPTS -->