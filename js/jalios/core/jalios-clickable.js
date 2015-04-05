!function ($) {
  
  var isCtrlKeyPressed = false;
  var CTRL_KEY = 17;
  var LEFT_CLICK = 1;
  var MIDDLE_CLICK = 2;

  var callback = function(event) {
    var $elm = $(event.currentTarget);    
    var url = null;
    var $links = $("A", $elm);
    var dataUrl = $elm.data("jalios-url");
    if (dataUrl) {
      url = dataUrl;
    } else if ($links.exists()){
      url = $links.first().prop("href");
    }
    
    if (url) {
      var options = $elm.data("jalios-options");
      // IE and Firefox do not allow new tab to be opened through javascript
      var isBrowserHandleNewTab = $("BODY").hasClass("browser-Chrome");
      if (event.which === LEFT_CLICK) {
        if (isBrowserHandleNewTab && (options && options.target === "_blank" || isCtrlKeyPressed)) {
          // Handle options.target = "_blank"
          var win = window.open(url, '_blank');
        } else {
          document.location.href = document.getElementsByTagName('base')[0].href + url;
        }
      } else if (isBrowserHandleNewTab && event.which === MIDDLE_CLICK) {
        event.preventDefault();
        var win = parent.window.open(url, '_blank');
      }
    }
  }

  var onKeyDown = function(event) {
    if (event.which === CTRL_KEY) {
      isCtrlKeyPressed = true;
    }
  }
  
  var register = function() {
    $(document).on("mousedown",".clickable[data-jalios-url]", callback);
    $(document).keydown(onKeyDown);
    $(document).keyup( function(){ 
      isCtrlKeyPressed = false; 
    });  
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);