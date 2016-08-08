<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
%>
<!DOCTYPE html>
<html>
<head>
<%
	String company = request.getParameter("c");
	String logo = request.getParameter("l");
	String w = request.getParameter("w");
	String h = request.getParameter("h");
	String x = request.getParameter("x");
	String y = request.getParameter("y");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html{width: 100%;height: 100%;overflow: hidden;margin:0;}
#allmap {height: 100%;overflow: hidden;}
#result {border-left:1px dotted #999;height:100%;width:295px;position:absolute;top:0px;right:0px;font-size:12px;}
dl,dt,dd,ul,li{
    margin:0;
    padding:0;
    list-style:none;
}
dt{
    font-size:14px;
    font-family:"Microsoft Yahei";
    font-weight:bold;
    border-bottom:1px dotted #000;
    padding:5px 0 5px 5px;
    margin:5px 0;
}
dd{
    padding:5px 0 0 5px;
}
li{
    line-height:28px;
}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=79eeb597802ffa183e3acf0c347b2c32"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />

<title></title>
</head>
<body>
<div id="allmap" style="overflow:hidden;zoom:1;position:relative;">	
    <div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
</div>

<script type="text/javascript">
    var map = new BMap.Map('map');
    var poi = new BMap.Point(<%=x%>,<%=y%>);
	var opts = {type: BMAP_NAVIGATION_CONTROL_ZOOM}    
    map.centerAndZoom(poi, 15);
    map.enableScrollWheelZoom();
	map.addControl(new BMap.NavigationControl(opts)); 
	<%
		if("nan".equals(logo)){
	%>
	var content = '<img width="<%=w%>" height="<%=h%>" src="http://placehold.it/<%=w%>x<%=h%>" alt="LOGO图片">';
	<%
		}else{
	%>
    var content = '<img width="<%=w%>" height="<%=h%>" src="<%=logo%>" alt="LOGO图片">';
	<%
		}
	%>

    var searchInfoWindow = null;
	searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
			title  : "<%=company%>",      
			width  : <%=w%>,             
			height : <%=h%>,              
			panel  : "panel",         
			enableAutoPan : true,     
			searchTypes   :[
				BMAPLIB_TAB_SEARCH,   
				BMAPLIB_TAB_TO_HERE,  
				BMAPLIB_TAB_FROM_HERE 
			]
		});
    var marker = new BMap.Marker(poi); 
    marker.enableDragging(); 
    marker.addEventListener("click", function(e){
	    searchInfoWindow.open(marker);
    })
    map.addOverlay(marker); 
    searchInfoWindow.open(marker); 
    $("close").onclick = function(){
        searchInfoWindow.close();
    }
    $("show").onclick = function(){
        searchInfoWindow.show();
    }
    $("hide").onclick = function(){
        searchInfoWindow.hide();
    }
    $("getPosition").onclick = function(){
        var position = searchInfoWindow.getPosition();
    }
    $("setValue").onclick = function(){
        searchInfoWindow.setPosition(new BMap.Point($("lng").value, $("lat").value));
        searchInfoWindow.setTitle($("title").value);
        searchInfoWindow.setContent($("content").value);
    }
    $("getContent").onclick = function(){
        alert(searchInfoWindow.getContent());
    }
    $("getTitle").onclick = function(){
        alert(searchInfoWindow.getTitle());
    }
    function $(id){
        return document.getElementById(id);
    }

</script>

</body>
</html>
