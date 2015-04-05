<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.rss.RssManager" %><%

  String channelSource = getUntrustedStringParameter("channelSource", null); // URL of the rss page
  String itemId = getAlphaNumParameter("itemId", null); // == buildID() ; cf doPortletRSSFulDisplay.jsp
  String url = null;
  %><jalios:rss id="gotoRssPage.jsp" name="rssChannel" source='<%= channelSource %>'/><%
  if(rssChannel != null){
	  for(com.jalios.util.RssItem rssItem: rssChannel.getItemList()){  
	  	String tmpItemId = Util.buildID(rssItem.getGuid());
	  	if(tmpItemId.equals(itemId)){
	  	  url = rssItem.getLink();
	  	  break;
	  	}
	  }
  }
  
  if(Util.notEmpty(url)){
  	RssManager.getInstance().processRssTrackingEvent(loggedMember, channelSource, itemId, true);
  	JcmsContext.sendRedirect(url, false, request, response);
  }
  else{
    %>Cannot retrieve RSS url with channel source '<%=encodeForHTML(channelSource)%>' and itemId '<%=encodeForHTML(itemId)%>'<%
  }
 
%>