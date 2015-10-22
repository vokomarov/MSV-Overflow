/**
 * Application module
 *
 * @module MSV
 * @package auth
 */

MSV.namespace('auth');
MSV.auth = (function(document, $){

		//dependencies
	var sys = MSV.system,

		//private variable
		_forgot_password = $('.forgot-password'),
		_forgot_password_notify = $('.forgot-password-notify'),

		//private method
		bindEvent = function(){
			_forgot_password.click(function(e){
				var next_location = $(this).attr('href');
				$(_forgot_password_notify).removeClass('hidden');
				setTimeout(function(){
					window.location.href = next_location;
				}, 2000);
				e.preventDefault();
				return false;
			});
		};

	sys.registerAutoload(bindEvent);

	//public method
	return {

	}
})(document, $);