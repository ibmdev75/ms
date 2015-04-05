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
  @Since: jcms-4.1
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
  String feedFormat = "Atom03";
%><%@ include file="doFeedInit.jspf" %>
<jalios:cache id='<%= feedCacheId %>' disabled='<%= feedCacheDisabled %>'
              classes='<%= invalidClassArray %>' timeout='<%= box.getInvalidTime()  %>'
              session='<%= box.hasCacheSession() %>'>

<feed version="0.3" xmlns="http://purl.org/atom/ns#" xml:lang="<%= lang %>">
	<title><%= XmlUtil.normalize(box.getContentTitle(lang)) %></title>
	<link rel="alternate" type="text/html" href="<%= ServletUtil.getBaseUrl(request) %>" />
	<modified><%= DateUtil.formatW3cDate(new Date()) %></modified>
	<tagline><%= XmlUtil.normalize(box.getDescription(lang)) %></tagline>
	<generator url="http://www.jalios.com/" version="<%= JcmsInfo.RELEASE %>"><%= XmlUtil.normalize(channel.getJcmsInfo().getVersion()) %></generator>
	<jalios:if predicate='<%= Util.notEmpty(box.getCopyright()) %>'>
		<copyright><%= XmlUtil.normalize(box.getCopyright()) %></copyright>
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
		<link rel="alternate" type="text/html" href="<%= ServletUtil.getBaseUrl(request) %><jalios:url data='<%= itPub %>'/>" />
		<jalios:if predicate='<%= itPub.getAuthor() != null %>'><author>
			<name><%= XmlUtil.normalize(itPub.getAuthor().getFullName()) %></name>
		   <jalios:if predicate='<%= itPub.getAuthor().isEmailVisible() && Util.notEmpty(itPub.getAuthor().getEmail()) %>'>
			<email><%= XmlUtil.normalize(itPub.getAuthor().getEmail()) %></email>
		   </jalios:if>
		</author></jalios:if>
		<summary type="text/html"><%= XmlUtil.normalize(renderPubAbstract(itPub, userLocale)) %></summary>
		<issued><%= DateUtil.formatW3cDate(itPub.getCdate()) %></issued>
		<modified><%= DateUtil.formatW3cDate(itPub.getMdate()) %></modified>
	</entry>
	
	<%@ include file='doUserFeedElementFooter.jspf' %>
	<%@ include file='/types/PortletQueryForeach/doForeachFooter.jspf' %>
</feed>

</jalios:cache>
