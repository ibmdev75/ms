<%@ include file='/jcore/doInitPage.jspf' %><% 

  if (workspace == null || !checkAccess("admin/reporting/stat-report")) { 
    sendForbidden(request, response);
    return;
  }
  request.setAttribute("title", glp("ui.adm.mn.chnl.stat")); 
  request.setAttribute("statSubAdminMenu", "true");

%><%@ include file='/admin/doAdminHeader.jspf' %><%

	boolean showWorkspace = true;
	boolean showReport    = true;
	boolean showModels    = true;
	StatReport targetReport = getDataParameter("id", StatReport.class);

%><%@ include file='/admin/stat/doStatReportList.jspf' %><%
%><%@ include file='/admin/doAdminFooter.jspf' %>
