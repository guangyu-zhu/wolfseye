<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/page.tld" prefix="page"%>
<%@ page import="java.util.*"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="com.yuyue.util.CommConstants" %>
<%@ page import="com.yuyue.util.KeyConstants" %>
<%@ page import="com.yuyue.util.LabelConstants" %>
<%@ page import="com.yuyue.web.jo.PrdJo" %>
<link rel="stylesheet" href="${contextPath}/plugin/calendar/css/jquery-ui.css">
<script src="${contextPath}/plugin/calendar/js/jquery-ui.js"></script>
<%
	PrdJo prdJo = (PrdJo)request.getAttribute("prdJo");
	if(prdJo != null){
%>
<style>
.textBlock1 a {
    margin-left: 0px;
}
</style>
  <!--========================================================
                            CONTENT
  =========================================================-->
  <main>
    <section>
      <div class="camera_container">
        <div id="camera" class="camera_wrap">
          <div data-src="${contextPath}/web/site/images/page-1_slide01.jpg">
            <div class="camera_caption fadeIn">
              <h2 style="font-family:'Microsoft Yahei' !important;font-size:40px;"><%=prdJo.getNotification()%><br><span style="font-family:'Microsoft Yahei' !important;font-size:30px;">持仓比例：<%=prdJo.getHoldPercentage()%>%</span></h2>
              <%
              	if(prdJo.getAlertLevel() == LabelConstants.ALERT_LEVEL_1.getValue()){
              %>		
              <a class="fa fa-remove" style="background-color:#f15f43;"></a>
              <%
              	}else if(prdJo.getAlertLevel() == LabelConstants.ALERT_LEVEL_2.getValue()){
             %>		
             <a class="fa fa-warning" style="background-color:#f2d03b;"></a>
             <%		
              	}else if(prdJo.getAlertLevel() == LabelConstants.ALERT_LEVEL_3.getValue()){
       		 %>		
       		 <a class="fa fa-check" style="background-color:#91c46c;"></a>
             <%		
              	}
              %>
            </div>
          </div>
          <div data-src="${contextPath}/web/site/images/page-1_slide01.jpg">
            <div class="camera_caption fadeIn">
              <h2 style="font-family:'Microsoft Yahei' !important;font-size:40px;"><%=prdJo.getNotification()%><br><span style="font-family:'Microsoft Yahei' !important;font-size:30px;">持仓比例：<%=prdJo.getHoldPercentage()%>%</span></h2>
              <%
              	if(prdJo.getAlertLevel() == LabelConstants.ALERT_LEVEL_1.getValue()){
              %>		
              <a class="fa fa-remove" style="background-color:#f15f43;"></a>
              <%
              	}else if(prdJo.getAlertLevel() == LabelConstants.ALERT_LEVEL_2.getValue()){
             %>		
             <a class="fa fa-warning" style="background-color:#f2d03b;"></a>
             <%		
              	}else if(prdJo.getAlertLevel() == LabelConstants.ALERT_LEVEL_3.getValue()){
       		 %>		
       		 <a class="fa fa-check" style="background-color:#91c46c;"></a>
             <%		
              	}
              %>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="well bg1">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-sm-6 col-xs-12">
          	<div class="textBlock1">
            	<h3 class="color1">日内回顾</h3> 
            	
            	<a href="${contextPath}/upload/files/prd/<%=prdJo.getTodayImage()%>" class="lightbox" rel="group1"><img src="${contextPath}/upload/files/prd/<%=prdJo.getTodayImage()%>"></a>
            <%
            	String moreTodayImages = prdJo.getMoreTodayImages();
            	String[] todayImageArray = moreTodayImages.split(",");
            	for(String image : todayImageArray){
            %>
            <a href="${contextPath}/upload/files/prd/<%=image%>" class="lightbox" rel="group1"></a>
            <%		
            	}
            %>   
            </div>
          </div>
          <div class="col-md-6 col-sm-12 col-xs-12 wow fadeInRight">
          <div class="textBlock1">
            <h3 class="color2">日后前瞻</h3>
            	<a href="${contextPath}/upload/files/prd/<%=prdJo.getPredictImage()%>" class="lightbox" rel="group2"><img src="${contextPath}/upload/files/prd/<%=prdJo.getPredictImage()%>"></a>
            	<%
	            	String morePredictImages = prdJo.getMorePredictImages();
	            	String[] predictImageArray = morePredictImages.split(",");
	            	for(String image : predictImageArray){
	            %>
	            <a href="${contextPath}/upload/files/prd/<%=image%>" class="lightbox" rel="group2"></a>
	            <%		
	            	}
	            %>  
            </div>
          </div>
        </div>
        <div class="row">
        	<div class="col-md-12">
        		<center>
        			<input class="jcalendar form-control">
        			<a href="#" class="goAnotherDay">GO</a>
        		</center>
        	</div>
        </div>
      </div>
    </section>
  </main>

<%		
	}else{
%>
<center><h2>今日无数据</h2></center>
<div class="row">
	<div class="col-md-12">
		<center>
			<input class="jcalendar form-control">
			<a href="#" class="goAnotherDay">GO</a>
		</center>
	</div>
</div>
<%		
	}
%>

<script type="text/javascript">
	jQuery(function(){
		jQuery('.goAnotherDay').click(function(){
			var day = jQuery('.jcalendar').val();
			window.location.href = '${contextPath}/web/home.do?history='+day;
		})
	})
</script>