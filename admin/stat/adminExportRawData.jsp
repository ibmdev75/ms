<%@ include file='/jcore/doInitPage.jspf' %><%

  if (workspace == null || (!isAdmin && !isWSAdmin && !checkAccess("admin/reporting/stat-report") &&!checkAccess("admin-ws/reporting/stat-report"))) { 
    sendForbidden(request, response);
    return; 
  }

  request.setAttribute("title", glp("ui.adm.mn.chnl.stat")); 
  request.setAttribute("statSubAdminMenu", "true");

if (isAdmin){
  %><%@ include file='/admin/doAdminHeader.jspf' %><%
} else {
  %><%@ include file='/work/doWorkHeader.jspf' %><%
}

	boolean showWorkspace = isAdmin || checkAccess("admin/reporting/stat-report");
	boolean showReport    = true;
	boolean showModels    = true;
	StatReport targetReport = getDataParameter("id", StatReport.class);
  
%><%@ include file='/admin/stat/doExportRawData.jspf' %><%


if (isAdmin){
  %><%@ include file='/admin/doAdminFooter.jspf' %><%
} else {
  %><%@ include file='/work/doWorkFooter.jspf' %><%
}

%>