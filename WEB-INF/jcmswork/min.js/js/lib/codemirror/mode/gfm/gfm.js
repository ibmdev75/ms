(function(a){if(typeof exports=="object"&&typeof module=="object"){a(require("../../lib/codemirror"),require("../markdown/markdown"),require("../../addon/mode/overlay"))}else{if(typeof define=="function"&&define.amd){define(["../../lib/codemirror","../markdown/markdown","../../addon/mode/overlay"],a)}else{a(CodeMirror)}}})(function(a){a.defineMode("gfm",function(d,h){var c=0;function f(i){i.code=false;return null}var g={startState:function(){return{code:false,codeBlock:false,ateSpace:false}},copyState:function(i){return{code:i.code,codeBlock:i.codeBlock,ateSpace:i.ateSpace}},token:function(k,j){if(j.codeBlock){if(k.match(/^```/)){j.codeBlock=false;return null}k.skipToEnd();return null}if(k.sol()){j.code=false}if(k.sol()&&k.match(/^```/)){k.skipToEnd();j.codeBlock=true;return null}if(k.peek()==="`"){k.next();var i=k.pos;k.eatWhile("`");var l=1+k.pos-i;if(!j.code){c=l;j.code=true}else{if(l===c){j.code=false}}return null}else{if(j.code){k.next();return null}}if(k.eatSpace()){j.ateSpace=true;return null}if(k.sol()||j.ateSpace){j.ateSpace=false;if(k.match(/^(?:[a-zA-Z0-9\-_]+\/)?(?:[a-zA-Z0-9\-_]+@)?(?:[a-f0-9]{7,40}\b)/)){return"link"}else{if(k.match(/^(?:[a-zA-Z0-9\-_]+\/)?(?:[a-zA-Z0-9\-_]+)?#[0-9]+\b/)){return"link"}}}if(k.match(/^((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]|\([^\s()<>]*\))+(?:\([^\s()<>]*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/i)&&k.string.slice(k.start-2,k.start)!="]("){return"link"}k.next();return null},blankLine:f};var e={underscoresBreakWords:false,taskLists:true,fencedCodeBlocks:true};for(var b in h){e[b]=h[b]}e.name="markdown";a.defineMIME("gfmBase",e);return a.overlayMode(a.getMode(d,"gfmBase"),g)},"markdown")});