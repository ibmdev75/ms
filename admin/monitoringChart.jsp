<%--
  @Summary: Generates the JCMS Monitoring charts using com.jalios.jcms.monitoring.MonitoringChart
  @Category: Admin / Channel
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@page import="com.jalios.jcms.servlet.BinaryFileServlet"%><%

  if (!checkAccess("admin/monitoring/monitoring") || !channel.isValidAdminIP(request)) {
    sendForbidden(request, response);
    return;
  }

  com.jalios.jcms.monitoring.MonitoringManager mm = com.jalios.jcms.monitoring.MonitoringManager.getMonitoringManager();

  // Compute chart's dates
  Date startDate = getDateTimeParameter("startDate", userLang, mm.getOldestEventDate());
  Date endDate = getDateTimeParameter("endDate", userLang, mm.getLatestEventDate());
  startDate = startDate.before(mm.getOldestEventDate()) ? mm.getOldestEventDate() : startDate;
  endDate = endDate.after(mm.getLatestEventDate()) ? mm.getLatestEventDate() : endDate;

  // Generate chart's and send it to output stream
  File imageFile = com.jalios.jcms.monitoring.MonitoringChart.getJpegChart(userLocale, startDate, endDate, 700, 700);
  if (imageFile == null) {
    logger.warn("Could not generate Monitoring Chart");
    return;
  }
  
  // Create a download ticket and redirect client to download servlet
  BinaryFileServlet.DownloadTicket ticket = new BinaryFileServlet.DownloadTicket(imageFile, "image/jpeg", "monitoring-chart.jpg");
  ticket.setDeleteFileAfterDelivery(true);
  ticket.setUsePragmaNoCache(true);
  ticket.sendToDownloadUrl(request, response);
%>