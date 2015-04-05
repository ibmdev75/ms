<%@page import="com.jalios.jcms.rss.RssTracker"%>
<%@ include file='/jcore/doInitPage.jspf'%>
<%@ include file='/jcore/portal/doPortletParams.jspf'%>
<%@page import="com.jalios.jcms.rss.RssManager"%><%

// Required CSS and JS
jcmsContext.addCSSHeader("css/resizableTable.css");
jcmsContext.addJavaScript("js/resizableTable.js");

  jcmsContext.addCSSHeader ("css/jalios/ux/jalios-rss.css");
  jcmsContext.addJavaScript("js/jalios/ux/jalios-rss.js"); 
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
  String rssIdShort = Util.buildID("rss_" + Util.getString((String)request.getAttribute("jcmsplugin.virtualdesktop.service-id"), box.getId()));
%>
<jalios:rss id="<%= rssId %>" name="myRssChannel" source='<%= rssSource %>' ufreq='<%= box.getRefresh() / 60 %>' eventListeners="<%= listeners %>" />
<%
  if (myRssChannel == null) {
    //request.setAttribute("ShowPortalElement",Boolean.FALSE);
    out.println(glp("ui.portlet-rss.invalid-feed"));
    return;
  }
  String rssSourceId = myRssChannel.getId();

  String linkTarget = box.getOpenLinksInNewWindow() ? "target='_blank'" : "";

  // Refresh
  boolean showRefreshBtn = (jcmsContext.isEditIcon() && isAdmin) ? true : false;
  String refreshButtonURL = ServletUtil.getUrlWithUpdatedParam(request, "rss." + rssId + ".refresh", "true");
  String refreshButtonTooltip = glp("ui.portlet-rss.force-refresh", (new SimpleDateFormat(glp("date-time-format"))).format(myRssChannel.getLastUpdate()), DateUtil.formatDuration(myRssChannel.getUfreq() * 60 * 1000, userLocale));
%>
<jalios:buffer name="refreshBuffer"><% if (showRefreshBtn) { %><a href="<%=refreshButtonURL %>" class="ajax-refresh ajax-action" title="<%= encodeForHTMLAttribute(refreshButtonTooltip) %>"><jalios:icon src='refresh' alt='Refresh'/></a><% } %></jalios:buffer>
<jalios:javascript>
  if (JCMS.resizable && JCMS.resizable.panel && Object.isUndefined(JCMS.resizable.panel.<%= rssIdShort %>)) {
    JCMS.resizable.panel.<%= rssIdShort %> = new JCMS.resizable.panel.ResizableTable('<%= rssIdShort %>');
  }
</jalios:javascript>
<div class="row portlet-rss" id="<%= rssIdShort %>">
	<div class="col-md-3 rss-sidebar" id="<%= rssIdShort %>Sidebar" >
		 <div class="rss-items-header">
		 <jalios:if predicate='<%= box.getShowImage() && Util.notEmpty(myRssChannel.getImageUrl()) %>'>
		  <a class='RssLogo' href='<%= myRssChannel.getImageLink() %>' <%= linkTarget %>>
				<jalios:icon src='<%= myRssChannel.getImageUrl() %>'  alt='<%= myRssChannel.getImageTitle() %>' />
		  </a>
		  <%= refreshBuffer %><% refreshBuffer = ""; %>
		 </jalios:if>
		 <jalios:if predicate='<%= box.getShowTitle() %>'>
      <% if (Util.notEmpty(myRssChannel.getLink())) {%>
       <a class='RssTitle' href='<%= myRssChannel.getLink() %>' <%= linkTarget %>><%= myRssChannel.getTitle() %></a>
      <% } else { %>
       <div class='RssTitle'><%= myRssChannel.getTitle() %></div>
      <% } %>
      <%= refreshBuffer %><% refreshBuffer = ""; %>
     </jalios:if>
    </div>
    <div class='rss-items-body'>
			<ul class="item-box">
      <%boolean isFirstDisplayed = false;
      RssManager manager = RssManager.getInstance();
      Set<RssTracker> trackersSet = manager.getSessionRssTrackerSet(loggedMember); %>
      <jalios:foreach collection='<%= myRssChannel.getItemList() %>'
                      type='com.jalios.util.RssItem' name='itRss' max='<%= rssMaxItems %>'
                      skip='<%= box.getSkipFirstItems() %>'>
      <%
        boolean showItemDesc = box.getShowItemsDescription() && Util.notEmpty(itRss.getDescription()) && (itRss.getDescription().length() < 5000);
        String htmlItemId = Util.buildID("rss" + itCounter + "_" + rssId + "_" + itRss.getGuid());
        String itemId = Util.buildID(itRss.getGuid());
        Date itemPubDate = itRss.getParsedPubDate();
        RssTracker tracker = manager.isRead(loggedMember, rssSource, itemId, trackersSet);        
        boolean isRead = isTrackingEnabled && tracker != null;
        boolean isArticleRead = isRead && tracker.isArticleRead();
        boolean isArticleClicked = itemId.equals(getAlphaNumParameter("displayItemId",""));
      %>
		  <li>
      <div class='<%= isRead ? "readRssItem" : "" %> <%= isArticleRead || isArticleClicked ? "readArticleRssItem" : "" %>' data-jalios-rss-itemid="<%= itemId %>" data-jalios-rss-sourceid="<%= rssSourceId %>" id='<%=htmlItemId%>'>
        <% Date itemDate = itemPubDate; %>
        <%@ include file="/jcore/doItemBoxDate.jspf" %>
       <a class='RssItemLink ajax-refresh' href="types/PortletRSS/doPortletRSSFullDisplay.jsp?displayItemId=<%= itemId %>&amp;htmlItemId=<%= htmlItemId %>" onclick="return false;">
         <%=itRss.getTitle()%>
       </a>
      </div>
      </li>
     </jalios:foreach>
     </ul>
     </div><%-- EOF .item-box --%>
	</div><%-- EOF .rss-sidebar --%>
  <div class="col-md-9 contentContainer" id="<%= rssIdShort %>ContentDiv">
    <%
        RssItem firstItem = Util.getFirst(myRssChannel.getItemList());
        request.setAttribute("rssSourceId",rssSourceId);
        request.setAttribute("itemId",getAlphaNumParameter("displayItemId",Util.buildID(firstItem.getGuid())));
        request.setAttribute("tagId","rss."+rssId);
        request.setAttribute("htmlItemId",getAlphaNumParameter("htmlItemId",Util.buildID("rss" + 0 + "_" + rssId + "_" + firstItem.getGuid())));
        request.setAttribute("isTrackingEnabled",isTrackingEnabled);
    %>
		<jalios:include jsp='/types/PortletRSS/rssItemContent.jsp'/> 
		
    <%-- Description --%>
    <jalios:if predicate='<%= box.getShowDescription() && Util.notEmpty(myRssChannel.getDescription()) %>'>
     <div class='RssDescription alert alert-info'><%=myRssChannel.getDescription()%></div>
     <%= refreshBuffer %><% refreshBuffer = ""; %>
    </jalios:if>
    
    <%-- WebMastersEmail --%>
    <jalios:if predicate='<%= box.getShowWebMastersEmail() && Util.notEmpty(myRssChannel.getWebMaster()) %>'>
      <a class='RssWebMaster' href='mailto:<%=myRssChannel.getWebMaster()%>'><%= myRssChannel.getWebMaster() %></a>
      <%= refreshBuffer %><% refreshBuffer = "";%>
    </jalios:if>
    <%= refreshBuffer %>  
  </div>
</div>