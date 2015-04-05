<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>

<% PortletQueryForeachDetail box = (PortletQueryForeachDetail) portlet;  %>
<% jcmsContext.addCSSHeader("css/jalios/ux/jalios-pqf.css"); %>

<%@ include file="../PortletQueryForeach/doQuery.jspf" %>
<%@ include file="../PortletQueryForeach/doSort.jspf" %>

<div class="row">
  
  <%@ include file="../PortletQueryForeach/doForeachHeader.jspf" %>
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
      <div class="thumbnail pqf-thumbnail">
        <%-- <jalios:link data="<%= itPub %>"><jalios:thumbnail data="<%= itPub %>" width="<%= JcmsConstants.THUMBNAIL_LARGE_WIDTH %>" height="<%= JcmsConstants.THUMBNAIL_LARGE_HEIGHT %>" /></jalios:link> --%>
        <%-- <a href="<%= itPub.getDataImage() %>" class="modal"><jalios:thumbnail data="<%= itPub %>" width="<%= JcmsConstants.THUMBNAIL_LARGE_WIDTH %>" height="<%= JcmsConstants.THUMBNAIL_LARGE_HEIGHT %>" /></a> --%>
        <div class="text-center">
          <jalios:media data="<%= itPub %>" maxWidth="1024" maxHeight="768" />
        </div>
        <% if (box.getShowAbstract()) { %>
            <div class="caption">
              <% if (box.getShowTitle()) { %>
              <h3 class="text-center"><jalios:link data="<%= itPub %>"><%= itPub.getTitle(userLang) %></jalios:link></h3>
              <% } %>
              <p><jalios:wiki><%= itPub.getAbstract(userLang) %></jalios:wiki></p>
            </div>
        <% } else { %>
            <% if (box.getShowTitle()) { %>
            <div class="br text-center"><jalios:link data="<%= itPub %>" /></div>
          <% } %>
        <% } %>
      </div>
    </div>
  
  <%@ include file="../PortletQueryForeach/doForeachFooter.jspf" %>
  
</div>

<%@ include file="../PortletQueryForeach/doPager.jspf" %>
