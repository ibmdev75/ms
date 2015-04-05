<%
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/xml; charset=UTF-8"); 
%><?xml version="1.0" encoding="UTF-8"?><%
%><%--
  @Summary: Returns an Atom feed of the given Portlet Feed
  @Category: Web Service
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.7.3
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
  String feedFormat = "Atom1";
%><%@ include file="doFeedInit.jspf" %>
<jalios:cache id='<%= feedCacheId %>' disabled='<%= feedCacheDisabled %>'
              classes='<%= invalidClassArray %>' timeout='<%= box.getInvalidTime()  %>'
              session='<%= box.hasCacheSession() %>'>

<feed xmlns="http://www.w3.org/2005/Atom" xml:lang="<%= lang %>">
  <id><%= XmlUtil.normalize(ServletUtil.getUrl(request)) %></id>
	<title><%= XmlUtil.normalize(box.getContentTitle(lang)) %></title>
  <updated><%= DateUtil.formatW3cDate(new Date()) %></updated>
	<link rel="self" href="<%= ServletUtil.getUrl(request) %>" />
  <generator uri="http://www.jalios.com/" version="<%= JcmsInfo.RELEASE %>"><%= XmlUtil.normalize(channel.getJcmsInfo().getVersion()) %></generator>
  <jalios:if predicate='<%= Util.notEmpty(box.getCopyright()) %>'>
    <rights><%= XmlUtil.normalize(box.getCopyright()) %></rights>
  </jalios:if>
	
	<%@ include file='doUserFeedElementInit.jspf' %>
	<%@ include file='/jcore/portal/doPortletParams.jspf' %>
	<%@ include file='/types/PortletQueryForeach/doQuery.jspf' %>
	<%@ include file='/types/PortletQueryForeach/doSort.jspf' %>
	<%@ include file='/types/PortletQueryForeach/doForeachHeader.jspf' %>
	<%@ include file='doUserFeedElementHeader.jspf' %>
	
	<entry>
		<id><%= ServletUtil.getBaseUrl(request) %><jalios:url data='<%= itPub %>'/></id>
		<title><%= XmlUtil.normalize(itPub.getTitle(lang)) %></title>
    <updated><%= DateUtil.formatW3cDate(itPub.getMdate()) %></updated>
    <jalios:if predicate='<%= itPub.getAuthor() != null %>'><author>
      <name><%= XmlUtil.normalize(itPub.getAuthor().getFullName()) %></name>
       <jalios:if predicate='<%= itPub.getAuthor().isEmailVisible() && Util.notEmpty(itPub.getAuthor().getEmail()) %>'>
      <email><%= XmlUtil.normalize(itPub.getAuthor().getEmail()) %></email>
       </jalios:if>
    </author></jalios:if>
		<link rel="alternate" type="text/html" href="<%= ServletUtil.getBaseUrl(request) %><jalios:url data='<%= itPub %>'/>" />
		<summary type="html"><%= XmlUtil.normalize(renderPubAbstract(itPub, userLocale)) %></summary>
		<published><%= DateUtil.formatW3cDate(itPub.getCdate()) %></published>
	</entry>
	
	<%@ include file='doUserFeedElementFooter.jspf' %>
	<%@ include file='/types/PortletQueryForeach/doForeachFooter.jspf' %>
</feed>

</jalios:cache>
