<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	String id = request.getParameter("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>拾取坐标系统</title><link href="css/public.css" rel="stylesheet" type="text/css" /><script type="text/javascript" src="js/api" ></script><script type="text/javascript" src="js/tangram.js"></script><script type="text/javascript" src="js/mapext.js"></script><script type="text/javascript" src="js/copy.js"></script><script type="text/javascript" src="js/public.js"></script><script type="text/javascript">DomReady.ready(localsearch);</script></head><body onresize="mapResize()"><div class="content"><div class="LogoCon clear"><div class="logo"><img src="images/logo.gif" width="146" height="80" border="0" /></div><div class="search map_search"><input type="text" class="text" id="localvalue" value="请输入关键字进行搜索" onfocus="foucs_(this,'请输入关键字进行搜索','')" onblur="blur_(this,'请输入关键字进行搜索','')" callback="beginsearch(l_local)"/><input class="button" type="button" value="百度一下" id="localsearch" /><label class="pointLabel" for="pointLabel"><input style="display:none;" type="checkbox" onfocus="this.blur()" id="pointLabel" /></label><span class="searchTip" id="searchTip"></span></div><div style="width:400px;position:relative;float:right;"><div style="color:#666;line-height:25px;">当前坐标点如下：</div><input type="text" readonly id="pointInput" style="display:inline-block;background:#EBEBE4;border:#7F9DB9 solid 1px;color:#555;width:160px;height:30px;line-height:30px;font-size:14px;font-weight:700" /><span id="copyButton"><input type="button" value="确定" onclick="copyPoints();" style="margin-left:8px;float:right" /></span><span id="copyMessage" style="width:50px;position:absolute;top:5px;right:175px;*right:170px;color:#f00;display:none">复制成功</span><div style="color:#777;margin-top:5px;display:none">(默认显示地图中心点坐标,鼠标左键单击后显示单击点的坐标)</div></div></div><div class="dt_nav"><span class="result" id="resultNum"></span><ul class="nav"><li><div class="l"><b id="curCity"></b><span><a id="curCityText" onclick="javascript:void(0);"></a></span></div><span class="r"></span></li><li><div class="l"><b>当前层级：<span id="ZoomNum"></span>级</b></div><span class="r"></span></li></ul></div><div id="wrapper"><div id="MapHolder" style="overflow:hidden;"></div><!--右侧地图Info begin--><div id="MapInfo"><div id="txtPanel"><h3>功能简介：</h3><p class="tip_info">1、支持地址 精确/模糊 查询；<br/>2、支持POI点坐标显示、复制；<br/>3、坐标鼠标跟随显示；<br/>4、<font color="red">支持坐标查询(需要将坐标反查框勾选)；</font><br/></p><h3>使用说明：</h3><p class="tip_info">1、获取坐标并复制：<br/><span class="tip_info_em">1)、在搜索框中搜索关键词后，左侧列表中会有该点的坐标，点击该条信息或地图上该点，都会将坐标显示在地图右上角的Input框中,然后点击复制按钮，该点坐标就复制成功了;<br />2)、在地图上用鼠标左键单击地图，就能将该点坐标显示在地图右上角的Input框中,然后点击复制按钮，该点坐标就复制成功了;</span>2、坐标反查：<br/><span class="tip_info_em">1)、先勾选住 搜索框后面的 <font color="red">坐标反查框</font><br />2)、输入一个正确的坐标(比如：116.307629,40.058359)，点击按钮 <b>百度一下</b>，就能将该点显示在地图上、切换地图，<font color="red">如果解析成功，还能返回一个地址</font></span></p></div></div><!--右侧地图Info end--><!--地图上边右边透明立体边框 begin--><div id="shad"><div id="shad_v"></div><div id="shad_h"></div></div><!--地图上边右边透明立体边框 end--></div></div><!--更换城市 begin--><div style="width: 382px; display: none; left: 5px; top: 139px; height: 344px;" class="map_popup" id="map_popup"><div class="popup_main"><div class="title">城市列表</div><div class="sel_city" style="height: 320px; overflow-y: auto;overflow-x:hidden;margin:0;padding-left:5px">
<script src="${contextPath}/admin/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function copyPoints(){
		var baiduPoint = document.getElementById('pointInput').value;
		var points = baiduPoint.split(',');
		var mapX = points[0];
		var mapY = points[1];
		jQuery('#<%=id%>',window.parent.document).find('.mapX').val(mapX);
		jQuery('#<%=id%>',window.parent.document).find('.mapY').val(mapY);
		jQuery('#<%=id%>',window.parent.document).find('.alitutdesInput').val(mapX+','+mapY);
		window.parent.document.getElementById('cboxClose').click();
	}
