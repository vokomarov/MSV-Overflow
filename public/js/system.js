/**
 * Main javascript module
 *
 * @module MSV
 * @package main
 */

"use strict";

var MSV = MSV || {};

MSV.namespace = function(ns_string){
	var parts = ns_string.split('.'),
		parent = MSV,
		i;
	// strip redundant leading global
	if(parts[0] === "MSV"){
		parts = parts.slice(1);
	}
	for(i = 0; i < parts.length; i += 1){
		// create a property if it doesn't exist
		if(typeof parent[parts[i]] === "undefined"){
			parent[parts[i]] = {};
		}
		parent = parent[parts[i]];
	}
	return parent;
};

/**
 * System method, variable and config
 */
MSV.namespace('system');
MSV.system = (function(document, $){

	//private var
	var name = 'MSV overflow',
		version = '1.0.0',
		autoload = [],

	//private method
		autoLoad = function(){
			var count = autoload.length,
				counter;

			if(count > 0){
				logged('Autoload started');
				for(counter = 0; counter < count; counter +=1){
					if(typeof autoload[counter].function === 'function'){
						if(autoload[counter].params === null) {
							autoload[counter].function.apply(window);
						}else{
							autoload[counter].function.apply(window, autoload[counter].params);
						}
					}
				}
				logged('Autoload loaded '+count+' functions');
			}

			return this;
		},
		addOnLoad = function(func, params){
			var params_array = params || null;
			if(typeof func === 'function'){
				autoload.push({'function':func, 'params': params_array});
			}
			return this;
		},
		onLoad = function(){
			$(document).ready(function(){
				logged('Started');
				autoLoad();
				return this;
			});
		},
		logged = function(input){
			var now = new Date(),
				data = input || version;
			if(data){
				window.console.log(name + '[' + now.getHours() + ':' + now.getMinutes() + ':' + now.getSeconds() + '] :', data);
			}
			return this;
		};

	//public method
	return {
		onLoad: onLoad,
		log: logged,
		registerAutoload: addOnLoad
	}

})(document, $);
MSV.system.onLoad();