<%--
  @Summary: Portlet Feed display page
  @Author: Olivier Jaquemet
  @Customizable: True
  @Requestable: False
--%><%
%><%@ page import="com.jalios.jcms.authentication.handlers.AuthKeyAuthenticationHandler" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

  PortletFeed box = (PortletFeed) portlet;
  
  // Refine on current or portal category
  String ccat = "";
  String pcat = "";
  if ("Current".equals(box.getRefineQueries())) {
    ccat = "&amp;ccat="+currentCategory.getId();
  }
  else if ("Portal".equals(box.getRefineQueries())) {
    pcat = "&amp;pcat="+portalCategory.getId();
  }
  
%>
<div>
 <jalios:foreach array="<%= box.getFormats()%>" name="itString" type="String" >
  <%
    String feedUrl = "feed/" + itString + ".jsp?id=" + box.getId()+ pcat + ccat;
    if (isLogged && (box.getUseAuthKey() || channel.isAuthenticationRequired())) {
      feedUrl = ServletUtil.getBaseUrl(request) + feedUrl; // change to absolute url as required for authKey
      feedUrl = AuthKeyAuthenticationHandler.getUrlWithAddedAuthKeyParam(feedUrl, loggedMember, 0); // no expiration for this authKey
    }

    String format = itString.toLowerCase().indexOf("rss")  < 0 ? null   : "rss";
           format = itString.toLowerCase().indexOf("atom") < 0 ? format : "atom";

	  StringBuffer rssLinks = new StringBuffer(300);
	  rssLinks.append("<link rel='alternate' type='application/"+format+"+xml' ");
	  rssLinks.append(" title='")
	          .append(encodeForHTMLAttribute(channel.getName())).append(" - ")
	          .append(encodeForHTMLAttribute(box.getTitle(userLang)))
	          .append(" (").append(itString).append(")' ");
	  rssLinks.append(" href='").append(feedUrl).append("' />");
	  jcmsContext.addCustomHeader(rssLinks.toString());
  %>
  <a href='<%= feedUrl %>'><jalios:icon src='<%= "feed-" + itString %>'/></a>
 </jalios:foreach>
</div>