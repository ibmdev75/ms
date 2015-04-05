if (typeof CodeMirror != 'undefined') {
CodeMirror.defineMode("twiki", function () {

  /**
   * Chain to next token
   */  
  function chain(stream, state, cb) {
    state.tokenize = cb;
    return cb(stream, state);
  }

  /**
   * Used as scratch variables to communicate multiple values without
   * consing up tons of objects. 
   */  
  var type, content;
  function ret(tp, style, cont) {
    type = tp;
    content = cont;
    return style;
  }
  
  function jsTokenBase(stream, state) {
    var sol = stream.sol();
    var ch  = stream.peek();    // don't eat, to make matching simpler
    
    
    // ------------------------------------------
    //  STATE
    // ------------------------------------------

    if (state.link){
      if (state.link == 1){
        state.link = 2;
        while(stream.peek() != ']') { stream.next(); }
        return twToken(stream, state, 'link', 'link');
      } else {
        stream.next(); stream.next();
        state.link = false;
        return twToken(stream, state, 'link', 'link-trigger');
      }
    }

    if (state.eat){
      stream.skipToEnd();
      var style = state.eat;
      state.eat = false;
      return ret("header", style);
    }
    
    // ------------------------------------------
    //  SOL
    // ------------------------------------------

    if (sol){
      if (stream.match("---++",true)){
        var cpt = 1;
        while(stream.peek() == '+') { stream.next(); cpt++; }
        while(stream.peek() == ' ') { stream.next(); }
        state.eat = "header header-"+cpt;
        return ret("header", "header header-trigger");
      }
      if (stream.match("---",true)){
        stream.skipToEnd();
        return ret('hr', 'hr');
      }
      if (stream.match(/\s+\*/,true)){
        stream.skipToEnd();
        return ret("list", "list");
      }
      if (stream.match(/\s+#/,true)){
        stream.skipToEnd();
        return ret("list", "list");
      }
      if (stream.match(/\s+\d/,true)){
        stream.skipToEnd();
        return ret("list", "list");
      }
      if (stream.match(/\s{3}\w+:/,true)){
        stream.skipToEnd();
        return ret("list", "list");
      }
    }
    
    // ------------------------------------------
    //  Check chars
    // ------------------------------------------
    
    if (stream.match(/[\w\/\.:_-]+\.(jpg|gif|png)/,true)){
      return chain(stream, state, twTokenImage);
    }
    /*
    if (stream.match(/\[\[[^\]]+\](\[[^\]]+\])*\]/,true)){
      return chain(stream, state, twTokenBlockLink);
    }
    */
    var match = stream.match(/\[\[[^\]]+\](\[[^\]]+\])*\]/,false)
    if (match){
      stream.match(/\[\[([^\]]+\]\[)*/,true)
      state.link = 1;
      return twToken(stream, state, 'link', 'link-trigger');
    }
    
    if (stream.match(/[\w-.]+@[\w-]+\.\w+/,true)){
      return chain(stream, state, twTokenMail);
    }
    
    if (stream.match(/\[\w+[^\]]*\/\]/,true)){
      return chain(stream, state, twTokenBlockInline);
    }
    
    if (!state.block && stream.match(/\[\w+[^\]]*\]/,true)){
      state.block = stream.current().match(/\[(\w+)[^\]]*\]/)[1];
      return chain(stream, state, twTokenBlock);
    }
    
    if (state.block && stream.match(/\[\/\w+[^\]]*\]/,true)){
      if (state.block == stream.current().match(/\[\/(\w+)[^\]]*\]/)[1]){
        state.block = false;
        return chain(stream, state, twTokenBlock);
      }
    }
    
    if (stream.match(/^\*[^\*]+\*($|\s)/,false)) return chain(stream, state, twTokenStrong);
    if (stream.match(/^_[^_]+_($|\s)/,false)) return chain(stream, state, twTokenEm);
    if (stream.match(/^__[^_]+__($|\s)/,false)) return chain(stream, state, twTokenEmStrong);
    if (stream.match(/^=[^=]+=($|\s)/,false)) return chain(stream, state, twTokenFix);
    if (stream.match(/^==[^=]+==($|\s)/,false)) return chain(stream, state, twTokenFixStrong);
    
    
    ch = stream.next();
    if (state.block){
      return ret('text', 'block');
    }
        
    if (ch == "§") { // tw table header
      return chain(stream, state, twTokenTableHeader);
    }
    
    if (ch == "|") { // tw table
      return chain(stream, state, twTokenTable);
    }
    
    if (state.table){
      return ret('text', state.table);
    }
  }

  // ------------------------------------------
  //  Check chars
  // ------------------------------------------
  
  function twToken(stream, state, tp, style){
    state.tokenize = jsTokenBase;
    return ret(tp, style);
  }
  
  function twTokenEat(stream, state, tp, style, match, callback) {
    if (!match){ return twToken(stream, state, tp, style); }
    
    for (var ch,i,j = 0; match && (ch = stream.next()); j++) {
      i = (ch == match.charAt(i)) ? i+1 : 0;
      if (i == match.length) {
        state.tokenize = jsTokenBase;
        if (callback) callback(stream, state, j);
        
        return ret(tp, style);
      }
    }
    state.tokenize = jsTokenBase;
    if (callback) callback(stream, state);
  }

  function twTokenMatch(stream, state, tp, style, match, callback) {
    if (!match){ return twToken(stream, state, tp, style); }
    
    if (!state.tok_start){ // Step 1st Match
      stream.next();
      state.tok_start  = true;
      state.tokenize = function(stream, state){ return twTokenMatch(stream, state, tp, style, match);  }
      return ret(tp, 'token-start');
    }
    
    if (state.tok_end){ // Step 2nd Match
      stream.next();
      state.tok_start  = false;
      state.tok_end    = false;
      state.tokenize = function(stream, state){ return twTokenMatch(stream, state, tp, style, false);  };
      if (callback) callback(stream, state);
      return ret(tp, 'token-end');
    }
    
    for (var ch,i,j = 0; match && (ch = stream.peek()); j++) {
      i = (ch == match.charAt(i)) ? i+1 : 0; 
      if (i != match.length) { stream.next(); continue; }

      state.tokenize = function(stream, state){ return twTokenMatch(stream, state, tp, style, match);  }
      state.tok_end = true;
      return ret(tp, style);
    }
    
    state.tok_start  = false;
    state.tok_end    = false;
    state.tokenize = jsTokenBase;
    if (callback) callback(stream, state);
  }


  function twTokenStrong(stream, state) {
    return twTokenMatch(stream, state, 'text', 'strong', '*');
  }
  function twTokenEm(stream, state) {
    return twTokenMatch(stream, state, 'text', 'em', '_');
  }
  function twTokenEmStrong(stream, state) {
    return twTokenMatch(stream, state, 'text', 'emstrong', '__');
  }
  function twTokenFix(stream, state) {
    return twTokenMatch(stream, state, 'text', 'fix', '=');
  }
  function twTokenFixStrong(stream, state) {
    return twTokenMatch(stream, state, 'text', 'fixstrong', '==');
  }
  function twTokenImage(stream, state) {
    return twToken(stream, state, 'link', 'link');
  }
  function twTokenBlockInline(stream, state) {
    return twToken(stream, state, 'text', 'block-inline');
  }
  function twTokenBlock(stream, state) {
    return twToken(stream, state, 'text', 'block');
  }
  function twTokenBlockLink(stream, state) {
    return twToken(stream, state, 'link', 'link');
  }
  function twTokenMail(stream, state) {
    return twToken(stream, state, 'link', 'link');
  }
  function twTokenTable(stream, state) {
    state.table = 'cell';
    return twTokenEat(stream, state, 'table', 'cell', '|', tokenTableCB);
  }
  function twTokenTableHeader(stream, state) {
    state.table = 'cell-header';
    return twTokenEat(stream, state, 'table', 'cell-header', '§', tokenTableCB);
  }
  
  function tokenTableCB(stream, state, j){
    if (j) stream.backUp(j+1);
    else   state.table = false;
  }
  
  // Interface
  return {
    startState: function () {
      return {
        tokenize: jsTokenBase,
        indented: 0,
        level: 0
      };
    },

    token: function (stream, state) {
      // if (stream.eatSpace()) return null;
      var style = state.tokenize(stream, state);
      return style;
    },

    electricChars: ""
  };
});
CodeMirror.defineMIME("text/x-twiki", "twiki");
}