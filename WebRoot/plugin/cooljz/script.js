String.prototype.trim = function() {
	 return this.replace(/^\s+|\s+$/g, '');
}

var reg_age = /^[0-9]{2}$/;
var reg_phone = /^1[0-9]{10}$/;
//请输入11位正确的手机号码！
var reg_email = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
//请输入正确的邮箱地址！
var reg_pwd = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
//密码必须同时有数字和字母，长度最小6，最大16！

function isFromPC() { 
	var sUserAgent= navigator.userAgent.toLowerCase(); 
	var bIsIpad= sUserAgent.match(/ipad/i) == "ipad"; 
	var bIsIphoneOs= sUserAgent.match(/iphone os/i) == "iphone os"; 
	var bIsMidp= sUserAgent.match(/midp/i) == "midp"; 
	var bIsUc7= sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4"; 
	var bIsUc= sUserAgent.match(/ucweb/i) == "ucweb"; 
	var bIsAndroid= sUserAgent.match(/android/i) == "android"; 
	var bIsCE= sUserAgent.match(/windows ce/i) == "windows ce"; 
	var bIsWM= sUserAgent.match(/windows mobile/i) == "windows mobile"; 
	if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) { 
		return false;
	} else { 
		return true;
	} 
}

function actMenu(index, clazz){
	jQuery('#menu'+index).addClass(clazz);
}

function getJson(json){
	var data = eval('(' + json + ')');
	return data;
}

function switchTypeLocation(obj,url){
	window.location.href = url+'?t='+jQuery(obj).val();
}

function openMobileWin(url){
	var iWidth=365; //弹出窗口的宽度;
	var iHeight=600; //弹出窗口的高度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	if(typeof mobilewindow != 'undefined'){
		mobilewindow.close();   
	}
    mobilewindow = window.open (url,'mobilewindow','height=600,width=365,top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no') 
}

function isNumeric(p) { 
	p = p.trim();
	if (/^\d+$/.test(p)){
		return true;
	}else{
		p = p*-1;
		if (/^\d+$/.test(p)){
			return true;
		}else{
			return false ;
		}
	}
}

function isFloat(p) { 
	p = p.trim();
	if (/^\d+(\.?)\d*$/.test(p)){
		return true;
	}else{
		p = p*-1;
		if (/^\d+$/.test(p)){
			return true;
		}else{
			return false ;
		}
	}
}

jQuery(function(){
	jQuery('.s-form').each(function(){
		var sFormObj = jQuery(this);
		jQuery(this).find('.s-reset').each(function(){
			jQuery(this).click(function(){
				jQuery(sFormObj).find('.s-field').each(function(){
					if(jQuery(this).attr('type') != 'hidden'){
						jQuery(this).val('');
					}
				});
			});
		});
		jQuery(this).find('.s-btn').each(function(){
			var proxy = jQuery(this).attr('proxy');
			var cbHref = jQuery(this).attr('cbhref');
			var cbalert = jQuery(this).attr('cbalert');
			var reload = jQuery(this).attr('reload');
			var top = jQuery(this).attr('top');
			var cbfail = jQuery(this).attr('cbfail');
			jQuery(this).click(function(){
				if(typeof pauseToSubmit == 'undefined' || pauseToSubmit != true){
				    // continue;
				}else{
				    pauseToSubmit = false;
				    return false;
				}
				var paramValue = '';
				var validate = true;
				jQuery(sFormObj).find('.s-field').each(function(){
				var inputType = jQuery(this).attr('type');
				if(!(typeof inputType != 'undefined' && (inputType == 'radio' || inputType == 'RADIO') && (jQuery(this).get(0).checked == false))){	
					var name = jQuery(this).attr('name');
					var value = jQuery(this).val();
					var required = jQuery(this).attr('required');
					var msg = jQuery(this).attr('msg');
					if(typeof required != 'undefined'){
						if(value.trim() == ''){
							if(typeof msg != 'undefined'){
								//alert(msg + '不能为空');
								showWarningToast(msg + '不能为空');
							}else{
								//alert(name + '不能为空');
								showWarningToast(name + '不能为空');
							}
							validate = false;
							return false;
						}
					}
					var numeric = jQuery(this).attr('numeric');
					if(typeof numeric != 'undefined'){
						if(!isNumeric(value.trim())){
							showWarningToast(msg + '只能为数字!');
							validate = false;
							return false;
						}
					}
					var floatColumn = jQuery(this).attr('float');
					if(typeof floatColumn != 'undefined'){
						if(!isFloat(value.trim())){
							showWarningToast(msg + '只能为浮点数字!');
							validate = false;
							return false;
						}
					}
					var maxLength = jQuery(this).attr('maxLength');
					if(typeof maxLength != 'undefined'){
						if(value.length > maxLength){
							showWarningToast(msg + '长度不能大于' + maxLength);
							validate = false;
							return false;
						}
					}
					var minLength = jQuery(this).attr('minLength');
					if(typeof minLength != 'undefined'){
						if(value.length < minLength){
							showWarningToast(msg + '长度不能小于' + minLength);
							validate = false;
							return false;
						}
					}
					var maxSize = jQuery(this).attr('maxSize');
					if(typeof maxSize != 'undefined'){
						if(value > maxSize){
							showWarningToast(msg + '不能大于' + maxSize);
							validate = false;
							return false;
						}
					}
					var minSize = jQuery(this).attr('minSize');
					if(typeof minSize != 'undefined'){
						if(value/1 < minSize/1){
							showWarningToast(msg + '不能小于' + minSize);
							validate = false;
							return false;
						}
					}
					var mix = jQuery(this).attr('mix');
						if(typeof mix != 'undefined'){
						var reg=new RegExp(/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/);
						if(!reg.test(value)){
							showWarningToast(msg + '必须包含字母和数字');
							validate = false;
							return false;
						}
				    }
					paramValue += (ajax_sep_param + name + ajax_sep_kv + value);
				}
				});
				if(!validate){
					return false;
				}
				var triggerBtn = jQuery(this);
				jQuery(this).attr('disabled','disabled');
				jQuery.post(contextPath+'/ajax/save.do?url='+window.location.href,{proxy:proxy,param:paramValue},function(data){
					if(data.success == true){
						if(typeof cbalert != 'undefined'){
							showSuccessToast(cbalert);
						}
						if(typeof cbHref != 'undefined'){
							if(typeof data.params != 'undefined'){
								window.location.href = cbHref+data.params;
							}else{
								window.location.href = cbHref;
							}
						}
						if(typeof reload != 'undefined'){
							if(typeof top != 'undefined'){
								setTimeout('window.top.location.reload();',1400);
							}else{
								setTimeout('window.location.reload();',1400);
							}
						}
						jQuery(sFormObj).find('.s-field').each(function(){
							if(jQuery(this).attr('type') != 'hidden'){
								jQuery(this).val('');
							}
						});
						jQuery(sFormObj).find('iframe').each(function(){
							jQuery(this).attr('src',jQuery(this).attr('src'));
						});
					}else{
						if(typeof cbfail != 'undefined'){
							showStickyErrorToast(cbfail);
						}else{
							showStickyErrorToast('系统错误');
						}
					}
					triggerBtn.attr('disabled',false);
					return false;
				})
			});
		});
	});
});