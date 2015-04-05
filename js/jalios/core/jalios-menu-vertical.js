!function ($) {

  var isReady = false;
  var ready = function() {
    // Must wait for all stuff to init things
    if (isReady) { return; }
    isReady = true;
    
    // Register to other ajax-refresh
    $(document).on('jalios:refresh', function(event){
    var refresh = $.jalios.Event.match(event, 'refresh', 'after')
      if (!refresh){ return; }
      setup();
    });

    // Then setup
    setup();
  }

  var setup = function() {
    // Change chevron icons 
    $('.jalios-menu-vertical', document).on('shown.bs.collapse hidden.bs.collapse', function(e) {
      var $panel = $(e.target);
      var $menu = $panel.closest('.jalios-menu-vertical')
      var toggleClass = $menu.data('jalios-collapse-toggle');
      var $submenuLink = $menu.find('A[href=#' + $panel.attr('id') + ']');
      $submenuLink.toggleClass('dropup');
      $submenuLink.find('.jalios-icon').toggleClass(toggleClass);
    });
  }

  // ------------------------------------------
  //  READY
  // ------------------------------------------

  // Plugin initialization on DOM ready
  $(document).on('jalios:ready', ready);

}(window.jQuery);