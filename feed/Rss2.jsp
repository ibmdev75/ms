<%
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/xml; charset=UTF-8"); 
%><?xml version="1.0" encoding="UTF-8"?><%
%><%--
  @Summary: Returns an RSS 2.0 feed of the given Portlet Feed
  @Category: Web Service
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-4.1
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
  String feedFormat = "Rss2";
%><%@ include file="doFeedInit.jspf" %>
<jalios:cache id='<%= feedCacheId %>' disabled='<%= feedCacheDisabled %>'
              classes='<%= invalidClassArray %>' timeout='<%= box.getInvalidTime()  %>'
              session='<%= box.hasCacheSession() %>'>

<rss version="2.0">
<channel>
	<title><%= XmlUtil.normalize(box.getContentTitle(lang)) %></title>
	<link><%= ServletUtil.getBaseUrl(request) %></link>
	<description><%= XmlUtil.normalize(box.getDescription(lang)) %></description>
	<language><%= lang %></language>
	<lastBuildDate><%= DateUtil.formatRfc822Date(new Date()) %></lastBuildDate>
	<generator><%= XmlUtil.normalize(channel.getJcmsInfo().getVersion()) %> (http://www.jalios.com/)</generator>
	<jalios:if predicate='<%= Util.notEmpty(box.getCopyright()) %>'>
		<copyright><%= XmlUtil.normalize(box.getCopyright()) %></copyright>
	</jalios:if>

	<%@ include file='doUserFeedElementInit.jspf' %>
	<%@ include file='/jcore/portal/doPortletParams.jspf' %>
	<%@ include file='/types/PortletQueryForeach/doQuery.jspf' %>
	<%@ include file='/types/PortletQueryForeach/doSort.jspf' %>
	<%@ include file='/types/PortletQueryForeach/doForeachHeader.jspf' %>
	<%@ include file='doUserFeedElementHeader.jspf' %>
	
	<item>
		<guid><%= ServletUtil.getBaseUrl(request) %><jalios:url data='<%= itPub %>'/></guid>
		<title><%= XmlUtil.normalize(itPub.getTitle(lang)) %></title>
		<link><%= ServletUtil.getBaseUrl(request) %><jalios:url data='<%= itPub %>'/></link>
		<jalios:if predicate='<%= itPub.getAuthor() != null && itPub.getAuthor().isEmailVisible() && Util.notEmpty(itPub.getAuthor().getEmail()) %>'>
			<author><%= XmlUtil.normalize(itPub.getAuthor().getEmail()) %></author>
		</jalios:if>
		<description><%= XmlUtil.normalize(renderPubAbstract(itPub, userLocale)) %></description>
		<pubDate><%= DateUtil.formatRfc822Date(itPub.getCdate()) %></pubDate>
	</item>
	
	<%@ include file='doUserFeedElementFooter.jspf' %>
	<%@ include file='/types/PortletQueryForeach/doForeachFooter.jspf' %>
	
</channel>
</rss>

</jalios:cache>
