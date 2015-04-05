<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% PortletQueryForeachDetail box = (PortletQueryForeachDetail) portlet;  %>

<%@ include file="../PortletQueryForeach/doQuery.jspf" %>
<%@ include file="../PortletQueryForeach/doSort.jspf" %>

<div class="pqf-dashboard">
  <ul class="item-box">
    <%@ include file="../PortletQueryForeach/doForeachHeader.jspf" %>
      <% 
      if (itPublicationCounter.intValue() == (box.getSkipFirstResults() + 1)) {
        jcmsContext.setTemplateUsage(TypeTemplateEntry.USAGE_DISPLAY_FULL);
        String displayTemplate = "/" + itPub.getTemplatePath(jcmsContext);
        if (itPub instanceof FileDocument) {
          request.setAttribute("details", "true");
        }
        %><li class="item"><jsp:include page="<%= displayTemplate %>" flush="true" /></li><%
        if (itPub instanceof FileDocument) {
          request.removeAttribute("details");
        }
      } else { 
        %><%@ include file="doSimpleBoxInner.jspf" %><%
      }
      %>
    <%@ include file="../PortletQueryForeach/doForeachFooter.jspf" %>
  </ul>
</div>

<%@ include file="../PortletQueryForeach/doPager.jspf" %>