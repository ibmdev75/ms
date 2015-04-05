<%--
  @Summary: Member CSV import : csm sample file download
  @since: jcms-8
  @author Sylvain Devaux <sylvain.devaux@jalios.com>
--%><%@page import="com.jalios.jcms.servlet.BinaryFileServlet"%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

// -----------------------------------------------
//
// JSP to download sample member import csv file
//
// -----------------------------------------------

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

final String I18NCsvPath = glp("ui.member.csv-import.steps.0.format.sample.href");
final File csvSampleFile = new File(channel.getRealPath(I18NCsvPath));

if (csvSampleFile != null && csvSampleFile.exists()) {
	BinaryFileServlet.DownloadTicket ticket = new BinaryFileServlet.DownloadTicket(csvSampleFile);
	ticket.setFilename("member-import-csv-sample.csv");
	ticket.sendToDownloadUrl(request, response);  
}
%>