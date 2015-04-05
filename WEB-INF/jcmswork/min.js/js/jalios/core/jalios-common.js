!function(g){if(!g.jalios){g.jalios={}}var m=/ID_([^ ]+)/;var h=/USAGE_([^ ]+)/;var a=g.Callbacks();var l=function(){g.console.info("[Common] Initializing Idle Timer: 8000ms");g(document).idleTimer(8000,{name:"Notifier"});g(document).on("Notifier.idle",function(){g.jalios.Common.idle=true});g(document).on("Notifier.active",function(){g.jalios.Common.idle=false;a.fire();a.empty()})};var i=function(){g(document).on("focusin",function(){g.jalios.DOM.hasFocus=true});g(document).on("focusout",function(){g.jalios.DOM.hasFocus=false})};var k=false;var c=false;var f=function(){g(document).on("jalios:refresh",function(o){var n=g.jalios.Event.match(o,"refresh","after");if(!n){return}if(!n.target){return}elementQuery()});g(document).on("show.bs.collapse",function(n){setTimeout(elementQuery,200)});g(document).on("shown.bs.tab",function(n){setTimeout(elementQuery,200)});g(document).on("shown.bs.modal",function(n){setTimeout(elementQuery,200)});g(document).on("jalios:broker",function(o){var n=g.jalios.Event.match(o,"broker",/toggle/i,true);if(!n){return}var p=n.source.currentTarget;if(g(p).is(":visible")){setTimeout(elementQuery,200)}});elementQuery()};var j=function(){g(document).on("click","A",function(p){var o=g(p.currentTarget);var n=o.attr("href");if(n&&n.endsWith("#")){p.preventDefault()}})};Function.prototype.defer=function(){var n=this,o=Array.prototype.slice.call(arguments,0);return window.setTimeout(function(){return n.apply(n,o)},0.01)};Function.prototype.delay=function(p){var n=this,o=Array.prototype.slice.call(arguments,1);var q=function(){return n.apply(n,o)};return window.setTimeout(q,p*1000)};Function.prototype.postpone=function(p){var n=this,o=Array.prototype.slice.call(arguments,1);var q=function(){return n.apply(n,o)};if(!g.jalios.DOM.hasFocus){a.add(q);return}if(g.jalios.Common.idle){a.add(q);return}return window.setTimeout(q,p*1000)};if(typeof String.prototype.endsWith!=="function"){String.prototype.endsWith=function(n){return this.indexOf(n,this.length-n.length)!==-1}}g.jalios.Common={idle:false,strip:function(o,n){o=o.replace(/^\s+|\s+$/g,"");if(!n){o=o.replace(/(\s)\s*/g,"$1")}return o},blank:function(n){return !n||!/\S/.test(n)},inject:function(o,n,p){g.each(o,function(q,r){n=p(n,r,q)});return n},toBoolean:function(o,n){if(typeof o=="boolean"){return o}if(o=="false"||o=="no"){return false}if(o=="true"||o=="yes"){return true}return n},shakeIE:function(){}};var e=function(){var n=g("body").attr("data-jalios-pack-version");var o="js/jalios/core/jalios-properties-js.jsp"+(n?("?v="+n):"");g.console.info("[Common] Load JavaScript properties ... "+o);g.ajax({url:o,dataType:"script",cache:true,async:false})};e();g.jalios.Properties={get:function(n){if(!JCMS_Properties){return null}return JCMS_Properties[n]}};g.jalios.Event={match:function(p,n,r,o,s){if(!p||!p[n]){return false}var q=p[n];if(r){if(!q.type){return false}if(!q.type.match(r)){return false}}if(o){p.stopPropagation()}if(s){p.stopImmediatePropagation()}return q}};g.jalios.Http={decode:function(n){return decodeURIComponent(n.replace(/\+/g," "))},encode:function(n){return encodeURIComponent(n)},toQueryParams:function(p,o){if(!p){return{}}p=g.jalios.Common.strip(p);if(p.indexOf("=")<0){return{}}var n=p.match(/([^?#]*)(#.*)?$/);if(!n){return{}}return g.jalios.Common.inject(n[1].split(o||"&"),{},function(s,t){if((t=t.split("="))[0]){var q=decodeURIComponent(t.shift()),r=t.length>1?t.join("="):t[0];if(r!=undefined){r=g.jalios.Http.decode(r)}if(q in s){if(!g.isArray(s[q])){s[q]=[s[q]]}s[q].push(r)}else{s[q]=r}}return s})},getBaseUrl:function(){if(!k){k=g("BASE").prop("href")}return k||""},getContextPath:function(){if(!c){c=document._contextPath}return c||""},getUrlWithUpdatedParam:function(p,r,q){var o=p.toString();re1=new RegExp("([^?]*\\?.*)("+r+"=[^&]*&?)(.*)","i");re2=new RegExp("([^?]*\\?)(.*)","i");re3=new RegExp("([^?]*)","i");var n=q;if(n){n=g.jalios.Http.encode(n)}if(o.search(re1)!=-1){if(q){o=o.replace(re1,"$1"+r+"="+n+"&$3")}else{o=o.replace(re1,"$1$3")}}else{if(o.search(re2)!=-1){if(q){o=o.replace(re2,"$1"+r+"="+n+"&$2")}else{o=o.replace(re2,"$1$2")}}else{if(q){o=o.replace(re3,"$1?"+r+"="+n)}else{o=o.replace(re3,"$1")}}}return o}};g.jalios.Ajax={_fixHeader:function(o){o.headers=o.headers||{};var n=document.body.id;if(n){o.headers["X-Jcms-Ajax-Id"]=n}var q=g("#AjaxCtxtDeflate");if(q.exists()&&!g.jalios.Browser.isMobileSafari()){o.headers["X-Jcms-Ajax-Deflate"]=q.html()}var p=g("#CSRFTokenElm");if(p.exists()){o.headers["X-Jcms-CSRF-Token"]=p.html()}},_fixWait:function(n,q,o){var p=n.beforeSend;var r=n.complete;n.beforeSend=function(){g.jalios.Ajax.wait(true);if(p){p()}};n.complete=function(){g.jalios.Ajax.wait(false);if(r){r()}}},wait:function(u,n){var o=parent?parent:window;var t="";var q="";var p=g("BODY");var s=g("#ajax-wait");if(!s.exists()){var v=g.jalios.I18N.glp("info.msg.loading");s=g('<div id="ajax-wait" class="hide">'+v+"</div>").appendTo(p)}if(u){t="wait";q=I18N.glp("info.msg.loading");s.removeClass("hide")}else{s.addClass("hide")}try{if(o.status){o.status=q}}catch(r){}if(n){g(n).css("cursor",t)}p.css("cursor",t)},_history:function(){if(typeof(History)=="undefined"||typeof(History.getState)=="undefined"){return}if(typeof(window.history)=="undefined"||typeof(window.history.pushState)=="undefined"){g.console.debug("[Common] [History] No History. Stop using outdated browser without modern feature.");return}g.console.debug("[Common] [History] Initializing History");g.jalios.Ajax._histIntercept=true;g.jalios.Ajax._histIdx=0;var o=function(r){if(!r){g.console.debug("[Common] [History] Skip statechange missing state data");return}if(!g.jalios.Ajax._histIntercept){g.console.debug("[Common] [History] Skip statechange we triggered",r);g.jalios.Ajax._histIntercept=true;return}if(!r.data||!r.data.url||!r.data.target){var p=g(History.getStateByIndex(0).data.target);if(p.exists()){g.console.debug("[Common] [History] Revert to initial state, by refreshing target",p,r);p.refresh({params:{historyRevertToInitialState:true},nohistory:true});return}g.console.debug("[Common] [History] Skip statechange without original first history target",r);return}var q=jQuery.Event("jalios:history");q.history={};q.history.data=r.data;g(document).trigger(q);g.console.debug("[Common] [History] Revert to state by refreshing target",r.data.target,r);g.jalios.AjaxRefresh.refresh(r.data.url,r.data.target,g.extend({},r.data.options,{nohistory:true}))};var n=History.getState();if(n&&n.data&&n.data.target){g.console.debug("[Common] [History] Revert to last state in previous page",n);o(n)}History.Adapter.bind(window,"statechange",function(){var p=History.getState();o(p)});g(document).on("jalios:refresh",function(r){var q=g.jalios.Event.match(r,"refresh","success");if(!q){return}if(q.options.nohistory){return}if(q.callback){return}q.options.nohistory=true;q.options.target=false;var s={url:q.url,target:q.target.identify().map(function(){return"#"+g(this).attr("id")}).get().join(","),options:q.options};var p=History.getStateByIndex(0);if(p&&p.data&&!p.data.target){g.console.debug("[Common] [History] Update initial state with first portlet being modified",s.target);p.data.target=s.target}g.jalios.Ajax.addHistory(s)})},addHistory:function(o){if(typeof(History)=="undefined"||typeof(History.getState)=="undefined"){return}g.jalios.Ajax._histIdx++;var n=document.location.href.replace(document.location.hash,"");var p=g.jalios.Http.getUrlWithUpdatedParam(n,"histstate",g.jalios.Ajax._histIdx);g.jalios.Ajax._histIntercept=false;g.console.debug("[Common] [History] Adding History Entry",o,p);History.pushState(o,document.title,p)}};var d=/^\W*return\W*false\W*$/i;g.jalios.DOM={_resources:{},markResource:function(n){if(g.jalios.DOM._resources[n]){return false}g.jalios.DOM._resources[n]=true;return true},markResources:function(){g.each(arguments,function(n,o){g.jalios.DOM.markResource(o)})},loadStyleSheet:function(s,r,p){if(!g.jalios.DOM.markResource(s)){g.console.info("StyleSheet already imported: ",s);return false}g.console.info("Import StyleSheet",s,p);r=r||"all";s+=p?("?v="+p):"";var o=document.getElementsByTagName("head")[0];var q=document.createElement("link");q.href=s;if(r=="prefetch"){q.rel="prerender prefetch"}else{q.type="text/css";q.rel="stylesheet";q.media=r}o.appendChild(q);if(g.jalios.Browser.isIE){var n=function(){g("BODY").toggleClass("fixIERenderingBugOnDynamicCssLoad")};n.defer()}return true},loadJavaScript:function(o,n){g.jalios.DOM._loaded++;if(!g.jalios.DOM.markResource(o)){g.console.info("JavaScript already imported: ",o);g.jalios.DOM._loadReady.defer(o);return false}g.console.info("Import JavaScript",o,n);g.ajaxQueue({url:o,dataType:"script",cache:true}).always(function(p){g.jalios.DOM._loadReady.defer(o)});return true},_loaded:0,_loadTrigger:g.Callbacks(),_loadReady:function(o){g.jalios.DOM._loaded--;if(g.jalios.DOM._loaded>0){return}g.jalios.DOM._loadTrigger.fire();g.jalios.DOM._loadTrigger.empty();var n=jQuery.Event("jalios:ready");g(document).trigger(n)},_loadRegister:function(n){g.jalios.DOM._loadTrigger.add(n)},hasFocus:true,follow:function(q,s,u,r){if(!q){return}var o=g(q);if(!o.exists()){return}var v=g.Event("click");v.which=1;v.skip=s;var t=o.attr("onclick");if(t&&d.test(t)){o.prop("onclick",null)}if(!u||!r){o.trigger(v);if(v.isDefaultPrevented()){return}}var n=o.prop("href");if(n&&u&&r){o.attr("href",g.jalios.Http.getUrlWithUpdatedParam(n,u,r))}var w=o.closest("FORM");if(w.exists()){}o.trigger(v);if(v.isDefaultPrevented()){return}var n=o.prop("href");if(n){var p=o.attr("target");if(p){g.jalios.Browser.popup(n,o.attr("title"))}else{g.jalios.Browser.redirect(n)}return}if(o.attr("type")=="submit"){var w=o.closest("FORM");w.append('<input type="hidden" name="'+o.attr("name")+'" value="'+o.attr("value")+'" />');w.submit()}},isInIFrame:function(){return window!=top},registerIFrame:function(){g.jalios.DOM.setupIFrame();g(document).on("jalios:refresh",g.jalios.DOM.setupIFrame)},setupIFrame:function(p){var n=g(document);if(p){var o=g.jalios.Event.match(p,"refresh","after");if(!o||!o.$target){return}n=o.$target}n.find('IFRAME[height="100%"]').each(function(){g.jalios.DOM.resizeIframeToViewport.defer(g(this))}).load(function(){g.jalios.DOM.resizeIframeToViewport.defer(g(this))})},resizeIframeToViewport:function(p,o){if(!p||!p.exists()){return}var r=o||400;var n=r;try{n=p.contents().find("BODY").css("height","auto").outerHeight()+20}catch(q){}n=r!==-1?Math.min(r,n):n;p.css("height",n+"px")}};g.fn.exists=function(){return this.length>0};g.fn.identify=function(p,o){var n=0;p=p||"jq";return this.each(function(){if(g(this).attr("id")){if(o){var q=new Date().getTime();g(this).attr("id",p+"_"+q)}return}do{n++;var r=p+"_"+n}while(g("#"+r).length>0);g(this).attr("id",r)})};g.fn.findNext=function(n){return this.nextAll().find(n)};g.fn.findPrev=function(n){return this.prevAll().find(n)};g.fn.matchClass=function(o,p){var p=p||1;var n=[];this.each(function(){var r=g(this).attr("class");if(!r){return}var t=r.split(/\s+/);for(var s=0;s<t.length;s++){o.compile(o);var q=o.exec(t[s]);if(q&&q.length>p){n.push(q[p])}}});return n};g.fn.updateClass=function(n){if(!n){return}var n=n.split(" ");return this.each(function(){var s=g(this);var p=s.attr("class");for(var q=0;q<n.length;q++){if(b.test(n[q])){var o=b.exec(n[q]);var r=new RegExp(o[1]+"\\d+");var t=p.match(r);s.removeClass(""+t)}s.addClass(n[q])}})};var b=/(([\w_-])+(-+))(\d)+/;g.fn.serializeObject=function(p){var q={};var n=this.serializeArray();g.each(n,function(){if(p&&p[this.name]===undefined){return}if(q[this.name]!==undefined){if(!q[this.name].push){q[this.name]=[q[this.name]]}q[this.name].push(this.value||"")}else{q[this.name]=this.value||""}});return g.extend(true,{},p,q)};g.fn.populate=function(n){var o=g(this);g.each(n,function(p,q){g("[name="+p+"]",o).val(q)})};g.fn.named=function(o){var n="[name="+o.join("],[name=")+"]";return g(this).find(n)};g.fn.isPortlet=function(){if(!g(this).hasClass("Portlet")){return false}var o=0,n=this.length;for(;o<n;o++){if(this[o].className=="Portlet"){continue}if(this[o].className.match(m)){return true}}return false};g.fn.getJcmsId=function(n){var r=0,o=this.length;for(;r<o;r++){var s=g(this[r]);if(s.attr("data-jalios-id")){return s.attr("data-jalios-id")}if(n){return}var q=s.attr("class");if(!q){continue}var p=q.match(m);if(p){return p[1]}}return false};g.fn.getUsage=function(){var q=0,n=this.length;for(;q<n;q++){var p=this[q].className;if(!p){continue}var o=p.match(h);if(o){return o[1]}}return false};g.fn.bounds=function(){var n=this,o=n[0];if(!o){return}var p=n.offset(),q={width:o.offsetWidth,height:o.offsetHeight,left:0,top:0,right:0,bottom:0,x:0,y:0};q.left=p.left;q.top=p.top;q.right=(q.left+q.width);q.bottom=(q.top+q.height);q.x=q.left;q.y=q.top;q.inner={width:n.width(),height:n.height()};g.extend(q,{toString:function(){var r=this;return"x: "+r.x+" y: "+r.y+" width: "+r.width+" height: "+r.height+" right: "+r.right+" bottom: "+r.bottom}});return q};g.fn.max=function(n){return Math.max.apply(null,this.map(function(o,p){return n.apply(p)}).get())};g(document).ready(function(n){n.console.info("[Common] Initializing jalios-common.js");l();i();f();n.ajaxPrefilter(n.jalios.Ajax._fixHeader);n.ajaxPrefilter(n.jalios.Ajax._fixWait);j();n.jalios.DOM.registerIFrame();n.jalios.Ajax._history()})}(window.jQuery);