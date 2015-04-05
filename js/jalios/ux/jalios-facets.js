!function ($) {
  
  var register = function() {
    $(document).on('click', '#search-facets INPUT[type=checkbox], #search-facets INPUT[type=radio]', doSubmitFacets);
  }
  
  var doSubmitFacets = function(event) {
    var $e = $(event.currentTarget);
    
    // CASE 1 : boolean checkbox (eg : catName, searchInFiles, ...)
    // Checkbox having the "boolean" class must always 
    // be submitted (therefore always checked) but the value is changed   
    if ($e.is('.boolean')) {
      $e.val(!$.jalios.Common.toBoolean($e.val(), true));
      $e.prop('checked', true);
    }
    // CASE 2 : multiple option checkbox with some exclusive behavior
    // eg: 
    //   - when searchedAllFields is checked, we must uncheck all searchFields
    //   - when one searchFields is checked,  we must uncheck searchedAllFields
    // Only process checked case    
    else {    
      var $li = $e.closest('LI');
      if ($li.hasClass('exclusive')) {
        var $checkbox = $li.find('INPUT[type=checkbox]');
        if ($checkbox.is(":checked")) {
           // Uncheck all and check exclusive element
           $e.closest('UL.facet-list').find('INPUT[type=checkbox]').prop('checked', false);
           $checkbox.prop('checked', true);
        }
      } else {
        // Uncheck exclusive element
        $e.closest('UL.facet-list').find('.exclusive INPUT[type=checkbox]').prop('checked', false);
      }
    }
    
    // Check the wrapper
    var $wrapper = $('#search-facets');
    
    // Advanced mode do not submit
    var isAdvanced = $wrapper.hasClass('advanced');
    var isAjax = $wrapper.hasClass('ajax-submit');

    // Explicit submit by the user
    if (isAdvanced) {
      return;
    }
    
    // Submit form
    var $submit = $('#facets-submit');
    $.jalios.DOM.follow.defer($submit);
  }
  
  // ------------------------------------------
  //  READY
  // ------------------------------------------
    
  // Initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
 
}(window.jQuery);