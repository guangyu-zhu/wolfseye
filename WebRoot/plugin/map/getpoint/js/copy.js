﻿M.fe.copy=function(a){a.copyTag=a.copyTag||"value";if(a.flashUrl){ZeroClipboard.moviePath=a.flashUrl}a.callback=a.callback||function(){alert("复制成功!")};var b=new ZeroClipboard.Client();b.addEventListener("mouseDown",function(c){b.setText(document.getElementById(a.copytextId)[a.copyTag])});b.addEventListener("complete",function(){a.callback(b.clipText)});baidu.dom.ready(function(){b.glue(a.copyBtnId)})};M.fe.scriptRequest=function(ops){var url=ops.url;var echo=ops.echo;var id=ops.id;var charset=ops.charset;var flag=ops.flag;var isIe=/msie/i.test(window.navigator.userAgent);if(isIe&&baidu.dom.g("_script_"+id)){var script=baidu.dom.g("_script_"+id)}else{if(baidu.dom.g("_script_"+id)){baidu.dom.g("_script_"+id).parentNode.removeChild(baidu.dom.g("_script_"+id))}var script=document.createElement("script");if(charset!=null){script.charset=charset}if(id!=null&&id!=""){script.setAttribute("id","_script_"+id)}script.setAttribute("type","text/javascript");document.body.appendChild(script)}if(!flag){var t=new Date();if(url.indexOf("?")>-1){url+="&t="+t.getTime()}else{url+="?t="+t.getTime()}}var _complete=function(){if(!script.readyState||script.readyState=="loaded"||script.readyState=="complete"){script.onreadystatechange=script.onload=null;if(typeof(echo)=="function"){try{echo()}catch(e){}}else{eval(echo)}}};if(isIe){script.onreadystatechange=_complete}else{script.onload=_complete}script.setAttribute("src",url)};M.service.shorturl=function(g){var h=g.url||"",d=g.callback||"",a="http://j.map.baidu.com/?",i;if(h==""){return false}i={url:h,callback:d,web:"true"};var f=[],j=0,c,e,b;for(c in i){if(i.hasOwnProperty(c)){e=i[c];if(Object.prototype.toString.call(e)=="[object Array]"){b=e.length;while(b--){f[j++]=c+"="+encodeURIComponent(e[b])}}else{f[j++]=c+"="+encodeURIComponent(e)}}}M.fe.scriptRequest({url:a+f.join("&")});return true};var ZeroClipboard={version:"1.0.7",clients:{},moviePath:"Images/clipboard.swf",nextId:1,$:function(b){if(typeof(b)=="string"){b=document.getElementById(b)}if(!b.addClass){b.hide=function(){this.style.display="none"};b.show=function(){this.style.display=""};b.addClass=function(a){this.removeClass(a);this.className+=" "+a};b.removeClass=function(g){var f=this.className.split(/\s+/);var a=-1;for(var h=0;h<f.length;h++){if(f[h]==g){a=h;h=f.length}}if(a>-1){f.splice(a,1);this.className=f.join(" ")}return this};b.hasClass=function(a){return !!this.className.match(new RegExp("\\s*"+a+"\\s*"))}}return b},setMoviePath:function(b){this.moviePath=b},dispatch:function(g,e,h){var f=this.clients[g];if(f){f.receiveEvent(e,h)}},register:function(c,d){this.clients[c]=d},getDOMObjectPosition:function(d,f){var e={left:0,top:0,width:d.width?d.width:d.offsetWidth,height:d.height?d.height:d.offsetHeight};while(d&&(d!=f)){e.left+=d.offsetLeft;e.top=d.offsetTop;d=d.offsetParent}return e},Client:function(b){this.handlers={};this.id=ZeroClipboard.nextId++;this.movieId="ZeroClipboardMovie_"+this.id;ZeroClipboard.register(this.id,this);if(b){this.glue(b)}}};ZeroClipboard.Client.prototype={id:0,ready:false,movie:null,clipText:"",handCursorEnabled:true,cssEffects:true,handlers:null,glue:function(i,k,h){this.domElement=ZeroClipboard.$(i);var g=99;if(this.domElement.style.zIndex){g=parseInt(this.domElement.style.zIndex,10)+1}if(typeof(k)=="string"){k=ZeroClipboard.$(k)}else{if(typeof(k)=="undefined"){k=document.getElementsByTagName("body")[0]}}var j=ZeroClipboard.getDOMObjectPosition(this.domElement,k);this.div=document.createElement("div");var l=this.div.style;l.position="absolute";l.left=""+j.left+"px";l.top=""+j.top+"px";l.width=""+j.width+"px";l.height=""+j.height+"px";l.zIndex=g;if(typeof(h)=="object"){for(addedStyle in h){l[addedStyle]=h[addedStyle]}}k.appendChild(this.div);this.div.innerHTML=this.getHTML(j.width,j.height)},getHTML:function(h,f){var i="";var j="id="+this.id+"&width="+h+"&height="+f;if(navigator.userAgent.match(/MSIE/)){var g=location.href.match(/^https/i)?"https://":"http://";i+='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="'+g+'download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="'+h+'" height="'+f+'" id="'+this.movieId+'" align="middle"><param name="allowScriptAccess" value="always" /><param name="allowFullScreen" value="false" /><param name="movie" value="'+ZeroClipboard.moviePath+'" /><param name="loop" value="false" /><param name="menu" value="false" /><param name="quality" value="best" /><param name="bgcolor" value="#ffffff" /><param name="flashvars" value="'+j+'"/><param name="wmode" value="transparent"/></object>'}else{i+='<embed id="'+this.movieId+'" src="'+ZeroClipboard.moviePath+'" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="'+h+'" height="'+f+'" name="'+this.movieId+'" align="middle" allowScriptAccess="always" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="'+j+'" wmode="transparent" />'}return i},hide:function(){if(this.div){this.div.style.left="-2000px"}},show:function(){this.reposition()},destroy:function(){if(this.domElement&&this.div){this.hide();this.div.innerHTML="";var d=document.getElementsByTagName("body")[0];try{d.removeChild(this.div)}catch(c){}this.domElement=null;this.div=null}},reposition:function(d){if(d){this.domElement=ZeroClipboard.$(d);if(!this.domElement){this.hide()}}if(this.domElement&&this.div){var e=ZeroClipboard.getDOMObjectPosition(this.domElement);var f=this.div.style;f.left=""+e.left+"px";f.top=""+e.top+"px"}},setText:function(b){this.clipText=b;if(this.ready){this.movie.setText(b)}},addEventListener:function(d,c){d=d.toString().toLowerCase().replace(/^on/,"");if(!this.handlers[d]){this.handlers[d]=[]}this.handlers[d].push(c)},setHandCursor:function(b){this.handCursorEnabled=b;if(this.ready){this.movie.setHandCursor(b)}},setCSSEffects:function(b){this.cssEffects=!!b},receiveEvent:function(i,h){i=i.toString().toLowerCase().replace(/^on/,"");switch(i){case"load":this.movie=document.getElementById(this.movieId);if(!this.movie){var j=this;setTimeout(function(){j.receiveEvent("load",null)},1);return}if(!this.ready&&navigator.userAgent.match(/Firefox/)&&navigator.userAgent.match(/Windows/)){var j=this;setTimeout(function(){j.receiveEvent("load",null)},100);this.ready=true;return}this.ready=true;this.movie.setText(this.clipText);this.movie.setHandCursor(this.handCursorEnabled);break;case"mouseover":if(this.domElement&&this.cssEffects){this.domElement.addClass("hover");if(this.recoverActive){this.domElement.addClass("active")}}break;case"mouseout":if(this.domElement&&this.cssEffects){this.recoverActive=false;if(this.domElement.hasClass("active")){this.domElement.removeClass("active");this.recoverActive=true}this.domElement.removeClass("hover")}break;case"mousedown":if(this.domElement&&this.cssEffects){this.domElement.addClass("active")}break;case"mouseup":if(this.domElement&&this.cssEffects){this.domElement.removeClass("active");this.recoverActive=false}break}if(this.handlers[i]){for(var k=0,l=this.handlers[i].length;k<l;k++){var g=this.handlers[i][k];if(typeof(g)=="function"){g(this,h)}else{if((typeof(g)=="object")&&(g.length==2)){g[0][g[1]](this,h)}else{if(typeof(g)=="string"){window[g](this,h)}}}}}}};

