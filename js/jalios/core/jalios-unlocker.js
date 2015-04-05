/**
 * Listen the unload event to unlock the current content when we quit or refresh the page.
 * 
 * Usage:
 * Add the CSS class 'unlocker' to the DIV container, and add to the same DIV data-jalios-unlocker-url with the URL to unlock the content.
 * Example:
 * <div class="unlocker" data-jalios-unlocker-url='<%=  encodeForHTMLAttribute(HttpUtil.getUrlWithCSRFToken("work/unlock.jsp?id="+ pub.getId(), request, false)) %>'>
 * ....
 * </div>
 */
!function ($) {

  var doUnlock =  function() {
    var $unlocker = $(".unlocker");
    
    if ($unlocker.exists()) {
      var unlockerUrl = $unlocker.data("jalios-unlocker-url");

      if(unlockerUrl) {
        $.ajax({
          url: unlockerUrl
        });
      }
    }
  };
  
  $(window).on('beforeunload', doUnlock);
  $(document).on('click.dismiss.bs.modal', '[data-dismiss="modal"]', doUnlock);

}(window.jQuery);