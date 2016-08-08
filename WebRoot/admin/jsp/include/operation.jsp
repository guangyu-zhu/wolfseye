<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	String name = request.getParameter("name");
%>
<ul class="dropdown-menu pull-right">
	<li>
		<a href="${contextPath}/admin/<%=name%>/list.do">
			<i class="fa fa-list"></i>&nbsp;&nbsp;&nbsp;项目列表
		</a>
	</li>
	<li>
		<a href="${contextPath}/admin/<%=name%>/detail.do">
			<i class="fa fa-plus"></i>&nbsp;&nbsp;&nbsp;项目添加
		</a>
	</li>
	<li class="divider">
	</li>
	<li>
		<a href="javascript:;" onclick="window.location.reload();">
			<i class="fa fa-refresh"></i>&nbsp;&nbsp;&nbsp;页面刷新
		</a>
	</li>
</ul>