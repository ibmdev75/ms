<%@ include file='/jcore/doInitPage.jspf'%><%
%><%@ page import="com.jalios.util.*" %><%
%><%@ page import="com.jalios.jtaglib.RssCacheManager" %><%
%><%@ page import="com.jalios.jcms.rss.RssManager" %><%

  String channelSource = Util.getString(request.getAttribute("rssSourceId"),""); // ENCODE!!! == rssSourceId : cf RssChannel.generatedId() which may contains anything if strlength < maxLength
  String sourceId = Util.buildID(channelSource);
  String itemId = Util.getString(request.getAttribute("itemId"),""); // == buildID() ; cf doPortletRSSFulDisplay.jsp
  String tagId = Util.getString(request.getAttribute("tagId"),""); // == "rss."+box.getId()+buildID(itemId) ; cf doPortletRSSFulDisplay.jsp
  String htmlId = Util.getString(request.getAttribute("htmlId"),""); // == buildID() ; cf doPortletRSSFulDisplay.jsp
  String cacheId = tagId + sourceId;
  
  RssChannel rssChannel = RssCacheManager.getRssChannel(cacheId);
  RssItem rssItem = null;
  String errorMsg = null;
  
  // Find the RssItem being displayed
  if (rssChannel == null) {
    errorMsg = glp("ui.portlet-rss.invalid-rss-source", cacheId);
  }
  else {
    if (Util.isEmpty(rssChannel.getItemList())) {
      errorMsg = glp("ui.portlet-rss.empty-items list", cacheId);
    }
    for (RssItem item : rssChannel.getItemList()) {
      if (Util.buildID(item.getGuid()).equals(itemId)) {
        rssItem = item;
        break;
      }
    }
    if (rssItem == null) {
      errorMsg =  glp("ui.portlet-rss.invalid-rss-item", itemId) ;
    }
  }
  boolean isTrackingEnabled = Util.toBoolean(request.getAttribute("isTrackingEnabled"),false);
  if(isTrackingEnabled){
    RssManager.getInstance().processRssTrackingEvent(loggedMember, channelSource, itemId, true);
  }
  String rssSourceId = rssChannel != null ? rssChannel.getId() : "";
  
%><%@ include file="rssItemClean.jspf" %>
<div>
<% 
  // Output error message if any otherwise output RssItem
  if (errorMsg != null) {
    %><%= errorMsg %><%
  } else {
%>
    <h3 class="rssItemContentTitleDiv">
	    <div class="rssItemContentTitle">
	     <jalios:image clazz="icon16" src="<%= FaviconManager.getInstance().getIcon(rssItem.getLink()) %>" height="16px"/>    
	     <a href="<%= rssItem.getLink()%>" target="_blank">
	     <%= rssItemTitle %></a>
	    </div>
    </h3>
    <div class="rssMeta"><%= JcmsUtil.getFriendlyDate(rssItem.getPublicationDate(), DateFormat.SHORT, true, userLocale) %></div>
    <div class="rssItemContentArticle">
     <%= rssItemDescription %>
    </div>
<% } %>
</div>