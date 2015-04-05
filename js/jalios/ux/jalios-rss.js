!function($) {
  
  var toggleRssItemDescription = function(event) {
  
    var $rssItem = $(this).closest("DIV");
    
    if (!$rssItem) {
      return;
    }
    
    var itemId = $rssItem.data("jalios-rss-itemid");
    var channelSource = $rssItem.data("jalios-rss-sourceid");
    
    if ($rssItem.hasClass("readRssItem")) {
    
      $rssItem.siblings("DIV.RssItemDescription").toggleClass("hide");
      
    } else {
      track(channelSource,itemId);
      $rssItem.addClass("readRssItem");
      $rssItem.siblings("DIV.RssItemDescription").toggleClass("hide");
    }
    
    return;
  };
  
   var markAsRead = function(event) {
    if (event.which !== 1 && event.which !== 2 ) {
      return;
    }
    
    var $rssItem = $(this).closest("DIV");
    
    if (!$rssItem) {
      return;
    }
    
    var channelSource = $rssItem.data("jalios-rss-sourceid");
    var itemId = $rssItem.data("jalios-rss-itemid");
    
    $rssItem.addClass("readArticleRssItem");
    track(channelSource,itemId);
      
    return;
  };
  
  var track = function(channelSource,itemId) {
    try {
      JcmsJsContext.getJsonRPC().JcmsJSONUtil.trackRss(callback, channelSource, itemId);
    } catch (ex) {
      alert(I18N.glp('warn.json.sessiontimeout'));
      return;
    }
  }
  
  var callback = function(value){
    // do nothing
  }

  var register = function(){
    $(document).on('click',".portlet-rss .rss-toggle", toggleRssItemDescription);
    $(document).on("mousedown",".portlet-rss .RssItemLink", markAsRead);
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);