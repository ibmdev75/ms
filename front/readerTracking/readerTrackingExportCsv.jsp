<%@page import="com.jalios.jcms.tracking.*"%><%--  
--%><%--  
--%><%
// inform doInitPage to set the proper content type
request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
Publication trackedPub = getPublicationParameter("trackedPubId");
ReaderTrackerManager readerMgr = ReaderTrackerManager.getInstance();

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

if (trackedPub == null || readerMgr.isReaderTrackerAnonymized()) {
    return;
}

String csvFilename = new SimpleDateFormat("yyyy-MM-dd").format(new Date())+ " - " + channel.getName() + " - " + trackedPub.getDataName(userLang) + " - reader-tracking.csv";
HttpUtil.addAttachmentHeader(response, csvFilename);

Set<ReaderTracker> reportSet = new HashSet<ReaderTracker>();

reportSet.addAll(readerMgr.getReaderTrackerList(trackedPub,ReaderTracker.ACCESS_TYPE_READER));
reportSet.addAll(readerMgr.getReaderTrackerList(trackedPub,ReaderTracker.ACCESS_TYPE_DOWNLOAD));

JcmsUtil.exportCSV(reportSet, userLang, out); %>