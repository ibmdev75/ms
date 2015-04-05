<%@ include file='/jcore/doInitPage.jspf' %>
<%
	if (!isLogged){
		sendRedirect("front/forbidden.jsp", request, response);
		return;
	}

	PortletStatReport report     = getDataParameter("report", PortletStatReport.class);
	Workspace         reportWS   = getWorkspaceParameter("wsreport");
	long              reportDate = getLongParameter("datereport", 0);
	
	
	if (report == null){
		sendRedirect("front/forbidden.jsp", request, response);
		return;
	}
	
	if (reportWS == null && !(isAdmin || checkAccess("admin/reporting/stat-report"))){
		sendRedirect("front/forbidden.jsp", request, response);
		return;
	}
	
	Map<String, Object> context =  new HashMap<String, Object>();
	context.put(AccessControlConstants.CTXT_WORKSPACE, reportWS);	
	if (reportWS != null && !(reportWS.isAdmin(loggedMember)|| checkAccess("admin/reporting/stat-report") || AccessControlManager.getInstance().checkAccess(loggedMember, "admin-ws/reporting/stat-report", context))) {
		sendRedirect("front/forbidden.jsp", request, response);
		return;
	}
	
	String folderWS = reportWS == null ? StatListener.ALL_WORKSPACE : reportWS.getId();
	
	// Force baseUri to target Prod
	String prodBaseUri = channel.getProperty("statreporter.baseUri");
	if (Util.notEmpty(prodBaseUri)){
	  request.setAttribute("baseUrl", prodBaseUri);
	}
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<% 

  String reportPath = JcmsConstants.STATS_REPORT_DIR + folderWS + "/" + report.getId() + "/" +StatManager.getStatReportFile(reportDate); 
  File   reportFile = new File(channel.getRealPath(reportPath));
  
  if (reportFile.exists()){
    %><jalios:include file='<%= reportPath %>' /><%
  }
  
%>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
