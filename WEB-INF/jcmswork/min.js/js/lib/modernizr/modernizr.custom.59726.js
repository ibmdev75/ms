window.Modernizr=(function(m,s,h){var d="2.8.2",k={},o=true,C=s.documentElement,D="modernizr",z=s.createElement(D),n=z.style,e=s.createElement("input"),A=":)",v={}.toString,i={},c={},t={},y=[],u=y.slice,a,x=function(N,P,H,O){var G,M,J,K,F=s.createElement("div"),L=s.body,I=L||s.createElement("body");if(parseInt(H,10)){while(H--){J=s.createElement("div");J.id=O?O[H]:D+(H+1);F.appendChild(J)}}G=["&#173;",'<style id="s',D,'">',N,"</style>"].join("");F.id=D;(L?F:I).innerHTML+=G;I.appendChild(F);if(!L){I.style.background="";I.style.overflow="hidden";K=C.style.overflow;C.style.overflow="hidden";C.appendChild(I)}M=P(F,N);if(!L){I.parentNode.removeChild(I);C.style.overflow=K}else{F.parentNode.removeChild(F)}return !!M},b=function(H){var G=m.matchMedia||m.msMatchMedia;if(G){return G(H)&&G(H).matches||false}var F;x("@media "+H+" { #"+D+" { position: absolute; } }",function(I){F=(m.getComputedStyle?getComputedStyle(I,null):I.currentStyle)["position"]=="absolute"});return F},q=({}).hasOwnProperty,B;if(!j(q,"undefined")&&!j(q.call,"undefined")){B=function(F,G){return q.call(F,G)}}else{B=function(F,G){return((G in F)&&j(F.constructor.prototype[G],"undefined"))}}if(!Function.prototype.bind){Function.prototype.bind=function E(H){var I=this;if(typeof I!="function"){throw new TypeError()}var F=u.call(arguments,1),G=function(){if(this instanceof G){var L=function(){};L.prototype=I.prototype;var K=new L();var J=I.apply(K,F.concat(u.call(arguments)));if(Object(J)===J){return J}return K}else{return I.apply(H,F.concat(u.call(arguments)))}};return G}}function p(F){n.cssText=F}function g(G,F){return p(prefixes.join(G+";")+(F||""))}function j(G,F){return typeof G===F}function l(G,F){return !!~(""+G).indexOf(F)}function w(G,J,I){for(var F in G){var H=J[G[F]];if(H!==h){if(I===false){return G[F]}if(j(H,"function")){return H.bind(I||J)}return H}}return false}function r(){k.input=(function(H){for(var G=0,F=H.length;G<F;G++){t[H[G]]=!!(H[G] in e)}if(t.list){t.list=!!(s.createElement("datalist")&&m.HTMLDataListElement)}return t})("autocomplete autofocus list placeholder max min multiple pattern required step".split(" "));k.inputtypes=(function(I){for(var H=0,G,K,J,F=I.length;H<F;H++){e.setAttribute("type",K=I[H]);G=e.type!=="text";if(G){e.value=A;e.style.cssText="position:absolute;visibility:hidden;";if(/^range$/.test(K)&&e.style.WebkitAppearance!==h){C.appendChild(e);J=s.defaultView;G=J.getComputedStyle&&J.getComputedStyle(e,null).WebkitAppearance!=="textfield"&&(e.offsetHeight!==0);C.removeChild(e)}else{if(/^(search|tel)$/.test(K)){}else{if(/^(url|email)$/.test(K)){G=e.checkValidity&&e.checkValidity()===false}else{G=e.value!=A}}}}c[I[H]]=!!G}return c})("search tel url email datetime date month week time datetime-local number range color".split(" "))}for(var f in i){if(B(i,f)){a=f.toLowerCase();k[a]=i[f]();y.push((k[a]?"":"no-")+a)}}k.input||r();k.addTest=function(G,H){if(typeof G=="object"){for(var F in G){if(B(G,F)){k.addTest(F,G[F])}}}else{G=G.toLowerCase();if(k[G]!==h){return k}H=typeof H=="function"?H():H;if(typeof o!=="undefined"&&o){C.className+=" mdn-"+(H?"":"no-")+G}k[G]=H}return k};p("");z=e=null;k._version=d;k.mq=b;k.testStyles=x;C.className=C.className.replace(/(^|\s)no-js(\s|$)/,"$1$2")+(o?" mdn-js mdn-"+y.join(" mdn-"):"");return k})(this,this.document);Modernizr.addTest("placeholder",function(){return !!("placeholder" in (Modernizr.input||document.createElement("input"))&&"placeholder" in (Modernizr.textarea||document.createElement("textarea")))});