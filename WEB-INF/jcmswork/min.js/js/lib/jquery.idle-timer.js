/*!
 * jQuery idleTimer plugin
 * version 0.9.100511 => JCMS:FIX PATCH
 * by Paul Irish.
 *   http://github.com/paulirish/yui-misc/tree/
 * MIT license

 * adapted from YUI idle timer by nzakas:
 *   http://github.com/nzakas/yui-misc/
*/
(function(a){a.idleTimer=function(c,g,f){f=a.extend({startImmediately:true,idle:false,enabled:true,timeout:30000,name:"idleTimer",events:"mousemove keydown DOMMouseScroll mousewheel mousedown touchstart touchmove"},f);g=g||document;var b=function(l){if(typeof l==="number"){l=undefined}var k=a.data(l||g,f.name+"Obj");k.idle=!k.idle;var i=(+new Date())-k.olddate;k.olddate=+new Date();if(k.idle&&(i<f.timeout)){k.idle=false;clearTimeout(a.idleTimer.tId);if(f.enabled){a.idleTimer.tId=setTimeout(b,f.timeout)}return}var j=jQuery.Event(f.name+"."+a.data(g,f.name,k.idle?"idle":"active"));j.timer={target:k.target};a(g).trigger(j)},e=function(i){var j=a.data(i,f.name+"Obj")||{};j.enabled=false;clearTimeout(j.tId);a(i).off(".idleTimer")},d=function(i){var j=a.data(this,f.name+"Obj");j.target=a(i.target);clearTimeout(j.tId);if(j.enabled){if(j.idle){b(this)}j.tId=setTimeout(b,j.timeout)}};var h=a.data(g,f.name+"Obj")||{};h.olddate=h.olddate||+new Date();if(typeof c==="number"){f.timeout=c}else{if(c==="destroy"){e(g);return this}else{if(c==="getElapsedTime"){return(+new Date())-h.olddate}}}a(g).on(a.trim((f.events+" ").split(" ").join(".idleTimer ")),d);h.idle=f.idle;h.enabled=f.enabled;h.timeout=f.timeout;if(f.startImmediately){h.tId=setTimeout(b,h.timeout)}a.data(g,f.name,"active");a.data(g,f.name+"Obj",h)};a.fn.idleTimer=function(b,c){if(!c){c={}}if(this[0]){a.idleTimer(b,this[0],c)}return this}})(jQuery);