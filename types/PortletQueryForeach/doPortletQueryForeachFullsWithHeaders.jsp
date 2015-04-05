<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% PortletQueryForeach box = (PortletQueryForeach) portlet;  %>

<%@ include file="doQuery.jspf" %>
<%@ include file="doSort.jspf" %>


<% Publication displayedPub = null; %>
<%@ include file="doForeachHeader.jspf" %>
  <%           
  if (itPub instanceof com.jalios.jcms.portlet.PortalElement) {
    %><jalios:include pub="<%= itPub %>" /><hr /><%
  } else {
    displayedPub = itPub;
    request.setAttribute("isInContentFullDisplay", Boolean.TRUE);
    Publication publication = itPub;
    Publication pub = itPub;
    boolean hideSelectionSide = false;
  %>
    <div class="selection-wrapper pub-action-toggler">
      <% { %>
      <div class="selection-header"> 
        <%@ include file="/jcore/doDisplayHeader.jspf" %> 
      </div> 
      <% 
        hideSelectionSide = Util.toBoolean(request.getAttribute("jcms.publication.actions.hide"),false);
        String selectionMainClasses = hideSelectionSide ? " wide" : ""; 
      %>      
      <div class="selection-body"> 
        <div class="selection-side"> 
          <jalios:include jsp="<%= ResourceHelper.getPublicationAction() %>" />
        </div>
        <div class="selection-main<%= selectionMainClasses %>"></div>
        <jsp:include page='<%= "/"+itPub.getTemplatePath(jcmsContext) %>' flush="true" />
      </div>
      <% } %>
      <div class="selection-footer"> 
        <% { %><%@ include file="/jcore/doDisplayFooter.jspf" %><% } %>
      </div>
    </div>
    <hr />
    <% request.removeAttribute("isInContentFullDisplay"); %>
  <% } // End else  %>
<%@ include file="doForeachFooter.jspf" %>
<% request.setAttribute("doPortletQueryForeachFulls.publication", displayedPub); %>
<%@ include file="doPager.jspf" %>

