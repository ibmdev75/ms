<%--
  @Summary: WebPage display template
  @Category: WebPage
  @Deprecated: False
  @Customizable: True
  @Requestable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
  WebPage webpage = (WebPage)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
%>
<div class="fullDisplay WebPage">
  <div class="publication-header">
    <h1 class="publication-title" <%= gfla(webpage, "title") %>><%= webpage.getTitle(userLang) %></h1>
  </div>
  <div class="media">
    <jalios:if predicate='<%= Util.notEmpty(channel.getProperty("tag.thumbnail.thumbshot.url")) %>'>
     <div class="pull-left">
	     <a href="<%= webpage.getUrl() %>" title="<%= encodeForHTMLAttribute(webpage.getTitle(userLang)) %>">
	       <jalios:thumbnail css="img-thumbnail" url='<%= Util.getString(webpage.getUrlToShot(), webpage.getUrl()) %>' width='300' height='140'><span>?</span></jalios:thumbnail>
	     </a>
     </div>
    </jalios:if>
    <div class="media-body">
	    <% Publication pub = webpage; boolean displayCategory = true;%>
	    <%@ include file='/front/publication/doPublicationMeta.jspf' %> 
	           
      <div class="url br">
	      <a rel="external" href="<%= webpage.getUrl() %>"><%= webpage.getUrl() %></a>
      </div>
      <jalios:wiki data="<%= webpage %>" field="description"><%= webpage.getDescription(userLang) %></jalios:wiki>
    </div>
  </div><%-- EOF .media --%>
</div><%-- EOF .WebPage --%>