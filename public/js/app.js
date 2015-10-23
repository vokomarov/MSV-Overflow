/**
 * Application module
 *
 * @module MSV
 * @package app
 */

MSV.namespace('app');
MSV.app = (function(document, $){

		//dependencies
	var sys = MSV.system,

		//private variable
		_header = $('.header'),

		//private method
		initBootstrapMaterial = function(){
			$.material.init();
		},
		fixedHeader = function(){
			var header_height = _header.outerHeight(),
				scroll = 0,
				viewport_width = $(document).width(),
				responsive_limit = 768;
			$(document).scroll(function(){
				viewport_width = $(document).width();
				if(viewport_width > responsive_limit) {
					scroll = $(document).scrollTop();
					if (scroll > header_height) {
						_header.addClass('fixed');
					} else {
						_header.removeClass('fixed');
					}
				}
			});
		},
		bindEvent = function(){

		};

	sys.registerAutoload(initBootstrapMaterial);
	sys.registerAutoload(bindEvent);
	sys.registerAutoload(fixedHeader);

	//public method
	return {

	}
})(document, $);