</script>
<table style="width:345px;margin-bottom:20px;overflow:hidden;" id="selCity">
  <tr>
	<td colspan="2" class="selCityInput"><input id="selCityInput" type="text" value="请输入城市名" onfocus="foucs_(this,'请输入城市名','')" onblur="blur_(this,'请输入城市名','')" class="selCityInputT" callback="goCity(Fe.G('selCityInput'))" style="color:#8C8C8C"/><input id="selCityButton" value="确定" type="button" onclick="javascript:void(0);"><span style="color:#f00;display:none" id="selCityMessage">请输入正确的城市名</span></td>
  </tr>
  <tr>
    <td width="57">直辖市：</td>
    <td width="287">
        <nobr><a onclick="javascript:void(0);" name="北京市">北京</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="上海市">上海</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="天津市">天津</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="重庆市">重庆</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">安徽</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);" name="合肥市">合肥</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="安庆市">安庆</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="蚌埠市">蚌埠</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="亳州市">亳州</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="巢湖市">巢湖</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="池州市">池州</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="滁州市">滁州</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="阜阳市">阜阳</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="淮北市">淮北</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="淮南市">淮南</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="黄山市">黄山</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="六安市">六安</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="马鞍山市">马鞍山</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="宿州市">宿州</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="铜陵市">铜陵</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="芜湖市">芜湖</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="宣城市">宣城</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">福建</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">福州</a></nobr>
        <nobr><a onclick="javascript:void(0);">龙岩</a></nobr>
        <nobr><a onclick="javascript:void(0);">南平</a></nobr>
        <nobr><a onclick="javascript:void(0);">宁德</a></nobr>
        <nobr><a onclick="javascript:void(0);">莆田</a></nobr>
        <nobr><a onclick="javascript:void(0);">泉州</a></nobr>
        <nobr><a onclick="javascript:void(0);">三明</a></nobr>
        <nobr><a onclick="javascript:void(0);">厦门</a></nobr>
        <nobr><a onclick="javascript:void(0);">漳州</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">甘肃</a></nobr>：</td>
    <td>
		<nobr><a onclick="javascript:void(0);">兰州</a></nobr>
		<nobr><a onclick="javascript:void(0);">白银</a></nobr>
		<nobr><a onclick="javascript:void(0);">定西</a></nobr>
		<nobr><a name="甘南藏族自治州" onclick="javascript:void(0);">甘南州</a></nobr>
		<nobr><a onclick="javascript:void(0);">嘉峪关</a></nobr>
		<nobr><a onclick="javascript:void(0);">金昌</a></nobr>
		<nobr><a onclick="javascript:void(0);">酒泉</a></nobr>
		<nobr><a name="临夏回族自治州" onclick="javascript:void(0);">临夏州</a></nobr>
		<nobr><a onclick="javascript:void(0);">平凉</a></nobr>
		<nobr><a onclick="javascript:void(0);">庆阳</a></nobr>
		<nobr><a onclick="javascript:void(0);">天水</a></nobr>
		<nobr><a onclick="javascript:void(0);">武威</a></nobr>
		<nobr><a onclick="javascript:void(0);">张掖</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">广东</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">广州</a></nobr>
        <nobr><a onclick="javascript:void(0);">潮州</a></nobr>
        <nobr><a onclick="javascript:void(0);">东莞</a></nobr>
        <nobr><a onclick="javascript:void(0);">佛山</a></nobr>
        <nobr><a onclick="javascript:void(0);">河源</a></nobr>
        <nobr><a onclick="javascript:void(0);">惠州</a></nobr>
        <nobr><a onclick="javascript:void(0);">江门</a></nobr>
        <nobr><a onclick="javascript:void(0);">揭阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">茂名</a></nobr>
        <nobr><a onclick="javascript:void(0);">梅州</a></nobr>
        <nobr><a onclick="javascript:void(0);">清远</a></nobr>
        <nobr><a onclick="javascript:void(0);">汕头</a></nobr>
        <nobr><a onclick="javascript:void(0);">汕尾</a></nobr>
        <nobr><a onclick="javascript:void(0);">韶关</a></nobr>
        <nobr><a onclick="javascript:void(0);">深圳</a></nobr>
        <nobr><a onclick="javascript:void(0);">阳江</a></nobr>
        <nobr><a onclick="javascript:void(0);">云浮</a></nobr>
        <nobr><a onclick="javascript:void(0);">湛江</a></nobr>
        <nobr><a onclick="javascript:void(0);">肇庆</a></nobr>
        <nobr><a onclick="javascript:void(0);">中山</a></nobr>
        <nobr><a onclick="javascript:void(0);">珠海</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">广西</a></nobr>：</td>
    <td>
		<nobr><a onclick="javascript:void(0);">南宁</a></nobr>
        <nobr><a onclick="javascript:void(0);">百色</a></nobr>
        <nobr><a onclick="javascript:void(0);">北海</a></nobr>
        <nobr><a onclick="javascript:void(0);">崇左</a></nobr>
        <nobr><a onclick="javascript:void(0);">防城港</a></nobr>
        <nobr><a onclick="javascript:void(0);">桂林</a></nobr>
        <nobr><a onclick="javascript:void(0);">贵港</a></nobr>
        <nobr><a onclick="javascript:void(0);">河池</a></nobr>
        <nobr><a onclick="javascript:void(0);">贺州</a></nobr>
        <nobr><a onclick="javascript:void(0);">来宾</a></nobr>
        <nobr><a onclick="javascript:void(0);">柳州</a></nobr>
        <nobr><a onclick="javascript:void(0);">钦州</a></nobr>
        <nobr><a onclick="javascript:void(0);">梧州</a></nobr>
        <nobr><a onclick="javascript:void(0);">玉林</a></nobr>	
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">贵州</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">贵阳</a></nobr>
		<nobr><a onclick="javascript:void(0);">安顺</a></nobr>
		<nobr><a onclick="javascript:void(0);">毕节地区</a></nobr>
		<nobr><a onclick="javascript:void(0);">六盘水</a></nobr>
		<nobr><a onclick="javascript:void(0);">铜仁地区</a></nobr>
		<nobr><a onclick="javascript:void(0);">遵义</a></nobr>
		<nobr><a name="黔西南布依族苗族自治州" onclick="javascript:void(0);">黔西南州</a></nobr>
   	</td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">海南</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">海口</a></nobr>
        <nobr><a name="白沙黎族自治县" onclick="javascript:void(0);">白沙</a></nobr>
        <nobr><a name="保亭黎族苗族自治县" onclick="javascript:void(0);">保亭</a></nobr>
        <nobr><a name="昌江黎族自治县" onclick="javascript:void(0);">昌江</a></nobr>
        <nobr><a onclick="javascript:void(0);">儋州</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="澄迈县">澄迈</a></nobr>
        <nobr><a onclick="javascript:void(0);">东方</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="定安县">定安</a></nobr>
        <nobr><a onclick="javascript:void(0);">琼海</a></nobr>
        <nobr><a name="琼中黎族苗族自治县" onclick="javascript:void(0);">琼中</a></nobr>
        <nobr><a name="乐东黎族自治县" onclick="javascript:void(0);">乐东</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="临高县">临高</a></nobr>
        <nobr><a name="陵水黎族自治县" onclick="javascript:void(0);">陵水</a></nobr>
        <nobr><a onclick="javascript:void(0);">三亚</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="屯昌县">屯昌</a></nobr>
        <nobr><a onclick="javascript:void(0);">万宁</a></nobr>
        <nobr><a onclick="javascript:void(0);">文昌</a></nobr>
        <nobr><a onclick="javascript:void(0);">五指山</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">河北</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">石家庄</a></nobr>
        <nobr><a onclick="javascript:void(0);">保定</a></nobr>
        <nobr><a onclick="javascript:void(0);">沧州</a></nobr>
        <nobr><a onclick="javascript:void(0);">承德</a></nobr>
        <nobr><a onclick="javascript:void(0);">邯郸</a></nobr>
        <nobr><a onclick="javascript:void(0);">衡水</a></nobr>
        <nobr><a onclick="javascript:void(0);">廊坊</a></nobr>
        <nobr><a onclick="javascript:void(0);">秦皇岛</a></nobr>
        <nobr><a onclick="javascript:void(0);">唐山</a></nobr>
        <nobr><a onclick="javascript:void(0);">邢台</a></nobr>
        <nobr><a onclick="javascript:void(0);">张家口</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">河南</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">郑州</a></nobr>
        <nobr><a onclick="javascript:void(0);">安阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">鹤壁</a></nobr>
        <nobr><a onclick="javascript:void(0);">焦作</a></nobr>
        <nobr><a onclick="javascript:void(0);">开封</a></nobr>
        <nobr><a onclick="javascript:void(0);">洛阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">漯河</a></nobr>
        <nobr><a onclick="javascript:void(0);">南阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">平顶山</a></nobr>
        <nobr><a onclick="javascript:void(0);">濮阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">三门峡</a></nobr>
        <nobr><a onclick="javascript:void(0);">商丘</a></nobr>
        <nobr><a onclick="javascript:void(0);">新乡</a></nobr>
        <nobr><a onclick="javascript:void(0);">信阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">许昌</a></nobr>
        <nobr><a onclick="javascript:void(0);">周口</a></nobr>
        <nobr><a onclick="javascript:void(0);">驻马店</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">黑龙江</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">哈尔滨</a></nobr>
        <nobr><a onclick="javascript:void(0);">大庆</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="大兴安岭地区">大兴安岭地区</a></nobr>
        <nobr><a onclick="javascript:void(0);">鹤岗</a></nobr>
        <nobr><a onclick="javascript:void(0);">黑河</a></nobr>
        <nobr><a onclick="javascript:void(0);">鸡西</a></nobr>
        <nobr><a onclick="javascript:void(0);">佳木斯</a></nobr>
        <nobr><a onclick="javascript:void(0);">牡丹江</a></nobr>
        <nobr><a onclick="javascript:void(0);">七台河</a></nobr>
        <nobr><a onclick="javascript:void(0);">齐齐哈尔</a></nobr>
        <nobr><a onclick="javascript:void(0);">双鸭山</a></nobr>
        <nobr><a onclick="javascript:void(0);">绥化</a></nobr>
        <nobr><a onclick="javascript:void(0);">伊春</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">湖北</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">武汉</a></nobr>
        <nobr><a onclick="javascript:void(0);">鄂州</a></nobr>
        <nobr><a name="恩施土家族苗族自治州" onclick="javascript:void(0);">恩施</a></nobr>
        <nobr><a onclick="javascript:void(0);">黄冈</a></nobr>
        <nobr><a onclick="javascript:void(0);">黄石</a></nobr>
        <nobr><a onclick="javascript:void(0);">荆门</a></nobr>
        <nobr><a onclick="javascript:void(0);">荆州</a></nobr>
        <nobr><a onclick="javascript:void(0);">潜江</a></nobr>
        <nobr><a onclick="javascript:void(0);">神农架林区</a></nobr>
        <nobr><a onclick="javascript:void(0);">十堰</a></nobr>
        <nobr><a onclick="javascript:void(0);">随州</a></nobr>
        <nobr><a onclick="javascript:void(0);">天门</a></nobr>
        <nobr><a onclick="javascript:void(0);">仙桃</a></nobr>
        <nobr><a onclick="javascript:void(0);">咸宁</a></nobr>
        <nobr><a onclick="javascript:void(0);">襄樊</a></nobr>
        <nobr><a onclick="javascript:void(0);">孝感</a></nobr>
        <nobr><a onclick="javascript:void(0);">宜昌</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">湖南</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">长沙</a></nobr>
        <nobr><a onclick="javascript:void(0);">常德</a></nobr>
        <nobr><a onclick="javascript:void(0);">郴州</a></nobr>
        <nobr><a onclick="javascript:void(0);">衡阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">怀化</a></nobr>
        <nobr><a onclick="javascript:void(0);">娄底</a></nobr>
        <nobr><a onclick="javascript:void(0);">邵阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">湘潭</a></nobr>
        <nobr><a onclick="javascript:void(0);">益阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">永州</a></nobr>
        <nobr><a onclick="javascript:void(0);">岳阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">张家界</a></nobr>
        <nobr><a onclick="javascript:void(0);">株洲</a></nobr>	
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">江苏</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">南京</a></nobr>
        <nobr><a onclick="javascript:void(0);">常州</a></nobr>
        <nobr><a onclick="javascript:void(0);">淮安</a></nobr>
        <nobr><a onclick="javascript:void(0);">连云港</a></nobr>
        <nobr><a onclick="javascript:void(0);">南通</a></nobr>
        <nobr><a onclick="javascript:void(0);">苏州</a></nobr>
        <nobr><a onclick="javascript:void(0);">宿迁</a></nobr>
        <nobr><a onclick="javascript:void(0);">泰州</a></nobr>
        <nobr><a onclick="javascript:void(0);">无锡</a></nobr>
        <nobr><a onclick="javascript:void(0);">徐州</a></nobr>
        <nobr><a onclick="javascript:void(0);">盐城</a></nobr>
        <nobr><a onclick="javascript:void(0);">扬州</a></nobr>
        <nobr><a onclick="javascript:void(0);">镇江</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">江西</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">南昌</a></nobr>
        <nobr><a onclick="javascript:void(0);">抚州</a></nobr>
        <nobr><a onclick="javascript:void(0);">赣州</a></nobr>
        <nobr><a onclick="javascript:void(0);">吉安</a></nobr>
        <nobr><a onclick="javascript:void(0);">景德镇</a></nobr>
        <nobr><a onclick="javascript:void(0);">九江</a></nobr>
        <nobr><a onclick="javascript:void(0);">萍乡</a></nobr>
        <nobr><a onclick="javascript:void(0);">上饶</a></nobr>
        <nobr><a onclick="javascript:void(0);">新余</a></nobr>
        <nobr><a onclick="javascript:void(0);">宜春</a></nobr>
        <nobr><a onclick="javascript:void(0);">鹰潭</a></nobr>
	</td>
  </tr>
  <tr>
    <td><nobr><a class="black" name="吉林省" onclick="javascript:void(0);">吉林</a></nobr>：</td>
    <td>
		<nobr><a onclick="javascript:void(0);">长春</a></nobr>
        <nobr><a onclick="javascript:void(0);">白城</a></nobr>
        <nobr><a onclick="javascript:void(0);">白山</a></nobr>
        <nobr><a onclick="javascript:void(0);">吉林市</a></nobr>
        <nobr><a onclick="javascript:void(0);"/></nobr>
        <nobr><a onclick="javascript:void(0);">辽源</a></nobr>
        <nobr><a onclick="javascript:void(0);">四平</a></nobr>
        <nobr><a onclick="javascript:void(0);">松原</a></nobr>
        <nobr><a onclick="javascript:void(0);">通化</a></nobr>
        <nobr><a name="延边朝鲜族自治州" onclick="javascript:void(0);">延边</a></nobr>
    </td>
  </tr>
  <tr>
    <td><a class="black" onclick="javascript:void(0);">辽宁</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">沈阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">鞍山</a></nobr>
        <nobr><a onclick="javascript:void(0);">本溪</a></nobr>
        <nobr><a onclick="javascript:void(0);">朝阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">大连</a></nobr>
        <nobr><a onclick="javascript:void(0);">丹东</a></nobr>
        <nobr><a onclick="javascript:void(0);">抚顺</a></nobr>
        <nobr><a onclick="javascript:void(0);">阜新</a></nobr>
        <nobr><a onclick="javascript:void(0);">葫芦岛</a></nobr>
        <nobr><a onclick="javascript:void(0);">锦州</a></nobr>
        <nobr><a onclick="javascript:void(0);">辽阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">盘锦</a></nobr>
        <nobr><a onclick="javascript:void(0);">铁岭</a></nobr>
        <nobr><a onclick="javascript:void(0);">营口</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">内蒙古</a></nobr>：</td>
    <td>
		<nobr><a onclick="javascript:void(0);">呼和浩特</a></nobr>
		<nobr><a onclick="javascript:void(0);">包头</a></nobr>
		<nobr><a onclick="javascript:void(0);">巴彦淖尔</a></nobr>
		<nobr><a onclick="javascript:void(0);">赤峰</a></nobr>
		<nobr><a onclick="javascript:void(0);">鄂尔多斯</a></nobr>
		<nobr><a onclick="javascript:void(0);">呼伦贝尔</a></nobr>
		<nobr><a onclick="javascript:void(0);">通辽</a></nobr>
		<nobr><a onclick="javascript:void(0);">乌海</a></nobr>
		<nobr><a onclick="javascript:void(0);">乌兰察布</a></nobr>
		<nobr><a onclick="javascript:void(0);" name="兴安盟">兴安盟</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">宁夏</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">银川</a></nobr>
        <nobr><a onclick="javascript:void(0);">固原</a></nobr>
        <nobr><a onclick="javascript:void(0);">石嘴山</a></nobr>
        <nobr><a onclick="javascript:void(0);">吴忠</a></nobr>
        <nobr><a onclick="javascript:void(0);">中卫</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">青海</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">西宁</a></nobr>
        <nobr><a name="果洛藏族自治州" onclick="javascript:void(0);">果洛州</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="海东地区">海东地区</a></nobr>
        <nobr><a name="海北藏族自治州" onclick="javascript:void(0);">海北州</a></nobr>
        <nobr><a name="海南藏族自治州" onclick="javascript:void(0);">海南州</a></nobr>
        <nobr><a name="海西蒙古族藏族自治州" onclick="javascript:void(0);">海西州</a></nobr>
        <nobr><a name="黄南藏族自治州" onclick="javascript:void(0);">黄南州</a></nobr>
        <nobr><a name="玉树藏族自治州" onclick="javascript:void(0);">玉树州</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">山东</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">济南</a></nobr>
        <nobr><a onclick="javascript:void(0);">滨州</a></nobr>
        <nobr><a onclick="javascript:void(0);">东营</a></nobr>
        <nobr><a onclick="javascript:void(0);">德州</a></nobr>
        <nobr><a onclick="javascript:void(0);">菏泽</a></nobr>
        <nobr><a onclick="javascript:void(0);">济宁</a></nobr>
        <nobr><a onclick="javascript:void(0);">莱芜</a></nobr>
        <nobr><a onclick="javascript:void(0);">聊城</a></nobr>
        <nobr><a onclick="javascript:void(0);">临沂</a></nobr>
        <nobr><a onclick="javascript:void(0);">青岛</a></nobr>
        <nobr><a onclick="javascript:void(0);">日照</a></nobr>
        <nobr><a onclick="javascript:void(0);">泰安</a></nobr>
        <nobr><a onclick="javascript:void(0);">威海</a></nobr>
        <nobr><a onclick="javascript:void(0);">潍坊</a></nobr>
        <nobr><a onclick="javascript:void(0);">烟台</a></nobr>
        <nobr><a onclick="javascript:void(0);">枣庄</a></nobr>
        <nobr><a onclick="javascript:void(0);">淄博</a></nobr>
        <nobr><a onclick="javascript:void(0);"/></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">山西</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">太原</a></nobr>
        <nobr><a onclick="javascript:void(0);">长治</a></nobr>
        <nobr><a onclick="javascript:void(0);">大同</a></nobr>
        <nobr><a onclick="javascript:void(0);">晋城</a></nobr>
        <nobr><a onclick="javascript:void(0);">晋中</a></nobr>
        <nobr><a onclick="javascript:void(0);">临汾</a></nobr>
        <nobr><a onclick="javascript:void(0);">吕梁</a></nobr>
        <nobr><a onclick="javascript:void(0);">朔州</a></nobr>
        <nobr><a onclick="javascript:void(0);">忻州</a></nobr>
        <nobr><a onclick="javascript:void(0);">阳泉</a></nobr>
        <nobr><a onclick="javascript:void(0);">运城</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">陕西</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">西安</a></nobr>
        <nobr><a onclick="javascript:void(0);">安康</a></nobr>
        <nobr><a onclick="javascript:void(0);">宝鸡</a></nobr>
        <nobr><a onclick="javascript:void(0);">汉中</a></nobr>
        <nobr><a onclick="javascript:void(0);">商洛</a></nobr>
        <nobr><a onclick="javascript:void(0);">铜川</a></nobr>
        <nobr><a onclick="javascript:void(0);">渭南</a></nobr>
        <nobr><a onclick="javascript:void(0);">咸阳</a></nobr>
        <nobr><a onclick="javascript:void(0);">延安</a></nobr>
        <nobr><a onclick="javascript:void(0);">榆林</a></nobr>
	</td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">四川</a></nobr>：</td>
    <td>
		<nobr><a onclick="javascript:void(0);">成都</a></nobr>
		<nobr><a name="阿坝藏族羌族自治州" onclick="javascript:void(0);">阿坝州</a></nobr>
		<nobr><a onclick="javascript:void(0);">巴中</a></nobr>
		<nobr><a onclick="javascript:void(0);">达州</a></nobr>
		<nobr><a onclick="javascript:void(0);">德阳</a></nobr>
		<nobr><a name="甘孜藏族自治州" onclick="javascript:void(0);">甘孜州</a></nobr>
		<nobr><a onclick="javascript:void(0);">广安</a></nobr>
		<nobr><a onclick="javascript:void(0);">广元</a></nobr>
		<nobr><a onclick="javascript:void(0);">乐山</a></nobr>
		<nobr><a name="凉山彝族自治州" onclick="javascript:void(0);">凉山州</a></nobr>
		<nobr><a onclick="javascript:void(0);">泸州</a></nobr>
		<nobr><a onclick="javascript:void(0);">南充</a></nobr>
		<nobr><a onclick="javascript:void(0);">眉山</a></nobr>
		<nobr><a onclick="javascript:void(0);">绵阳</a></nobr>
		<nobr><a onclick="javascript:void(0);">内江</a></nobr>
		<nobr><a onclick="javascript:void(0);">攀枝花</a></nobr>
		<nobr><a onclick="javascript:void(0);">遂宁</a></nobr>
		<nobr><a onclick="javascript:void(0);">雅安</a></nobr>
		<nobr><a onclick="javascript:void(0);">宜宾</a></nobr>
		<nobr><a onclick="javascript:void(0);">资阳</a></nobr>
		<nobr><a onclick="javascript:void(0);">自贡</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">西藏</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">拉萨</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="阿里地区">阿里地区</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="昌都地区">昌都地区</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="林芝地区">林芝地区</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="那曲地区">那曲地区</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="日喀则地区">日喀则地区</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="山南地区">山南地区</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">新疆</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">乌鲁木齐</a></nobr>
        <nobr><a onclick="javascript:void(0);">阿拉尔</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="阿克苏地区">阿克苏地区</a></nobr>
        <nobr><a onclick="javascript:void(0);">阿勒泰地区</a></nobr>
        <nobr><a name="昌吉回族自治州" onclick="javascript:void(0);">昌吉州</a></nobr>
        <nobr><a onclick="javascript:void(0);">哈密地区</a></nobr>
        <nobr><a onclick="javascript:void(0);">和田地区</a></nobr>
        <nobr><a onclick="javascript:void(0);">喀什地区</a></nobr>
        <nobr><a onclick="javascript:void(0);">克拉玛依</a></nobr>
        <nobr><a onclick="javascript:void(0);">石河子</a></nobr>
        <nobr><a onclick="javascript:void(0);">塔城地区</a></nobr>
        <nobr><a onclick="javascript:void(0);">吐鲁番地区</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">云南</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">昆明</a></nobr>
        <nobr><a onclick="javascript:void(0);">保山</a></nobr>
        <nobr><a name="楚雄彝族自治州" onclick="javascript:void(0);">楚雄州</a></nobr>
        <nobr><a name="大理白族自治州" onclick="javascript:void(0);">大理州</a></nobr>
        <nobr><a name="德宏傣族景颇族自治州" onclick="javascript:void(0);">德宏州</a></nobr>
        <nobr><a name="迪庆藏族自治州" onclick="javascript:void(0);">迪庆州</a></nobr>
        <nobr><a name="红河哈尼族彝族自治州" onclick="javascript:void(0);">红河州</a></nobr>
        <nobr><a onclick="javascript:void(0);">丽江</a></nobr>
        <nobr><a onclick="javascript:void(0);">临沧</a></nobr>
        <nobr><a name="怒江傈僳族自治州" onclick="javascript:void(0);">怒江州</a></nobr>
        <nobr><a onclick="javascript:void(0);">普洱</a></nobr>
        <nobr><a onclick="javascript:void(0);">曲靖</a></nobr>
        <nobr><a onclick="javascript:void(0);">昭通</a></nobr>
        <nobr><a name="文山壮族苗族自治州" onclick="javascript:void(0);">文山</a></nobr>
        <nobr><a name="西双版纳傣族自治州" onclick="javascript:void(0);">西双版纳</a></nobr>
        <nobr><a onclick="javascript:void(0);">玉溪</a></nobr>
    </td>
  </tr>
  <tr>
    <td><nobr><a class="black" onclick="javascript:void(0);">浙江</a></nobr>：</td>
    <td>
        <nobr><a onclick="javascript:void(0);">杭州</a></nobr>
        <nobr><a onclick="javascript:void(0);">湖州</a></nobr>
        <nobr><a onclick="javascript:void(0);">嘉兴</a></nobr>
        <nobr><a onclick="javascript:void(0);">金华</a></nobr>
        <nobr><a onclick="javascript:void(0);">丽水</a></nobr>
        <nobr><a onclick="javascript:void(0);">宁波</a></nobr>
        <nobr><a onclick="javascript:void(0);">衢州</a></nobr>
        <nobr><a onclick="javascript:void(0);">绍兴</a></nobr>
        <nobr><a onclick="javascript:void(0);">台州</a></nobr>
        <nobr><a onclick="javascript:void(0);">温州</a></nobr>
        <nobr><a onclick="javascript:void(0);">舟山</a></nobr>
    </td>
  </tr>
  <tr>
  	<td colspan="2">
        <nobr><a onclick="javascript:void(0);" name="香港特别行政区">香港</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="澳门特别行政区">澳门</a></nobr>
        <nobr><a onclick="javascript:void(0);" name="台北县">台湾</a></nobr>
	</td>
  </tr>
</table>
</div><button onclick="javascript:void(0);"></button></div><div class="poput_shadow" style="height: 291px;width:100%"></div></div><!--更换城市 end--> 
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F21b27145da0487d1e9f52a8e5576e564' type='text/javascript'%3E%3C/script%3E"));
</script>
<script>loadBody();</script>
</body>
</html>
