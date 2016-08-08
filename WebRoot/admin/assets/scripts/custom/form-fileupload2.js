var FormFileUpload = function () {

    return {
        //main function to initiate the module
        init: function () {

             // Initialize the jQuery File Upload widget:
            $('#fileupload').fileupload({
                disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator.userAgent),
                maxFileSize: 5000000,
                autoUpload: false,
                // Uncomment the following to send cross-domain cookies:
                //xhrFields: {withCredentials: true},                
                url: contextPath+'/global/uploadFile.do',
                dataType: 'json',
       			done: function (e, data) {
					if(data.result == null){
						data.context.text('上传失败');
					}else{
						var path = data.result.path;
						var name = data.result.name;
						var type = data.result.type;
						var size = data.result.size;
						$('.start',data.context).hide();
						$('.cancel',data.context).hide();
						$('.progress',data.context).hide();
						var block = $('<td><span class="preview"><a href="'+contextPath+'/upload/files/'+path+'/'+name+'">'+name+'</a></span></td><td><p class="name">'+type+'</p></td><td><p class="size">'+size+'</p></td><td class="btn-group"><button class="btn red remove btn-sm" onclick="return removeImage(this,\''+path+'\',\''+name+'\');"><i class="fa fa-trash-o"></i><span> 删除文件</span></button></td>');
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