<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% 
  PortletQueryForeach box = (PortletQueryForeach) portlet;
  jcmsContext.setTemplateUsage(TypeTemplateEntry.USAGE_DISPLAY_QUERY);  
%>
<%@ include file="doQuery.jspf" %>
<%@ include file="doSort.jspf" %>
<%@ include file="doForeachHeader.jspf" %>
  <jsp:include page='<%= "/"+itPub.getTemplatePath(jcmsContext) %>' flush="true" />
<%@ include file="doForeachFooter.jspf" %>
<%@ include file="doPager.jspf" %>