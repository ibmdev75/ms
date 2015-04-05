 
!function ($) {
  
  var refresh = function(event){
    var refresh = event.refresh;
    $.console.debug("[refresh:%s] ", refresh.type, refresh.url , refresh.target, refresh.options);
  }
  
  // Debug function
  var debug = function(event){
    var broker = event.broker;
    $.console.debug("[DataBroker] [%s] trigger [%s] on [%s]", broker.source.type, broker.type , broker.target, broker.source);
  }
  
  // Register a logger
  var register = function(){
    $(document).on("jalios:broker",  debug);
    $(document).on("jalios:refresh", refresh);
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);