(function(a){if(typeof exports=="object"&&typeof module=="object"){a(require("../../lib/codemirror"))}else{if(typeof define=="function"&&define.amd){define(["../../lib/codemirror"],a)}else{a(CodeMirror)}}})(function(a){a.runMode=function(m,j,q,s){var l=a.getMode(a.defaults,j);var d=/MSIE \d/.test(navigator.userAgent);var h=d&&(document.documentMode==null||document.documentMode<9);if(q.nodeType==1){var n=(s&&s.tabSize)||a.defaults.tabSize;var g=q,f=0;g.innerHTML="";q=function(y,v){if(y=="\n"){g.appendChild(document.createTextNode(h?"\r":y));f=0;return}var w="";for(var z=0;;){var e=y.indexOf("\t",z);if(e==-1){w+=y.slice(z);f+=y.length-z;break}else{f+=e-z;w+=y.slice(z,e);var u=n-f%n;f+=u;for(var t=0;t<u;++t){w+=" "}z=e+1}}if(v){var x=g.appendChild(document.createElement("span"));x.className="cm-"+v.replace(/ +/g," cm-");x.appendChild(document.createTextNode(w))}else{g.appendChild(document.createTextNode(w))}}}var r=a.splitLines(m),c=(s&&s.state)||a.startState(l);for(var k=0,o=r.length;k<o;++k){if(k){q("\n")}var p=new a.StringStream(r[k]);while(!p.eol()){var b=l.token(p,c);q(p.current(),b,k,p.start,c);p.start=p.pos}}}});