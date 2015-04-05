var HTML2Wiki=function(i){var n="";var t={};var m="";var h="";var q="";var u=0;var b="|";function j(v){return v.trim()==""}function p(v){if(!v){return}n+=v}function s(v){return e("tag",v)}function d(){return k("tag")}function r(){return a("tag")}function l(v){return e("tag-attributes",v)}function o(){return k("tag-attributes")}function g(){return a("tag-attributes")}function f(v,x){if(!v){return null}for(var w=0;w<v.length;w++){if(v[w].name===x){return v[w].value}}return null}function e(w,v){var x=t[w];if(x==null){x=[];t[w]=x}x.push(v)}function k(v){var w=t[v];if(w!=null){return w.pop()}return null}function a(v){var w=t[v];if(w!=null){return w[w.length-1]}return null}function c(v){var w=v.replace("&lt;","<").replace("&gt;",">");return w}HTMLParser(i,{start:function(F,B,y){if(y){switch(F){case"br":if(r()==="li"){p("\n");for(var w=u;w>0;w--){p("   ")}p("# ")}else{p("#\n")}break;case"hr":p("-------\n");break;case"p":p("\n\n");break;case"img":var v=f(B,"src");var x=f(B,"width");var C=f(B,"height");if(x&&C){var z="?w="+x+"&h="+C;var E="?w="+x+"&amp;h="+C;if(v.endsWith(z)){v=v.substr(0,v.length-z.length)}else{if(v.endsWith(E)){v=v.substr(0,v.length-E.length)}}p("[["+v+"]["+x+"x"+C+"]]")}else{p("[["+v+"]]")}return}return}switch(F){case"h1":p("---++ ");break;case"h2":p("---+++ ");break;case"h3":p("---++++ ");break;case"code":if(r()==="strong"){h="=="}else{h="="}break;case"em":if(r()==="strong"){h="__"}else{if(r()==="code"){h="=="}else{h="_"}}break;case"strong":if(r()==="em"){h="__"}else{if(r()==="code"){h="=="}else{h="*"}}break;case"ul":case"ol":u++;e("listType",F);if(u>1){e("listFirstItemPrefix","\n")}break;case"li":p(k("listFirstItemPrefix"));for(var w=u;w>0;w--){p("   ")}p((a("listType")==="ul")?"* ":"1 ");break;case"blockquote":p("[quote]");break;case"pre":p("[verbatim]");break;case"table":break;case"tr":break;case"th":case"td":var D=(F==="th")?"§":"|";p(D);b=D;var A=f(B,"align");switch(A){case"left":p(" ");break;case"right":p("  ");break;case"center":p("  ");break}break}s(F);l(B)},chars:function(y){if(j(y)){return}var v=r();var x=g();switch(v){case"a":var w=f(x,"href");if(w&&w.startsWith("mailto:")){w=w.substr("mailto:".length)}if(w===y){p("[["+w+"]]")}else{p("[["+w+"]["+y+"]]")}return;case"pre":p(c(y));return;case"p":y=y.replace(/^\s+/,"");y=y.replace(/\s+$/," ");break}p(m);p(h);p(y.replace("\n"," "));p(h);p(q)},end:function(v){var x=g();switch(v){case"h1":case"h2":case"h3":p("\n");break;case"p":p("\n\n");break;case"em":case"code":case"strong":break;case"li":var w=k("listItemHasSubList");if(!w){p("\n")}break;case"ol":case"ul":k("listType");if(u>1){e("listItemHasSubList",true)}u--;break;case"blockquote":p("[/quote]\n");break;case"pre":p("[/verbatim]\n");break;case"table":break;case"tr":p(b+"\n");break;case"th":case"td":var y=f(x,"align");switch(y){case"left":p("  ");break;case"right":p(" ");break;case"center":p("  ");break}break}m="";h="";q="";d();o()},comment:function(v){}});return n};