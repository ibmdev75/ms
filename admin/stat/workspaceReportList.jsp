<%@ include file='/jcore/doInitPage.jspf' %><%

  if (workspace == null || !(checkAccess("admin/reporting/stat-report") || checkAccess("admin-ws/reporting/stat-report"))) { 
    sendForbidden(request, response);
    return;
  }

  request.setAttribute("title", glp("ui.work.mn.stat")); 
  request.setAttribute("adminReportingMenu", "true");
  request.setAttribute("allowWkspFilter", "false");
  
%><%@ include file='/work/doWorkHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %><%

	boolean showWorkspace = false;
	boolean showReport    = true;
	boolean showModels    = true;
	StatReport targetReport = getDataParameter("id", StatReport.class);
 
%><%@ include file='/admin/stat/doStatReportList.jspf' %><%
%><%@ include file='/work/doWorkFooter.jspf' %>