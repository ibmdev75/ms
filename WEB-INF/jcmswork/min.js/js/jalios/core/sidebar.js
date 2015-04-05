(function(b,c){var a=function(e,d){this.$sidebar=c(e);this.$body=c(document.body);this.$content=this.$body.find(".jsc-sidebar-content");this.sidebarW=this.$sidebar.width();this.opts=d;this.meta=this.$sidebar.data("sidebar-options")};a.prototype={defaults:{trigger:null,scrollbarDisplay:false,pullCb:function(){},pushCb:function(){}},init:function(){this.config=c.extend({},this.defaults,this.opts,this.meta);this.$trigger=this.config.trigger?this.$body.find(this.config.trigger):this.$body.find(".jsc-sidebar-trigger");this.detect3dEnabled();this.attachEvent();return this},pushTransitionEndEvent:"transitionEnd.push webkitTransitionEnd.push transitionend.push msTransitionEnd.push",pullTransitionEndEvent:"transitionEnd.pull webkitTransitionEnd.pull transitionend.pull msTransitionEnd.pull",isAndroid:function(){var d=(b.navigator.userAgent).toLowerCase(),e=d.indexOf("android")>-1;return e},hasTranslate3dSupport:function(){var g=document.createElement("p"),e,f={transform:"transform",webkitTransform:"-webkit-transform",MozTransform:"-moz-transform",msTransform:"-ms-transform"};this.$body[0].insertBefore(g,null);for(var d in f){if(g.style[d]!==undefined){g.style[d]="translate3d(1px, 1px, 1px)";e=b.getComputedStyle(g).getPropertyValue(f[d])}}this.$body[0].removeChild(g);return(e!==undefined&&e.length&&e!=="none")},detect3dEnabled:function(){if(this.isAndroid()||!this.hasTranslate3dSupport()){this.$content.removeClass("jsc-sidebar-pulled")}},attachEvent:function(){this.$trigger.on("click",c.proxy(function(d){d.preventDefault();this.push()},this));this.$content.on(this.pushTransitionEndEvent,c.proxy(function(){this.detectPushEnd();this.config.pushCb()},this)).on("click",c.proxy(function(){this.pull()},this))},push:function(){if(this.isAndroid()||!this.hasTranslate3dSupport()){this.slidePush()}else{this.$content.removeClass("jsc-sidebar-pull-end").addClass("jsc-sidebar-pushed")}},pull:function(){if(this.isAndroid()||!this.hasTranslate3dSupport()){this.slidePull()}else{if(!this.$content.hasClass("jsc-sidebar-push-end")){return}this.$content.removeClass("jsc-sidebar-pushed")}},slidePull:function(){if(this.$content.data("sidebar-first-click")!==1||!(this.$content.hasClass("jsc-sidebar-opened"))){return}this.$content.stop().animate({marginLeft:0}).promise().done(c.proxy(function(){this.$content.removeClass("jsc-sidebar-opened");!this.config.scrollbarDisplay&&this.$content.removeClass("jsc-sidebar-scroll-disabled");this.config.pullCb()},this))},slidePush:function(){var d=this.sidebarW+"px";this.$content.stop().animate({marginLeft:d}).promise().done(c.proxy(function(){this.$content.addClass("jsc-sidebar-opened");!this.config.scrollbarDisplay&&this.$content.addClass("jsc-sidebar-scroll-disabled");if(!this.$content.data("sidebar-first-click")){this.$content.data("sidebar-first-click",1)}this.config.pushCb()},this))},detectPushEnd:function(){this.$content.addClass("jsc-sidebar-opened");!this.config.scrollbarDisplay&&this.$content.addClass("jsc-sidebar-scroll-disabled");this.$content.addClass("jsc-sidebar-push-end").off(this.pushTransitionEndEvent).on(this.pullTransitionEndEvent,c.proxy(function(){this.detectPullEnd();this.config.pullCb()},this))},detectPullEnd:function(){this.$content.removeClass("jsc-sidebar-disabled");!this.config.scrollbarDisplay&&this.$content.removeClass("jsc-sidebar-scroll-disabled");this.$content.removeClass("jsc-sidebar-push-end").addClass("jsc-sidebar-pull-end").off(this.pullTransitionEndEvent).on(this.pushTransitionEndEvent,c.proxy(function(){this.detectPushEnd();this.config.pushCb()},this))}};a.defaults=a.prototype.defaults;c.fn.sidebar=function(d){return this.each(function(){new a(this,d).init()})};b.Sidebar=a})(window,jQuery);