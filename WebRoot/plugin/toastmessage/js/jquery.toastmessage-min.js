(function(c){var b={inEffect:{opacity:"show"},inEffectDuration:600,stayTime:3000,text:"",sticky:false,type:"notice",position:"top-right",closeText:"",close:null};
var a={init:function(d){if(d){c.extend(b,d)
}},showToast:function(f){var g={};
c.extend(g,b,f);
var j,e,d,i,h;
j=(!c(".toast-container").length)?c("<div></div>").addClass("toast-container").addClass("toast-position-"+g.position).appendTo("body"):c(".toast-container");
e=c("<div></div>").addClass("toast-item-wrapper");
d=c("<div></div>").hide().addClass("toast-item toast-type-"+g.type).appendTo(j).html(c("<p>").append(g.text)).animate(g.inEffect,g.inEffectDuration).wrap(e);
i=c("<div></div>").addClass("toast-item-close").prependTo(d).html(g.closeText).click(function(){c().toastmessage("removeToast",d,g)
});
h=c("<div></div>").addClass("toast-item-image").addClass("toast-item-image-"+g.type).prependTo(d);
if(navigator.userAgent.match(/MSIE 6/i)){j.css({top:document.documentElement.scrollTop})
}if(!g.sticky){setTimeout(function(){c().toastmessage("removeToast",d,g)
},g.stayTime)
}return d
},showNoticeToast:function(e){var d={text:e,type:"notice"};
return c().toastmessage("showToast",d)
},showSuccessToast:function(e){var d={text:e,type:"success"};
return c().toastmessage("showToast",d)
},showErrorToast:function(e){var d={text:e,type:"error"};
return c().toastmessage("showToast",d)
},showWarningToast:function(e){var d={text:e,type:"warning"};
return c().toastmessage("showToast",d)
},removeToast:function(e,d){e.animate({opacity:"0"},600,function(){e.parent().animate({height:"0px"},300,function(){e.parent().remove()
})
});
if(d&&d.close!==null){d.close()
}}};
c.fn.toastmessage=function(d){if(a[d]){return a[d].apply(this,Array.prototype.slice.call(arguments,1))
}else{if(typeof d==="object"||!d){return a.init.apply(this,arguments)
}else{c.error("Method "+d+" does not exist on jQuery.toastmessage")
}}}
})(jQuery);


function showSuccessToast(message) {
    if(typeof jQuery().toastmessage != 'undefined'){
    	jQuery().toastmessage('showToast', {
    	    text     : message,
    	    sticky   : false,
    	    position : 'top-center',
    	    type     : 'success',
    	    closeText: '',
    	    close    : function () {
    		console.log("toast is closed ...");
    	    }
    	});
    }else{
	alert(message);
    }
}

function showStickySuccessToast(message) {
   jQuery().toastmessage('showToast', {
       text     : message,
       sticky   : true,
       position : 'top-center',
       type     : 'success',
       closeText: '',
       close    : function () {
           console.log("toast is closed ...");
       }
   });
}

function showNoticeToast(message) {
   jQuery().toastmessage('showToast', {
        text     : message,
        sticky   : false,
        position : 'top-center',
        type     : 'notice',
        closeText: '',
        close    : function () {console.log("toast is closed ...");}
   });
}

function showStickyNoticeToast(message) {
   jQuery().toastmessage('showToast', {
        text     : message,
        sticky   : true,
        position : 'top-center',
        type     : 'notice',
        closeText: '',
        close    : function () {console.log("toast is closed ...");}
   });
}

function showWarningToast(message) {
   jQuery().toastmessage('showToast', {
       text     : message,
       sticky   : false,
       position : 'top-center',
       type     : 'warning',
       closeText: '',
       close    : function () {
           console.log("toast is closed ...");
       }
   });
}

function showStickyWarningToast(message) {
   jQuery().toastmessage('showToast', {
       text     : message,
       sticky   : true,
       position : 'top-center',
       type     : 'warning',
       closeText: '',
       close    : function () {
           console.log("toast is closed ...");
       }
   });
}

function showErrorToast(message) {
   jQuery().toastmessage('showToast', {
       text     : message,
       sticky   : false,
       position : 'top-center',
       type     : 'error',
       closeText: '',
       close    : function () {
           console.log("toast is closed ...");
       }
   });
}

function showStickyErrorToast(message) {
   jQuery().toastmessage('showToast', {
       text     : message,
       sticky   : true,
       position : 'top-center',
       type     : 'error',
       closeText: '',
       close    : function () {
           console.log("toast is closed ...");
       }
   });
}

function showToastMessage(){
	var toastType = window._toastType;
	if(toastType != '' && toastType != 'null'){
		var toastMessage = window._toastMessage;
		if(toastType == 1){
			//TOAST_TYPE_SUCCESS
			showSuccessToast(toastMessage);
		}else if(toastType == 2){
			//TOAST_TYPE_SUCCESS_STICKY
			showStickySuccessToast(toastMessage);
		}else if(toastType == 3){
			//TOAST_TYPE_NOTICE
			showNoticeToast(toastMessage);
		}else if(toastType == 4){
			//TOAST_TYPE_NOTICE_STICKY
			showStickyNoticeToast(toastMessage);
		}else if(toastType == 5){
			//TOAST_TYPE_WARNING
			showWarningToast(toastMessage);
		}else if(toastType == 6){
			//TOAST_TYPE_WARNING_STICKY
			showStickyWarningToast(toastMessage);
		}else if(toastType == 7){
			//TOAST_TYPE_ERROR
			showErrorToast(toastMessage);
		}else if(toastType == 8){
			//TOAST_TYPE_ERROR_STICKY
			showStickyErrorToast(toastMessage);
		}
	}
}

jQuery(function(){
	showToastMessage();
});