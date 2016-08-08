<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.cu.core.vo.OrderVo" %>
<%@ page import="com.yuyue.cu.util.WebConstants" %>
<%@ page import="com.yuyue.CommConstants" %>
<%
OrderVo order = (OrderVo)request.getAttribute("order");
%>
<script src="${contextPath}/web/main/js/jquery.min.js" type="text/javascript"></script>
<script src="${contextPath}/web/main/js/jquery-ui.js" type="text/javascript"></script>
<link rel="stylesheet" href="${contextPath}/web/main/css/jquery-ui-1.9.2.css">
<!--  fancybox -->
<link rel="stylesheet" href="${contextPath}/fancybox/css/jquery.fancybox.css" type="text/css" media="screen">
<script type="text/javascript" src="${contextPath}/fancybox/js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="${contextPath}/fancybox/js/jquery.fancybox.pack.js"></script>
<div id="rt-main" class="mb12">
	<div class="rt-container">
    	<div class="rt-grid-12 ">
        	<div class="rt-block">
	        	<div id="rt-mainbody">
					<div class="component-content">
<div id="k2Container" class="itemListView blog">
	<div class="componentheading blog">
		<h2>您的订单支付异常，请重新提交或者电话联系管理员</h2>
	</div>
	<div class="itemListCategoriesBlock">
	</div>					
	<div class="itemList">
		<div id="itemListLeading">
		
			<div class="K2ItemsRow">
				<div class="itemContainer itemContainerLast" style="width:100.0%;">
					<div class="catItemView blog groupLeading blog">
						<div class="catItemHeader">
							<h3 class="catItemTitle">
								订单号：<%//=order.getSn() %>				
							</h3>
							<span class="catItemDateCreated">
                				<%//=CommConstants.SDF_CN.format(order.getCreateDate()) %>			
                			</span>
						</div>
						<div class="catItemBody">
					<div class="catItemImageBlock">
						<span class="catItemImage">
						</span>
						<div class="clr"></div>
					</div>
					<div class="catItemIntroText">
					</div>
					<div class="clr"></div>
				</div>
				<div class="clr"></div>
			</div>
			<div class="clr"></div>
		</div>
		<div class="clr"></div>
	</div>
		
	
		
								
	</div>
	<div class="clr"></div>
	<div class="clr"></div>
</div>
		
	</div>
</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div class="push"></div>
			