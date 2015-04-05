/**
 * -----------------------------------------------------------------
 *
 *  This file is used in the edition page of a Publication to switch image and description of templates
 *  See work/doEditCommonTemplates.jsp
 * -----------------------------------------------------------------
 */ 

!function ($) {

  var register = function(){
    $(".template-wrapper .template-chooser").change(function() {
      //Retrieve selected value
      var jspPath = $("option:selected", this).data("jalios-path");
      var selectValue = $("option:selected", this).val();
      selectValue = "." + selectValue.replace('.','\\.');
      
      var $wrapper = $(this).closest(".template-wrapper");
      
      //Replace image 
      var jpgPath = jspPath.replace('.jsp', '.jpg');
      $(".template-image", $wrapper).attr("src", jpgPath);
      
      //Replace description
      $(".template-description-item", $wrapper).hide();
      $(selectValue, $wrapper).show();
    });
    
    //Handle missing image of a template
    $(".template-wrapper .template-image").error(function() {
      $(this).attr("src","images/jalios/layout/bg/thumbnailBroken.gif");
    });    
    
  }
    
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);