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
        _date = $('.relativetime'),
		//private method
		bootstrapInputState = function($input, mode, message){
			var parent = false,
				mes_cont = '';

			if(typeof $input !== 'object' && typeof $input !== 'function')
				return false;

			if(typeof message !== 'undefined' && message !== '')
				mes_cont = '<span class="help-block">' + message + '</span>';

			parent = $($input).closest('.form-group');
			if(typeof mode !== 'undefined' && mode !== ''){
				parent.removeClass('has-warning has-error has-success');
				$($input).next('span').remove();
				switch(mode){
					case 'success':
						parent.addClass('has-success');
						$($input).after(mes_cont);
						break;
					case 'error':
						parent.addClass('has-error');
						$($input).after(mes_cont);
						$($input).focus();
						break;
					case 'warning':
						parent.addClass('has-warning');
						$($input).after(mes_cont);
						break;
					default :
						break;
				}
			}else{
				parent.removeClass('has-warning has-error has-success');
				$($input).next('span').remove();
			}
		},
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
        zipDate=function(){
            var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
            if (_date.length > 1) {
                for (var i = 0; i < _date.length; i++) {
                    var date = new Date(_date[i].innerHTML);
                    console.log(date.getDay());
                    _date[i].innerHTML = monthNames[date.getMonth()] + ' ' + date.getDate() + ' at ' + date.getHours() + ':' + date.getMinutes();
                }
            }
            else{
                var date = new Date(_date.text());
                _date.text(monthNames[date.getMonth()] + ' ' + date.getDate() + ' at ' + date.getHours() + ':' + date.getMinutes());
            }
        },
		bindEvent = function(){

		};

	sys.registerAutoload(initBootstrapMaterial);
	sys.registerAutoload(bindEvent);
	sys.registerAutoload(fixedHeader);

    if(_date.length>0) {
        sys.registerAutoload(zipDate);
    }

	//public method
	return {
		state: bootstrapInputState
	}
})(document, $);