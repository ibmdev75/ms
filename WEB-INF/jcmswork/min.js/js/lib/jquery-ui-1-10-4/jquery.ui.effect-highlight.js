/*!
 * jQuery UI Effects Highlight 1.10.4
 * http://jqueryui.com
 *
 * Copyright 2014 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/highlight-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
(function(a,b){a.effects.effect.highlight=function(h,c){var e=a(this),d=["backgroundImage","backgroundColor","opacity"],g=a.effects.setMode(e,h.mode||"show"),f={backgroundColor:e.css("backgroundColor")};if(g==="hide"){f.opacity=0}a.effects.save(e,d);e.show().css({backgroundImage:"none",backgroundColor:h.color||"#ffff99"}).animate(f,{queue:false,duration:h.duration,easing:h.easing,complete:function(){if(g==="hide"){e.hide()}a.effects.restore(e,d);c()}})}})(jQuery);