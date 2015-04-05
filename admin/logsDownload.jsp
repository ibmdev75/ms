<%--
  @Summary: Download the jcms.log file
  @Since: jcms-7.0.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.io.IOUtil" %><%
%><%@ page import="com.jalios.jcms.servlet.BinaryFileServlet" %><%

  if (!checkAccess("admin/monitoring/logs")) {
    sendForbidden(request, response);
    return;
  }

  boolean zip = getBooleanParameter("zip", false); 
  File jcmsLogFile = new File(channel.getDataPath("logs/jcms.log"));

  // Zip the file into a temporary file
  // Then create a download ticket for the zipped log file
  if (zip) {
    File jcmsLogFileZipped = File.createTempFile("jalios-jcms.log", ".zip");
    IOUtil.zip(jcmsLogFile.getAbsolutePath(), jcmsLogFileZipped.getAbsolutePath(), true);
    BinaryFileServlet.DownloadTicket ticket = new BinaryFileServlet.DownloadTicket(jcmsLogFileZipped, "application/zip", "jcms.log.zip");
    ticket.setDeleteFileAfterDelivery(true); // delete temp zip file
    ticket.setUsePragmaNoCache(true);
    ticket.sendToDownloadUrl(request, response);
  }
  // Create a download ticket for the jcms.log file
  else {
    BinaryFileServlet.DownloadTicket ticket = new BinaryFileServlet.DownloadTicket(jcmsLogFile, "text/plain", "jcms.log");
    ticket.setDeleteFileAfterDelivery(false); // do NOT delete log file !!!
    ticket.setUsePragmaNoCache(true);
    ticket.sendToDownloadUrl(request, response);
  }

%> 