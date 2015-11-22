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
		app = MSV.app,

		//private variable
		_forgot_password = $('.forgot-password'),
		_forgot_password_notify = $('.forgot-password-notify'),

		_login_input = $('input#login:not(.no-check)'),
		_email_input = $('input#email:not(.no-check)'),
		_pass_input = $('input#password:not(.no-check)'),
		_conf_pass_input = $('input#confirm_password:not(.no-check), input#cpassword:not(.no-check)'),

		check_url = {
			'login': '/auth/checklogin/',
			'email': '/auth/checkemail/'
		},

	//private method
			checkLogin = function(){
				var value = _login_input.val();
				if(value !== ''){
					checkLoginEmail('login', value, function(response){
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
					checkLoginEmail('email', value, function(response){
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

		//private method
		checkLoginEmail = function(what, data, callback){
			if(typeof data !== 'undefined' && data !== '' && typeof check_url[what] !== 'undefined'){
				$.ajax({
					url: check_url[what],
					type: 'POST',
					dataType: 'json',
					data: {
						data: data
					},
					success: function(response){
						if(typeof callback === 'function'){
							callback(response);
						}
					}
				});
			}else
				return false;
		},
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

	//public method
	return {
		check: checkLoginEmail
	}
})(document, $);