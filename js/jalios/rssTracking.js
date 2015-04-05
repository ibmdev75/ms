'Rss.tracking'._namespace( {
  
  doAjaxTracking : function(channelSource, itemId) {
    try {
      JcmsJsContext.getJsonRPC().JcmsJSONUtil.trackRss(Rss.tracking.trackRssCallBack, channelSource, itemId);
    } catch (ex) {
      alert(I18N.glp('warn.json.sessiontimeout'));
    }
    },
    trackRssCallBack : function() {
    // nothing to do
  },
  doTracking : function(linkElt, channelSource, itemId, htmlId) {
    linkElt.href = "types/PortletRSS/gotoRssPage.jsp?channelSource=" + encodeURIComponent(channelSource) + "&itemId=" + encodeURIComponent(itemId) + "&url=" + encodeURIComponent(linkElt.href);
    var dt = linkElt.fastUp("DT");
    if(!dt){
      dt = $(htmlId);
    }
    if(dt){
      dt.addClassName('readRssItem');
      dt.addClassName('readArticleRssItem');
      }
    return true;
  },

  displayContent : function(linkElt, channelSource, itemId, contentDiv, tagId, isTrackingEnabled, htmlId) {
    if (isTrackingEnabled) {
      var dt = linkElt.fastUp("DT");
      var dl = dt.fastUp("DL");
      $A(dl.children).each( function(item){
      $(item).removeClassName('currentRss');
      });
      dt.addClassName('readRssItem');
      dt.addClassName('currentRss');
    }
    var url = "types/PortletRSS/rssItemContent.jsp?channelSource=" + encodeURIComponent(channelSource) + "&itemId=" + encodeURIComponent(itemId) + "&tagId=" + encodeURIComponent(tagId) + "&isTrackingEnabled=" + encodeURIComponent(isTrackingEnabled)+"&htmlId="+encodeURIComponent(htmlId);
    JCMS.ajax.Refresh.refreshDIV(contentDiv, url);
  },
  
  displayFirstContent : function( channelSource, itemId, contentDiv, tagId, isTrackingEnabled, htmlId) {
    var container = contentDiv.fastUp("TR").select("TD.rssSidebar")[0];
    var dl = container.select(".RssItems")[0];
    var link = $(dl.children[0]).select("A", ".RssItemLink")[0];
    Rss.tracking.displayContent(link,  channelSource, itemId, contentDiv, tagId, isTrackingEnabled, htmlId);
  }
  
});