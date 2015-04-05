<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/jcore/portal/doPortletParams.jspf" %>
<% PortletQueryForeach box = (PortletQueryForeach) portlet;  %>

<%@ include file="doQuery.jspf" %>
<%@ include file="doSort.jspf" %>

<%@ include file="doForeachHeader.jspf" %>
<% 
  if (itPublicationCounter.intValue() == (box.getSkipFirstResults() + 1)) {
    jcmsContext.setTemplateUsage(TypeTemplateEntry.USAGE_DISPLAY_FULL);
    String displayTemplate = "/" + itPub.getTemplatePath(jcmsContext);
    if (itPub instanceof FileDocument) {
      request.setAttribute("details", "true");
    }
    %><jsp:include page="<%= displayTemplate %>" flush="true" /><hr /><%
    if (itPub instanceof FileDocument) {
      request.removeAttribute("details");
    }
  } else {
    jcmsContext.setTemplateUsage(TypeTemplateEntry.USAGE_DISPLAY_QUERY);
    String displayTemplate = "/" + itPub.getTemplatePath(jcmsContext);
    if (itPub instanceof FileDocument) {
      request.setAttribute("details", "true");
    }
    %><jsp:include page="<%= displayTemplate %>" flush="true" /><hr /><%
    if (itPub instanceof FileDocument) {
      request.removeAttribute("details");
    }
  } 
%>
<%@ include file="doForeachFooter.jspf" %>
<%@ include file="doPager.jspf" %>