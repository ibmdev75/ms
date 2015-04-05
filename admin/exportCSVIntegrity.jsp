<%
  response.setHeader("Content-Disposition", "attachment; filename=intergrityReport.csv"); 
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!checkAccess("admin/monitoring/check-integrity")) {
  sendForbidden(request, response);
  return;
}
 
JcmsUtil.exportCSVIntegrityReport(userLang, out);
%>
