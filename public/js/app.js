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

		//private method
		initBootstrapMaterial = function(){
			$.material.init();
		},
		bindEvent = function(){

		};

	sys.registerAutoload(initBootstrapMaterial);
	sys.registerAutoload(bindEvent);

	//public method
	return {

	}
})(document, $);