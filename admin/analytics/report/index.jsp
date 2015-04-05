<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!(checkAccess("admin/reporting/analytics") || checkAccess("admin-ws/reporting/analytics"))) { 
    sendForbidden(request, response);
    return;
  }
  request.setAttribute("title", glp("ui.work.mn.analytics-report")); 
  request.setAttribute("allowWkspFilter", "false");
  // in admin header, which menu and sub menu must be bolded
  request.setAttribute("reportingAdminMenu", "true");
  request.setAttribute("analyticsReportSubAdminMenu", "true");
  AnalyticsManager instance = AnalyticsManager.getInstance(); 
  
  jcmsContext.addCSSHeader("css/jalios/ux/jalios-analytics.css");
	request.setAttribute("boHeaderCSS","jcms-analytics");
	
%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %><%

jcmsContext.addJavaScript("js/lib/flot/jquery.colorhelpers.js");
jcmsContext.addJavaScript("js/lib/flot/jquery.flot.js");
jcmsContext.addJavaScript("js/lib/flot/jquery.flot.crosshair.js");
jcmsContext.addJavaScript("js/lib/flot/jquery.flot.fillbetween.js");
jcmsContext.addJavaScript("js/lib/flot/jquery.flot.image.js");
jcmsContext.addJavaScript("js/lib/flot/jquery.flot.navigate.js");
jcmsContext.addJavaScript("js/lib/flot/jquery.flot.pie.js");
jcmsContext.addJavaScript("js/lib/flot/jquery.flot.resize.js");
jcmsContext.addJavaScript("js/lib/flot/jquery.flot.selection.js");
jcmsContext.addJavaScript("js/lib/flot/jquery.flot.stack.js");
jcmsContext.addJavaScript("js/lib/flot/jquery.flot.symbol.js");
jcmsContext.addJavaScript("js/lib/flot/jquery.flot.threshold.js");
jcmsContext.addJavaScript("js/lib/flot/curvedLines.js");
jcmsContext.addJavaScript("js/jalios/core/jalios-analytics.js");
if(jcmsContext.getBrowser().isIE7() || jcmsContext.getBrowser().isIE8()){
	jcmsContext.addJavaScript("js/lib/flot/excanvas.min.js");
}
	boolean showWorkspace = true;

%><%@ include file='/admin/analytics/report/doSelectReport.jspf' %><%
%><%@ include file='/admin/analytics/report/doDisplayReport.jspf' %><%
%><%@ include file='/admin/doAdminFooter.jspf' %> 