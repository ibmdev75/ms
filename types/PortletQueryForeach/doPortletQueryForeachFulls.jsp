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
    %><jsp:include page='<%= "/"+itPub.getTemplatePath(jcmsContext) %>' flush="true" /><hr /><%
    request.removeAttribute("isInContentFullDisplay");
  }
  %>
<%@ include file="doForeachFooter.jspf" %>
<%
request.setAttribute("doPortletQueryForeachFulls.publication", displayedPub); 
%>
<%@ include file="doPager.jspf" %>
