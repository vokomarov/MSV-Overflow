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

		_login_input = $('input#login'),
		_email_input = $('input#email'),
		_pass_input = $('input#password'),
		_conf_pass_input = $('input#confirm_password'),

		//private method
		checkLogin = function(){
			var value = _login_input.val();
			if(value !== ''){
				auth.check('login', value, function(response){
					if(response.hasOwnProperty('status') && response.status === 'success'){
						app.state(_login_input, 'success');
					}else{
						app.state(_login_input, 'error', 'Your login already registered. Please, try other login');
					}
				});
			}else{
				app.state(_login_input);
			}
		},
		checkEmail = function(){
			var value = _email_input.val();
			if(value !== ''){
				auth.check('email', value, function(response){
					if(response.hasOwnProperty('status') && response.status === 'success'){
						app.state(_email_input, 'success');
					}else{
						app.state(_email_input, 'error', 'Your email already registered. Please, try other email');
					}
				});
			}else{
				app.state(_email_input);
			}
		},
		checkPass = function(){
			var pass = _pass_input.val(),
				cpass = _conf_pass_input.val();
			if(cpass != '')
				if(pass !== cpass){
					app.state(_conf_pass_input, 'error', 'Password not equal.');
				}else{
					app.state(_conf_pass_input, 'success');
				}
			else
			app.state(_conf_pass_input);

		},
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

			_login_input.change(function(){
				checkLogin();
			});

			_email_input.change(function(){
				checkEmail();
			});

			_pass_input.change(function(){
				checkPass();
			});
			_conf_pass_input.change(function(){
				checkPass();
			});

		};

	sys.registerAutoload(bindEvent);
	sys.registerAutoload(setMenuSize);

	//public method
	return {

	}
})(document, $);