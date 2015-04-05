<%@page import="com.jalios.jcms.context.JcmsMessage"%>
<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!(checkAccess("admin-ws/reporting/analytics"))) { 
    sendForbidden(request, response);
    return;
  }
  AnalyticsManager instance = AnalyticsManager.getInstance(); 
  jcmsContext.addCSSHeader("css/jalios/ux/jalios-analytics.css");
	request.setAttribute("boHeaderCSS","jcms-analytics");
%><%@ include file='/work/doWorkHeader.jspf' %><%
boolean showWorkspace = false;
if(workspace.isModel()){
  jcmsContext.addMsg(new JcmsMessage(JcmsMessage.Level.WARN, glp("ui.analytics.workspace-not-applicable")));
  %><%@ include file='/jcore/doMessageBox.jspf' %><%
}else{
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
	request.setAttribute("jcms.analytics.selected-workspace", workspace);	
	%><%@ include file='/jcore/doMessageBox.jspf' %><%
	%><%@ include file='/admin/analytics/report/doSelectReport.jspf' %><%
	%><%@ include file='/admin/analytics/report/doDisplayReport.jspf' %><%
}
%><%@ include file='/work/doWorkFooter.jspf' %>