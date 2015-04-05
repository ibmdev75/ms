!function ($) {
  
  var register = function() {
    $(parent.document).find('#editForm').on('submit', function() {
      setTimeout(function() {
        var $docChooserUpload = $(parent.document).find('.doc-chooser-upload');
        $docChooserUpload.removeClass('hide');
        $docChooserUpload.find('.upload-infos').refresh();
      }, 500);
    });
  }
  
  // ------------------------------------------
  //  READY
  // ------------------------------------------
    
  // Initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
 
}(window.jQuery);
