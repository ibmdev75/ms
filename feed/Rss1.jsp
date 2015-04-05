<%
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/xml; charset=UTF-8"); 
%><?xml version="1.0" encoding="UTF-8"?><%
%><%--
  @Summary: Returns an RSS 1.0 feed (rdf) of the given Portlet Feed
  @Category: Web Service
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-4.1
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
  String feedFormat = "Rss1";
%><%@ include file="doFeedInit.jspf" %>
<jalios:cache id='<%= feedCacheId %>' disabled='<%= feedCacheDisabled %>'
              classes='<%= invalidClassArray %>' timeout='<%= box.getInvalidTime()  %>'
              session='<%= box.hasCacheSession() %>'>

<rdf:RDF 
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns="http://purl.org/rss/1.0/"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
>
	<%@ include file='doUserFeedElementInit.jspf' %>
	<%@ include file='/jcore/portal/doPortletParams.jspf' %>
	<%@ include file='/types/PortletQueryForeach/doQuery.jspf' %>
	<%@ include file='/types/PortletQueryForeach/doSort.jspf' %>
	
	<channel rdf:about="<%= ServletUtil.getBaseUrl(request) %>">
		<title><%= XmlUtil.normalize(box.getContentTitle(lang)) %></title>
		<link><%= ServletUtil.getBaseUrl(request) %></link>
		<description><%= XmlUtil.normalize(box.getDescription(lang)) %></description>
    <dc:date><%= DateUtil.formatW3cDate(new Date()) %></dc:date>
		<dc:creator><%= XmlUtil.normalize(channel.getJcmsInfo().getVersion()) %> (http://www.jalios.com/)</dc:creator>
		<jalios:if predicate='<%= Util.notEmpty(box.getCopyright()) %>'>
			<dc:right><%= XmlUtil.normalize(box.getCopyright()) %></dc:right>
		</jalios:if>
		<items>
			<rdf:Seq>
	<% ArrayList pubsList = new ArrayList(); %>
	<%@ include file='/types/PortletQueryForeach/doForeachHeader.jspf' %>
				<% pubsList.add(itPub); %>
        <rdf:li resource="<%= ServletUtil.getBaseUrl(request) %><jalios:url data='<%= itPub %>'/>" />
	<%@ include file='/types/PortletQueryForeach/doForeachFooter.jspf' %>
			</rdf:Seq>
		</items>
	</channel>
  
<%
    int i = 0;
		for (Iterator it = pubsList.iterator() ; it.hasNext() ; i++) {
			Publication itPub =  (Publication) it.next();
      Integer itPublicationCounter = new Integer(i+1);
%>
	<%@ include file='doUserFeedElementHeader.jspf' %>
	<item rdf:about="<%= ServletUtil.getBaseUrl(request) %><jalios:url data='<%= itPub %>'/>">
    <title><%= XmlUtil.normalize(itPub.getTitle(lang)) %></title>
    <link><%= ServletUtil.getBaseUrl(request) %><jalios:url data='<%= itPub %>'/></link>
    <description><%=XmlUtil.normalize(renderPubAbstract(itPub, userLocale)) %></description>
  </item>
	<%@ include file='doUserFeedElementFooter.jspf' %>
<%
		}
%>
</rdf:RDF>

</jalios:cache>
