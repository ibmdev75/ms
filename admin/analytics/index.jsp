<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!(checkAccess("admin/operation/analytics") || checkAccess("admin-ws/operation/analytics"))) { 
    sendForbidden(request, response);
    return;
  }

  request.setAttribute("title", glp("ui.work.mn.analytics")); 
  request.setAttribute("allowWkspFilter", "false");
  // in admin header, which menu and sub menu must be bolded
  request.setAttribute("operationAdminMenu", "true");
  request.setAttribute("analyticsSubAdminMenu", "true");
  
%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %><%

	boolean showWorkspace = false;
 
%><%@ include file='/admin/analytics/doAnalyticsAdmin.jspf' %><%
%><%@ include file='/admin/doAdminFooter.jspf' %> 