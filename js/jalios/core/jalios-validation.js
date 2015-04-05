!function ($) {
  
  var register = function() {
    $.validator.setDefaults({
      debug: true
    });
    
    $('*[data-jalios-validation]').each(function() {
      var fieldName = $(this).attr("name");
      var validationRules = $(this).data('jalios-validation');      
      
      $(this).closest('FORM').validate({
        onkeyup: false
      }); // sets up the validator
      $(this).rules("add", validationRules);
      
    });
  }

  // ------------------------------------------
  //  READY
  // ------------------------------------------
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);

  