/**
 * Application module
 *
 * @module MSV
 * @package app
 */

MSV.namespace('admin');
MSV.admin = (function(document, $){

	//dependencies
	var sys = MSV.system,
		app = MSV.app,
		auth = MSV.auth,

	//private variable
		_content = $('.admin-page .admin-content'),
		_menu = $('.admin-page .navbar'),
		_header = $('.header'),
		_footer = $('.footer'),

		_edit_user = $('.edit-user'),

		setMenuSize = function(){
			var content_height = _content.height(),
				menu_height = _menu.height(),
				header_height = 0,
				footer_height = 0,
				viewport_height = 0,
				viewport_width = $(document).width(),
				responsive_limit = 992;

			if(viewport_width > responsive_limit) {
				//if (menu_height < content_height) {
				//	_menu.height(content_height);
				//} else {
					header_height = _header.outerHeight();
					footer_height = _footer.outerHeight();
					viewport_height = $(document).height();
					_menu.outerHeight(viewport_height - (header_height + footer_height));
				//}
			}else{
				_menu.removeAttr('style');
			}
			return this;
		},

		bindEvent = function(){

			$(window).resize(function(){ setMenuSize(); });

			if($(_edit_user).length > 0){
				$('.admin-tabs>div:not(.active)').hide();
				$(_edit_user).click(function(){
					$('.admin-tabs>div').each(function(){
						if($(this).hasClass('active')){
							$(this).removeClass('active').fadeOut('fast');
						}else{
							$(this).addClass('active').fadeIn('fast');
						}
					});
				});
			}

		};

	sys.registerAutoload(bindEvent);
	sys.registerAutoload(setMenuSize);

	//public method
	return {

	}
})(document, $);