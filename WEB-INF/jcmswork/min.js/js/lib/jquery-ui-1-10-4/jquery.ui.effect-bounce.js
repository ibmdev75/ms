/*!
 * jQuery UI Effects Bounce 1.10.4
 * http://jqueryui.com
 *
 * Copyright 2014 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/bounce-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
(function(a,b){a.effects.effect.bounce=function(m,l){var c=a(this),d=["position","top","bottom","left","right","height","width"],k=a.effects.setMode(c,m.mode||"effect"),j=k==="hide",v=k==="show",w=m.direction||"up",e=m.distance,h=m.times||5,x=h*2+(v||j?1:0),u=m.duration/x,p=m.easing,f=(w==="up"||w==="down")?"top":"left",n=(w==="up"||w==="left"),t,g,s,q=c.queue(),r=q.length;if(v||j){d.push("opacity")}a.effects.save(c,d);c.show();a.effects.createWrapper(c);if(!e){e=c[f==="top"?"outerHeight":"outerWidth"]()/3}if(v){s={opacity:1};s[f]=0;c.css("opacity",0).css(f,n?-e*2:e*2).animate(s,u,p)}if(j){e=e/Math.pow(2,h-1)}s={};s[f]=0;for(t=0;t<h;t++){g={};g[f]=(n?"-=":"+=")+e;c.animate(g,u,p).animate(s,u,p);e=j?e*2:e/2}if(j){g={opacity:0};g[f]=(n?"-=":"+=")+e;c.animate(g,u,p)}c.queue(function(){if(j){c.hide()}a.effects.restore(c,d);a.effects.removeWrapper(c);l()});if(r>1){q.splice.apply(q,[1,0].concat(q.splice(r,x+1)))}c.dequeue()}})(jQuery);