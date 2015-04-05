<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/reporting/data-report")) {
    sendForbidden(request, response);
    return;
  }

  request.setAttribute("title", glp("ui.adm.mn.reporting.data"));  
  request.setAttribute("dataReportSubAdminMenu", "true");  

%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><jalios:query name='wsSet' dataset='<%= channel.getDataSet(Workspace.class) %>'
              comparator='<%= Workspace.getOrderComparator(userLang) %>' /><%
%><%@ include file='/admin/doDataReport.jspf' %><%
%><%@ include file='/admin/doAdminFooter.jspf' %>