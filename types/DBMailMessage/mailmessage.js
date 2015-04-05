!function($) {
  
  // ------------------------------------------
  // PUBLIC CODE
  // ------------------------------------------

  // Namespace
  if (!$.jalios) {
    $.jalios = {};
  }

  /**
   * Little script to improve IFRAME height resizing.
   * Called on toggle show/hide E-mail's IFRAME.
   * 
   * @namespace $.jalios.mailmessage
   */
  $.jalios.mailmessage = {
    resizeIframe: function(element){
      var $element = $(element);
      var $iframe = $element.closest('.mail-message').find('IFRAME');
      if (!$iframe || !$iframe.exists()){ return; }
      jQuery.jalios.DOM.resizeIframeToViewport($iframe);
    }
  }
}(window.jQuery);


var DBMailResizeIframe = function(event){
  jQuery.jalios.mailmessage.resizeIframe(event);
}
