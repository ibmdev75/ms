!function ($) {

  var register = function(){
    // Lazy initialisation of sortable on focusin 
    $(document).on('focusin', '.sortable-lazy :input', function(){
      var $lazy = $(this).closest('.sortable-lazy');

      // Skip nodnd => done server side
      // var $widget = $(this).closest('.widget');
      // if ($widget.hasClass('nodnd')){ return; }
      
      // Handle TabPane
      if ($lazy.hasClass('wdg-tabpane')){
        $lazy = $lazy.closest('.widget').find('UL.wdg-tab.sortable-lazy');
      } 
      
      // Build sortable
      $.jalios.Sortable.buildSortable($lazy);
      
      // Record previous position for update()
      $lazy.children().each(function(idx){
        $(this).data('jalios.sortable', idx);
      });
    });
    
    $(document).on("jalios:sortable", callback);
  }
  
  var callback = function(event){
  
    var sortable = $.jalios.Event.match(event, 'sortable');
    if (!sortable){ return; }
    
    var $container = $(sortable.container);
    if (!$container || !$container.hasClass('wdg-tab')){ return; }
    
    var item  = sortable.ui.item;
    var order = $container.children().map(function(){
      return $(this).data('jalios.sortable');
    }).get();
    
    // FIXME: Prototype
    JCMS.form.Widget.reorder(item[0], order);
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);