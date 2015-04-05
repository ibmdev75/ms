!function ($) {
  // Action regexp
  var pattern = /sqlquery/i;
  
  var callback = function(event) {
    var broker = $.jalios.Event.match(event, 'broker', pattern, true);
    if (!broker){ return; }
    
    var options = broker.options;
    
    var $elm = $(broker.source.currentTarget);
    var $widget = $elm.getWidget();
    
    options.dataSource = $widget.find('.sqlquery-ds').val();
    options.maxRows = $widget.find('.sqlquery-maxrows').val();
    options.sqlQuery = $widget.find('.sqlquery-query').val();
    
    var chsrUrl = 'work/checkSQLQuery.jsp?';
    // Add query string
    chsrUrl = chsrUrl + $.param(options, true);
    // Add context path to complete the URL
    chsrUrl = $.jalios.Http.getContextPath() + '/' + chsrUrl;
    
    // Compute chooser dimension
    var popupWidth = $.jalios.Properties.get('sqlquery.check-popup.width') || 930;
    var popupHeight = $.jalios.Properties.get('sqlquery.check-popup.height') || 570;
    
    $.jalios.Browser.popupWindow(chsrUrl, 'SqlQuery', popupWidth, popupHeight, false, true, true, true, false, false);
  }
  
  var register = function() {
    // Register to broker
    $(document).on("jalios:broker", callback);
  }
  
  // Initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);