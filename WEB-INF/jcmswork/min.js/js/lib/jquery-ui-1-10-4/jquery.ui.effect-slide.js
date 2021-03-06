/*!
 * jQuery UI Effects Slide 1.10.4
 * http://jqueryui.com
 *
 * Copyright 2014 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/slide-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
(function(a,b){a.effects.effect.slide=function(e,i){var f=a(this),k=["position","top","bottom","left","right","width","height"],j=a.effects.setMode(f,e.mode||"show"),m=j==="show",l=e.direction||"left",g=(l==="up"||l==="down")?"top":"left",d=(l==="up"||l==="left"),c,h={};a.effects.save(f,k);f.show();c=e.distance||f[g==="top"?"outerHeight":"outerWidth"](true);a.effects.createWrapper(f).css({overflow:"hidden"});if(m){f.css(g,d?(isNaN(c)?"-"+c:-c):c)}h[g]=(m?(d?"+=":"-="):(d?"-=":"+="))+c;f.animate(h,{queue:false,duration:e.duration,easing:e.easing,complete:function(){if(j==="hide"){f.hide()}a.effects.restore(f,k);a.effects.removeWrapper(f);i()}})}})(jQuery);