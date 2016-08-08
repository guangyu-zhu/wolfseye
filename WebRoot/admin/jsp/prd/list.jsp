<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/page.tld" prefix="page"%>
<%@ page import="java.util.List" %>
<%@ page import="com.yuyue.util.DateUtils" %>
<%@ page import="com.yuyue.util.LabelConstants" %>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.web.jo.PrdJo" %>
<%@ page import="com.yuyue.cu.util.WebUtils" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	List<PrdJo> list = (List<PrdJo>)request.getAttribute("objectList");
%>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
	<div class="page-content">
		<!-- BEGIN PAGE HEADER-->
		<div class="row">
			<div class="col-md-12">
				<!-- BEGIN PAGE TITLE & BREADCRUMB-->
				<h3 class="page-title">
				产品发布 <small>添加更新产品</small>
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
			<!-- BEGIN SAMPLE TABLE PORTLET-->
				<div class="portlet box purple">
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
					<div class="portlet-body">
						<div class="row">
							<div class="col-md-8 col-sm-12">
								<button id="product_add" class="btn green">
									添加产品 <i class="fa fa-plus"></i>
								</button>
							</div>
							<div class="col-md-4 col-sm-12">
								<div class="dataTables_filter" id="sample_editable_1_filter">
									<label style="float:right;">
										<input id="product_search_text" value='<%=StringUtils.toHtmlString(request.getParameter("s"))%>' type="text" aria-controls="sample_editable_1" class="form-control input-medium input-inline">
										<button id="product_search" class="btn yellow">
										搜索 <i class="fa fa-search"></i>
										</button>
									</label>
								</div>
							</div>

						</div>
						<div class="table-scrollable">
							<table class="table table-striped table-bordered table-hover">
							<thead>
							<tr>
								<th scope="col" style="width:88px !important">
								</th>
								<th scope="col">
									交通灯预警
								</th>
								<th scope="col">
									持仓比例
								</th>
								<th scope="col">
									操作提示
								</th>
								<th scope="col">
									公示日期
								</th>
								<th scope="col">
									是否显示
								</th>

								<th scope="col" style="width:107px !important">
									 更新日期
								</th>
								<th scope="col" style="width:47px !important">
								</th>
							</tr>
							</thead>
							<tbody>
							<%
								if(list != null){
									for(PrdJo prd : list){
										if(prd != null){
							%>
								<tr>
									<td>
										<a href="${contextPath}/admin/prd/detail.do?id=<%=prd.getId()%>" class="btn btn-sm purple">
											<i class="fa fa-pencil-square-o"></i>
										</a>
										<a href="${contextPath}/admin/prd/detail.do?id=<%=prd.getId()%>&t=v" class="btn btn-sm yellow">
											<i class="fa fa-eye"></i>
										</a>
									</td>
									<td>
										<%=LabelConstants.getLabelConstants(prd.getAlertLevel()).getName() %>
									</td>
									<td>
										<%=prd.getHoldPercentage() %>
									</td>
									<td>
										<%=StringUtils.stringLess(prd.getNotification(),20) %>
									</td>
									<td>
										<%=DateUtils.formatDate(prd.getShowDate(),"yyyy-MM-dd") %>
									</td>
									<td>
										<%=prd.getDisplay()==true?"是":"否" %>
									</td>

									<td>
										 <%=DateUtils.formatDate(prd.getUpdateDate(),"yyyy-MM-dd") %>
									</td>
									<td>
										<a product="<%=prd.getHoldPercentage()%>" data="${contextPath}/admin/prd/remove.do?id=<%=prd.getId()%>" class="btn btn-sm red delAct">
											<i class="fa fa-trash-o"></i>
										</a>
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
						<page:pagination url="${contextPath}/admin/prd/list.do" key=""/>
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
<!-- afterAjaxSelectFun() : this function is for after ajax select -->
<script type="text/javascript">
	function afterAjaxSelectFun(){
		jQuery('.chosen').each(function(){
			jQuery(this).change(function(){
				var href = window.location.href;
			   	switchTypeLocation(this,href.substring(0,href.lastIndexOf('.do')+3));
		    });
		});
	}
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
			window.location.href = '${contextPath}/admin/prd/list.do?s='+txt;
	   });
	   jQuery('#product_add').click(function(){
	   		window.location.href = '${contextPath}/admin/prd/detail.do';
	   });
	});
</script>
<!-- END PAGE LEVEL SCRIPTS -->
