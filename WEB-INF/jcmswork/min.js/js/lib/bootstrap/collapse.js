+function(c){var d=function(f,e){this.$element=c(f);this.options=c.extend({},d.DEFAULTS,e);this.transitioning=null;if(this.options.parent){this.$parent=c(this.options.parent)}if(this.options.toggle){this.toggle()}};d.VERSION="3.2.0";d.DEFAULTS={toggle:true};d.prototype.dimension=function(){var e=this.$element.hasClass("width");return e?"width":"height"};d.prototype.show=function(){if(this.transitioning||this.$element.hasClass("in")){return}var f=c.Event("show.bs.collapse");this.$element.trigger(f);if(f.isDefaultPrevented()){return}var i=this.$parent&&this.$parent.find("> .panel > .in");if(i&&i.length){var g=i.data("bs.collapse");if(g&&g.transitioning){return}b.call(i,"hide");g||i.data("bs.collapse",null)}var j=this.dimension();this.$element.removeClass("collapse").addClass("collapsing")[j](0);this.transitioning=1;var e=function(){this.$element.removeClass("collapsing").addClass("collapse in")[j]("");this.transitioning=0;this.$element.trigger("shown.bs.collapse")};if(!c.support.transition){return e.call(this)}var h=c.camelCase(["scroll",j].join("-"));this.$element.one("bsTransitionEnd",c.proxy(e,this)).emulateTransitionEnd(350)[j](this.$element[0][h])};d.prototype.hide=function(){if(this.transitioning||!this.$element.hasClass("in")){return}var f=c.Event("hide.bs.collapse");this.$element.trigger(f);if(f.isDefaultPrevented()){return}var g=this.dimension();this.$element[g](this.$element[g]())[0].offsetHeight;this.$element.addClass("collapsing").removeClass("collapse").removeClass("in");this.transitioning=1;var e=function(){this.transitioning=0;this.$element.trigger("hidden.bs.collapse").removeClass("collapsing").addClass("collapse")};if(!c.support.transition){return e.call(this)}this.$element[g](0).one("bsTransitionEnd",c.proxy(e,this)).emulateTransitionEnd(350)};d.prototype.toggle=function(){this[this.$element.hasClass("in")?"hide":"show"]()};function b(e){return this.each(function(){var h=c(this);var g=h.data("bs.collapse");var f=c.extend({},d.DEFAULTS,h.data(),typeof e=="object"&&e);if(!g&&f.toggle&&e=="show"){e=!e}if(!g){h.data("bs.collapse",(g=new d(this,f)))}if(typeof e=="string"){g[e]()}})}var a=c.fn.collapse;c.fn.collapse=b;c.fn.collapse.Constructor=d;c.fn.collapse.noConflict=function(){c.fn.collapse=a;return this};c(document).on("click.bs.collapse.data-api",'[data-toggle="collapse"]',function(k){var f;var m=c(this);var l=m.attr("data-target")||k.preventDefault()||(f=m.attr("href"))&&f.replace(/.*(?=#[^\s]+$)/,"");var g=c(l);var i=g.data("bs.collapse");var j=i?"toggle":m.data();var n=m.attr("data-parent");var h=n&&c(n);if(!i||!i.transitioning){if(h){h.find('[data-toggle="collapse"][data-parent="'+n+'"]').not(m).addClass("collapsed")}m[g.hasClass("in")?"addClass":"removeClass"]("collapsed")}b.call(g,j)})}(jQuery);