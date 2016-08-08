var FormFileUpload = function () {

    return {
        //main function to initiate the module
        init: function () {

             // Initialize the jQuery File Upload widget:
            $('#fileupload').fileupload({
                disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator.userAgent),
                maxFileSize: 5000000,
                acceptFileTypes: /(\.|\/)(jpe?g)$/i,
                autoUpload: false,
                // Uncomment the following to send cross-domain cookies:
                //xhrFields: {withCredentials: true},                
                url: contextPath+'/global/uploadFile.do',
                dataType: 'json',
       			done: function (e, data) {
					if(data.result == null){
						data.context.text('上传失败');
					}else{
						var width = data.result.width;
						var height = data.result.height;
						var path = data.result.path;
						var name = data.result.name;
						var type = data.result.type;
						var size = data.result.size;
						var imgId = 'img'+Math.ceil(100000*Math.random());
						$('.start',data.context).hide();
						$('.cancel',data.context).hide();
						$('.progress',data.context).hide();
						var block = $('<td><span class="preview"><img id="'+imgId+'" width="'+width+'" height="'+height+'" src="'+contextPath+'/upload/files/'+path+'/'+name+'?id='+Math.random()+'"></span></td><td><p class="name">'+type+'</p></td><td><p class="size">'+size+'</p></td><td class="btn-group"><button '+data.result.disabled+' class="btn purple edit btn-sm" onclick="return openImageEditWindow(\''+imgId+'\',\''+path+'\',\''+name+'\');"><i class="fa fa-external-link"></i><span> 编辑图片</span> '+data.result.disabledMsg+'</button><button class="btn red remove btn-sm" onclick="return removeImage(this,\''+path+'\',\''+name+'\');"><i class="fa fa-trash-o"></i><span> 删除图片</span></button></td>');
						$(data.context).attr('data',name);
						$(data.context).html(block);
						resetParentInputValue();
					}
					return false;
        		}
            });

                // Upload server status check for browsers with CORS support:
            if ($.support.cors) {
                $.ajax({
                    url: contextPath+'/global/uploadFile.do',
                    type: 'HEAD'
                }).fail(function () {
                    $('<div class="alert alert-danger"/>')
                        .text('Upload server currently unavailable - ' +
                                new Date())
                        .appendTo('#fileupload');
                });
            }

            // Load & display existing files:
            $('#fileupload').addClass('fileupload-processing');
            $.ajax({
                // Uncomment the following to send cross-domain cookies:
                //xhrFields: {withCredentials: true},
                url: $('#fileupload').fileupload('option', 'url'),
                dataType: 'json',
                context: $('#fileupload')[0]
            }).always(function () {
                $(this).removeClass('fileupload-processing');
            }).done(function (result) {
                $(this).fileupload('option', 'done')
                .call(this, $.Event('done'), {result: result});
            });
        },
        
        resetIframe: function(){
        	var bh = $('body').css('height');
        	$(window.parent.document).find("#multi-upload-iframe-control"+index).css('height',bh);
        },
        
        cancelHeight: function(){
        	var preHeight = $(window.parent.document).find("#multi-upload-iframe-control"+index).css('height');
        	$(window.parent.document).find("#multi-upload-iframe-control"+index).css('height',(preHeight.replace('px','')-97)+'px');
        	setTimeout('FormFileUpload.resetIframe()',700);
        }

    };

}();