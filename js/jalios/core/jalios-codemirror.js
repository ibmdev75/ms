!function ($) {

  // Register
  var register = function(){ 
    
    $(document).on('focusin',   '.widget TEXTAREA.wikiarea', init);
    $(document).on('focusin',   '.widget .CodeMirror TEXTAREA',  hint);
    $(document).on('mousedown', '.widget .CodeMirror .CodeMirror-toolbar BUTTON',  toolbar);
    $(document).on('click',     '.widget .CodeMirror .CodeMirror-toolbar BUTTON',  function(event){ event.preventDefault(); });
    
    Typeahead.hooks.add(lookup);
    Typeahead.hooks.add(select);
    Typeahead.hooks.add(show);
    
    // Override 
    if ($.jalios.Wiki){
      $.jalios.Wiki.showWikiToolbar = function(input){ }
    }
  }
  
  // ------------------------------------------
  //  TOOLBAR
  // ------------------------------------------

  var tb = '<div class="CodeMirror-toolbar btn-toolbar">'
         +   '<div class="btn-group">'
         +     '<button type="button" class="btn btn-default btn-sm wiki-strong"><span class="fa fa-bold jalios-icon"></span></button>'
         +     '<button type="button" class="btn btn-default btn-sm wiki-em"><span class="fa fa-italic jalios-icon "></span></button>'
         +     '<button type="button" class="btn btn-default btn-sm wiki-wikiwyg"><span class="fa fa-eye jalios-icon"></span></button>'
         +   '</div>'
         + '</div>';

  var toolbar = function(event){
    if (!cached || !cached.doc){ return; }
    
    var $e  = $(event.currentTarget);
    var doc = cached.doc;
    var sel = doc.getSelection();
    
    if ($e.hasClass('wiki-strong')){
      if (sel.match(/\*[^*]+\*/)){
        doc.replaceSelection(sel.substring(1,sel.length-1));
      } else {
        doc.replaceSelection('*'+sel+'*');
      }
    } 
    else if ($e.hasClass('wiki-em')){
      if (sel.match(/_[^_]+_/)){
        doc.replaceSelection(sel.substring(1,sel.length-1));
      } else {
        doc.replaceSelection('_'+sel+'_');
      }
    }
    else if ($e.hasClass('wiki-wikiwyg')){
      $(cached.getWrapperElement()).toggleClass('twikiwyg');
      cached.refresh();
    }
  }

  // ------------------------------------------
  //  CALLBACKS
  // ------------------------------------------
              
  var cached = false;
  var init = function(event){     
    var $e = $(event.currentTarget);
    var cm = $e.data('CodeMirror');
    if (!cm) {
      cm = CodeMirror.fromTextArea($e[0],  {
        mode: 'twiki',
        tabSize : 2, 
        lineNumbers: false,
        lineWrapping: true 
      });
      
      // Set events
      var keyCode = false;
      cm.on("blur",    function(cm) { cm.save(); /*cached = false;*/ });
      cm.on("focus",   function(cm) { cached = cm; });
      cm.on("keydown", function(cm, evt) { keyCode = evt.keyCode; });
      cm.on("cursorActivity", function(cm, evt) { 
        
        var cur   = cm.doc.getCursor();
        var tCur  = cm.getTokenAt(cur);
        if (tCur.type == 'token-end'){
          var len  = Math.abs(tCur.end - tCur.start);
          if (keyCode == 39){ cm.moveH(len, "char"); } else { cm.moveH(-len, "char"); }  
        }
        
        var next  = jQuery.extend({}, cur); next.ch +=1;
        var tNext = cm.getTokenAt(next);
        if (tNext.type == 'token-start'){ 
          var len  = Math.abs(tNext.end - tNext.start);
          if (keyCode == 37){ cm.moveH(-len, "char"); } else { cm.moveH(len, "char"); }  
        }
        // console.log(evt, 'cursorActivity:', cur, 'token:', tCur, 'Select', cm.doc.somethingSelected()); 
      });
      
      // Set size
      var max    = 30*14+2;
      var lines  = cm.doc.lineCount() * 14 + 2; //14px;
      var height = $e.height();
      height = height > lines ? height : (lines > max ? max : lines);
      //cm.setSize($e.width(), height);
      
      // Backup
      $e.data('CodeMirror', cm);
      
      // Toolbar
      $(cm.getWrapperElement()).prepend(tb);
      
      $(cm.getWrapperElement()).toggleClass('twikiwyg');
      cm.refresh();
    }
    cm.setValue($e.val());
    
  }
  
  // Callback
  var hint = function(event){
    var $e = $(event.currentTarget);
    
    // Quick escape
    if ($e.data('typeahead')) { return; }
    
    // Build new menu
    var $menu = $('<div class="typeahead-menu ajax-refresh-div"></div>');
    var url = 'jcore/autocomplete/acwiki.jsp';
    
    // Create WikiComplete
    $e.typeahead({ 
      'menu': $menu,
      'ajax': url
    });
  }
  
  // ------------------------------------------
  //  UTILS
  // ------------------------------------------
  
  var Pos = CodeMirror.Pos;
  
  var getToken = function(){
    if (!cached || !cached.doc){ return {'word' : ''}; }
    
    var doc = cached.doc;
    var end = doc.getCursor();
    var start = jQuery.extend({}, end);

    for ( ; start.ch > 0 ; start.ch--){
      if (cached.getTokenAt(start).string == ' ') break;
    }
    var word = cached.getRange(start, end); 
    
    return {
      'start': start,
      'end':   end,
      'word':  word
    }
  } 
  
  var replaceToken = function(str, token){
    if (!cached || !cached.doc){ return; }
    cached.doc.replaceRange(str, token.start, token.end);
  }
  
  // ------------------------------------------
  //  EVENTS
  // ------------------------------------------
 
  var select = function(event){
    if (event.type != 'select'){ return; }

    var $e  = event.typeahead.$element;
    if ($e.prop('tagName') != 'TEXTAREA'){ return; }
    
    var $a = event.$active
    var token = getToken();
    
    var value = $a.attr('data-value');
    var ph  = $a.attr('data-placeholder');
    if (ph){ value = '[['+value+']['+(ph||token.word)+']]'; }
    
    replaceToken(value, token);
    
    $e.change();
    event.stop = true;
  }
  
  var lookup = function(event){
    if (event.type != 'lookup'){ return; }
    
    var th = event.typeahead;
    var $e = th.$element;

    var word = getToken().word;
    
    if (word && word.length > 1 && (word.indexOf('@') == 0 || word.indexOf('#') == 0)){
      th.query = word;
      th.show();
    }
    else if (event.explicit){
      th.query = word;
      th.show();
    }
    else {
      event.stop = true;
    }
  }
  
  var show = function(event){
    if (event.type != 'show'){ return; }
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });

}(window.jQuery);


