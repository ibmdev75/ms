!function(d){var b=function(){d(document).on("jalios:broker",f);d(document).on("click",".popup-lg",e)};var c=/popup-lg/i;var f=function(h){var g=d.jalios.Event.match(h,"broker",c,true,true);if(!g){return}var i=g.source.currentTarget;a(i,g.options)};var e=function(g){g.preventDefault();g.stopPropagation();g.stopImmediatePropagation();a(g.currentTarget)};var a=function(k,i){var h=d(k);var g=h.attr("data-jalios-url")||h.prop("href");var j=h.attr("title")||"Popup";d.jalios.Browser.popupWindow(g,j,900,600,true,true,true,false)};if(!d.jalios){d.jalios={}}d.jalios.Browser={isIE:function(g){if(!g){return d.browser.msie}return d.browser.msie&&g<=parseInt(d.browser.version,10)},isMobileSafari:function(){return/Apple.*Mobile/.test(navigator.userAgent)},reload:function(g){return d.jalios.Browser.redirect(false,g)},redirect:function(g,m,i){try{var k=m?window.opener:window;if(k.parent&&!k.tinyMCEPopup){try{k.parent.document;k=k.parent}catch(h){}}var j=k.document;var l=j.location;if(!g||l.href==g){l.reload(true)}else{if(typeof i==="undefined"||i){g=JCMS.Security.getUrlWithCSRFToken(g)}l.href=g}}catch(h){d.console.warn("Popup.redirect",h,h.message)}},popup:function(g,i,h){if(i){i=i.replace(new RegExp("[^a-zA-Z0-9_]+","img"),"");i=i.substr(0,48)}window.open(g,i,h);return false},popupWindow:function(j,q,s,n,m,i,o,r,k,t){if(!m){m="no"}if(!s){s=320}if(!n){n=260}i="resizable="+(d.jalios.Common.toBoolean(i,true)?"yes":"no");o="scrollbars="+(d.jalios.Common.toBoolean(o,true)?"yes":"no");if(r==undefined){r=true}if(!navigator.jalios){navigator.jalios=new Object()}var g=navigator.jalios.popupWindow;if(!k){k=window}if(q){q=q.replace(new RegExp("[^a-zA-Z0-9_]+","img"),"");q=q.substr(0,48)}if(!q&&!k.opener){q="_blank"}else{if(!r&&g){navigator.jalios.popupCounter=navigator.jalios.popupCounter?navigator.jalios.popupCounter+1:1;q=q+"_"+navigator.jalios.popupCounter}}if(r&&g&&g.close){g.close()}try{var l="status="+m+",width="+s+",height="+n+",menubar=no,"+i+","+o;navigator.jalios.popupWindow=k.open(j,q,l);d.console.debug("Popup","popupWindow",j,l);g=navigator.jalios.popupWindow;if(!g){alert(I18N.glp("warn.popup.blocker"))}}catch(p){alert(I18N.glp("warn.popup.blocker"))}k.callback=t?function(h){t.apply(this,$A(h))}:false;k.callbackLinkId=this.tagName?d(this).identify():false;if(g&&g.focus){g.focus()}return false},callback:function(){var h=window.opener||window.parent;if(!h){return false}if(h.callback){h.callback(arguments);return true}if(!h.callbackLinkId){return false}var g=d.Event("jalios:popup");g.popup={};g.popup.type="callback";g.popup.linkId=linkId;g.popup.args=arguments;d(h.document).trigger(g);return true},autoResize:function(j,i,o){if(!i){i=55}if(!o){o=50}var k=window.screenLeft?window.screenLeft:window.screenX;var m=window.screenTop?window.screenTop:window.screenY;var h=d(window);var l=h.height();var g=d(j).bounds();var n=g.height+i;n=Math.min(n,self.screen.availHeight);if(m&&(n+m>self.screen.availHeight)){n=self.screen.availHeight-m}window.resizeTo(h.width(),Math.max(o,n))},isInPopup:function(){return !(opener==undefined)}};d(document).ready(function(g){b()})}(window.jQuery);window.Popup={reload:jQuery.jalios.Browser.reload,redirect:jQuery.jalios.Browser.redirect,encode:jQuery.jalios.Http.encode,callback:jQuery.jalios.Browser.callback,popupWindow:jQuery.jalios.Browser.popupWindow,popupEvent:function(){jQuery.console.error("[Deprecated] popupEvent() Should use jQuery.jalios.Browser.popup")},autoResize:jQuery.jalios.Browser.autoResize,isInPopup:jQuery.jalios.Browser.isInPopup};