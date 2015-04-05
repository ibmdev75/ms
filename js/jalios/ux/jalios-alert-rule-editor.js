!function($) {
	
	$(document).on('click', '.alert-rule-delete', function() {
    $(this).closest("TR").remove();
  });

  $(document).on('click', '.alert-rule-add', function() {

  	// Clone the model
  	var $model = $("TR#alert-rule-model");
    var $newTR = $model.clone().removeAttr("id").insertBefore($model);
    
    // Update alert-channel checkbox name
    var count = $newTR.siblings().size() - 2; // starts at 0 and ignore header TR
    
    $newTR.find(":checkbox").each(function() {
    	$(this).attr("value", count + "_" + $(this).attr("value"));
    });
    
    // Show table (if hidden)
    var $table = $("TABLE.alert-rule-list");
    $table.removeClass('hide');
  });
  
}(window.jQuery);
