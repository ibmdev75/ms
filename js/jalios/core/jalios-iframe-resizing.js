/**
 * Resizes the iframe height automatically to enlarge over the full height available.
 * Add 'iframe-resize' class on iframe element to resize.
 * 
 * You can use "iframe-resize" class to display something during the resizing of the iframe and display the iframe 
 * For example:
 * <div class="iframe-resize"><img src="images/jalios/icons/wait.gif" alt="Loading ..." class="center-block" /></div>
 * <iframe src="<%= src %>" style="width:100%; min-height:500px; border:none;" class="iframe-resize invisible"></iframe>
 * 
 * In this example, an image is displayed during processing. When resizing the iframe is finished, the image is hidden and iframe is displayed.
 */
!function($) {

  function init( frame ) {
    resize( frame );
    $('.iframe-resize').toggleClass('invisible');
  }
  
  /**
   * Called to resize a given iframe.
   *
   * @param frame The iframe to resize.
   */
  function resize( frame ) {
    /*
    var cHeight;
    try {
      var b = frame.contentWindow.document.body || frame.contentDocument.body;
      cHeight = $(b).height();
    } catch (e) {
      cHeight = $(window).height() - $(frame).offset().top - 5; // Remove 5 arbitrarily to not display vertical scroll
    }
    */
    var cHeight = $(window).height() - $(frame).offset().top - 5; // Remove 5 arbitrarily to not display vertical scroll

    if( frame.oHeight !== cHeight ) {
      $(frame).height( 0 );
      frame.style.height = 0;
  
      $(frame).height( cHeight );
      frame.style.height = cHeight + "px";
  
      frame.oHeight = cHeight;
    }
  
    // Call again to check whether the content height has changed.
    setTimeout( function() { resize( frame ); }, 250 );
  }
  
  /**
   * Resizes all the iframe with class 'iframe-resize'.
   */
  $(document).ready(function() {
    $('IFRAME.iframe-resize').each(function() {
      init( this );
    });
  });
}(window.jQuery);