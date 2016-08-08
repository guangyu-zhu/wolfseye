/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'zh-cn';
	//config.uiColor = '#404040';
	// config.width = '100%';
	config.width = 940;
	config.height = 350;
	config.image_previewText = " ";
	config.font_names = '黑体/黑体;微软雅黑/微软雅黑;幼圆/幼圆;' + config.font_names;
	config.toolbarGroups = [
	                        { name: 'document',    groups: [ 'mode', 'document', 'doctools' ] },
	                        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
	                        { name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align' ] },
	                        { name: 'links' },
	                        { name: 'insert' },
	                        { name: 'styles' },
	                        { name: 'colors' }
	                    ];
};
