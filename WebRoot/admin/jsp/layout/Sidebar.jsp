<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.cu.core.web.proxy.AbstractFacadeProxy" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%@ page import="com.yuyue.cu.util.Constants" %>
<%@ page import="com.yuyue.util.AdminPageTab" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	Object tabObj = request.getAttribute(CommConstants.WEB_ADMIN_TABS_ATTR);
	float tabVal = -1;
	if(tabObj != null){
		tabVal = (Float)tabObj;
	}
%>
<!-- 定义页面左边主菜单列表，包括菜单搜索 -->
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		<div class="page-sidebar navbar-collapse collapse">
			<!-- add "navbar-no-scroll" class to disable the scrolling of the sidebar menu -->
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="page-sidebar-menu">
				<li class="sidebar-toggler-wrapper">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler hidden-phone">
					</div>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li class="sidebar-search-wrapper">
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					<form class="sidebar-search" action="extra_search.html" method="POST">
						<div class="form-container">
							<div class="input-box">
								<a href="javascript:;" class="remove">
								</a>
								<input disabled="disabled" type="text" placeholder="网站后台操作列表"/>
							</div>
						</div>
					</form>
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<!-- 
				<li class=''>
					<a href="javascript:;">
						<i class="f-icon"></i>
						<span class="title">
							父菜单
						</span>
						<span class="arrow ">
						</span>
					</a>
					<ul class="sub-menu">
						<li class=''>
							<a href="">
								<i class="fa fa-table"></i>
								子菜单
							</a>
						</li>
					</ul>
				</li>
				 -->
				<li class='start <%=(int)tabVal==-1?"active":"" %>'>
					<a href="${contextPath}/admin/master.do">
						<i class="fa fa-user"></i>
						<span class="title">
							管理员密码
						</span>
						<span class="selected">
						</span>
					</a>
				</li>
				<!-- 产品 -->
				<li class='<%=(int)tabVal==AdminPageTab.PRD.getValue()?"active":"" %>'>
					<a href="${contextPath}/admin/prd/list.do">
						<i class="fa fa-code-fork"></i>
						<span class="title">
							产品
						</span>
						<span class="selected">
						</span>
					</a>
				</li>

				
				<!-- 
				<li class='<%=(int)tabVal==com.yuyue.cu.util.Constants.AdminPageTab.PREFERENCE.getValue()?"active":"" %>'>
					<a href="${contextPath}/admin/preference/list.do">
						<i class="fa fa-coffee"></i>
						<span class="title">
							偏好设置
						</span>
						<span class="selected">
						</span>
					</a>
				</li> -->
				
				<!-- 网站留言 -->
				<li class='<%=(int)tabVal==AdminPageTab.CONTACT.getValue()?"active":"" %>'>
					<a href="${contextPath}/admin/contact/list.do">
						<i class="fa fa-ticket"></i>
						<span class="title">
							网站留言
						</span>
						<span class="selected">
						</span>
					</a>
				</li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
	</div>
	<!-- END SIDEBAR -->
