<%@page import="com.jalios.jcms.rss.RssTracker"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file='/jcore/portal/doPortletParams.jspf'%>
<%
  PortletRSS box = (PortletRSS) portlet;
  RssManager rssManager = RssManager.getInstance();
  String rssSource = (String) box.getFieldValue(jcmsContext, "source"); // box.getSource()
  int rssMaxItems = box.getIntFieldValue(jcmsContext, "maxItems"); // box.getMaxItems()
  String rssId = box.getId() + Util.buildID(rssSource);
  boolean isTrackingEnabled = box.getBooleanFieldValue(jcmsContext, "trackingEnabled");
  Set<RssEventListener> listeners = rssManager.getDefaultListeners();
  if (isTrackingEnabled) {
    listeners.add(rssManager.getRssTrackerListener());
  }
  
  jcmsContext.addCSSHeader ("css/jalios/ux/jalios-rss.css");
  jcmsContext.addJavaScript("js/jalios/ux/jalios-rss.js"); 
%>
<%@ page import="com.jalios.jcms.rss.RssManager" %>
<jalios:rss id="<%= rssId %>" name="rssChannel" source='<%= rssSource %>'
            ufreq='<%= box.getRefresh() / 60 %>' eventListeners="<%= listeners %>" />
<%
  if (rssChannel == null) {
    //request.setAttribute("ShowPortalElement",Boolean.FALSE);
    out.println(glp("ui.portlet-rss.invalid-feed"));
    return;
  }
  String rssSourceId = rssChannel.getId();

  String linkTarget = box.getOpenLinksInNewWindow() ? "target='_blank'" : "";

  // Refresh
  boolean showRefreshBtn = (jcmsContext.isEditIcon() && isAdmin) ? true : false;
  
  boolean showImage = box.getShowImage() && Util.notEmpty(rssChannel.getImageUrl());
  boolean showTitle = box.getShowTitle();
  boolean showDescription = box.getShowDescription() && Util.notEmpty(rssChannel.getDescription());
  boolean showWebMastersEmail = box.getShowWebMastersEmail() && Util.notEmpty(rssChannel.getWebMaster());
  
  boolean showRSSInfo = showImage || showTitle || showDescription || showWebMastersEmail;
  
  String refreshURL = ServletUtil.getUrlWithUpdatedParam(request, "rss." + rssId + ".refresh", "true");
%>
<div class="portlet-rss" data-jalios-rss-sourceid="<%= rssSourceId %>">
<% if (showRSSInfo) { %>
<div class='RssInfo'>
 <%-- Image --%>
 <% if (showImage) { %>
  <a class='RssLogo' href='<%= rssChannel.getImageLink() %>' <%=linkTarget %>>
   <jalios:icon src='<%= rssChannel.getImageUrl() %>'  alt='<%=rssChannel.getImageTitle()%>'  />
  </a>
 <% } %>

 <%-- Title --%>
 <% if (showTitle) { %>
  <% if (Util.notEmpty(rssChannel.getLink())) { %>
   <a class='RssTitle' href='<%= rssChannel.getLink() %>' <%= linkTarget %>>
    <%= rssChannel.getTitle() %>
   </a>
  <% } else { %>
   <div class='RssTitle'><%= rssChannel.getTitle() %></div>
  <% } %>
 <% } %>

 <%-- Description --%>
 <% if (showDescription) { %>
  <div class='RssDescription'><%= rssChannel.getDescription() %></div>
 <% } %>
 
 <%-- WebMastersEmail --%>
 <% if (showWebMastersEmail) { %>
  <a class='RssWebMaster' href='mailto:<%= rssChannel.getWebMaster() %>'><%= rssChannel.getWebMaster() %></a>
 <% } %>
 
</div>
<% } %>

<%
RssManager manager = RssManager.getInstance();
Set<RssTracker> trackersSet = manager.getSessionRssTrackerSet(loggedMember);
%>
<ul class="item-box">
 <jalios:foreach collection='<%= rssChannel.getItemList() %>'
                 type='com.jalios.util.RssItem' name='rssItem' max='<%= rssMaxItems %>'
                 skip='<%= box.getSkipFirstItems() %>'>
  <%
    boolean showItemDesc = box.getShowItemsDescription() && Util.notEmpty(rssItem.getDescription()) && (rssItem.getDescription().length() < 5000);
    String htmlItemId = Util.buildID("rss" + itCounter + "_" + rssId + "_" + rssItem.getGuid());
    String itemId = Util.buildID(rssItem.getGuid());
    Date itemPubDate = rssItem.getParsedPubDate();
    RssTracker tracker = RssManager.getInstance().isRead(loggedMember, rssSource, itemId, trackersSet);        
    boolean isRead = isTrackingEnabled && tracker != null;
    boolean isArticleRead = isTrackingEnabled && tracker != null && tracker.isArticleRead();
    
  %><%@ include file="rssItemClean.jspf" %>
  <li>
   <jalios:include target="PORTLET_RSS_ITEM_1"/>
   <div data-jalios-rss-itemid="<%= itemId %>" data-jalios-rss-sourceid="<%= rssSourceId %>" class="rss-meta <%= isRead ? "readRssItem" : "" %> <%= isArticleRead ? "readArticleRssItem" : "" %>">
       <%-- Item Description link --%>
       <jalios:include target="PORTLET_RSS_ITEM_2" />
       <% if (showItemDesc) { %>
        <a href="#" class="pull-right rss-toggle" onclick="return false;"><jalios:icon src='expand-down' alt='expand'  /></a>
       <% } %>
            <% Date itemDate = itemPubDate; %>
            <%@ include file="/jcore/doItemBoxDate.jspf" %>
       <%-- Item Link --%>
        <a href='<%= "types/PortletRSS/gotoRssPage.jsp?channelSource=" + rssSourceId + "&amp;itemId=" + itemId + "&amp;url=" + rssItem.getLink() %>' class='RssItemLink' <%= linkTarget %>>
          <%= rssItemTitle %>
        </a>
    </div>
	  <%-- Item hidden Description --%>
	  <% if (showItemDesc) { %>
	   <div id='<%= htmlItemId %>' class="RssItemDescription hide">
	     <%= rssItemDescription %>
	   </div>
	  <% } %>   
    <jalios:include target="PORTLET_RSS_ITEM_3"/>
  </li>
 </jalios:foreach>
 </ul>
</div>

<div class="item-box-footer">
  <a class="ajax-refresh ajax-action" href='<%= refreshURL %>' ><%= glp("ui.com.btn.refresh") %></a>
</div>