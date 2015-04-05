<%@page import="com.jalios.io.IOUtil"%>
<%@page import="com.jalios.jcms.servlet.BinaryFileServlet"%>
<%@page import="java.util.zip.ZipEntry"%>
<%@page import="java.util.zip.ZipOutputStream"%><%@ include
	file='/jcore/doInitPage.jspf'%><%@page
	import="java.text.SimpleDateFormat"%><%@page
	import="com.jalios.util.Util"%><%@page import="com.jalios.jcms.stat.*"%>
<%
	if(loggedMember == null){
	  sendForbidden(request, response);
      return;
  	}

  HashMap<String, ExportParameters> paramsMap = (HashMap<String, ExportParameters>) loggedMember.getExtraInfo(StatExporter.JCMS_EXPORT_RAW_DATA_PARAMS_MAP);
  String token = getAlphaNumParameter(StatExporter.TOKEN, null);
  if (token == null || "null".equals(token)) {
    //no export asked
    sendRedirect(contextPath + "/admin/stat/adminExportRawData.jsp");
    return;
  } 
    ExportParameters params = paramsMap!= null ? paramsMap.get(token): null; 
    if (paramsMap == null || params == null ) {
      //no export asked
      jcmsContext.addMsgSession(request, new JcmsMessage(com.jalios.jcms.context.JcmsMessage.Level.INFO, glp("ui.statreport.exportRawData.export-not-present")));
      sendRedirect(contextPath + "/admin/stat/adminExportRawData.jsp");
      return;
    } 
    // test if the requested file is ask for download or not
    boolean isFileRequested = getBooleanParameter("downloadFile", false);
    if (!isFileRequested ) {
      out.println("<div id=\"progressDiv\"  class=\"ajax-refresh-div progressBar\">");
      out.println(glp("ui.statreport.exportRawData.exportEnded"));
%>
<a
	href="<%=contextPath%>/admin/stat/doDownloadExport.jsp?downloadFile=true&<%=StatExporter.TOKEN%>=<%=token%>">Download
the file</a>
<%
  out.println("</div>");

    } else {
      File newFile = params.getExportedFile();
      String filename = newFile.getName();
      filename = filename.replace(params.getToken(), "");
      String type ="";
      //download of the file is asked
      if (params.getExportHandler().isUseCompressStream()) {
        type = "application/zip";
      } else {
        type = params.getExportHandler().getContentType();
      }
      // Create a download ticket and redirect client to download servlet
      BinaryFileServlet.DownloadTicket ticket = new BinaryFileServlet.DownloadTicket(newFile, type, filename);
      ticket.setDeleteFileAfterDelivery(false);
      ticket.setUsePragmaNoCache(true);
      ticket.sendToDownloadUrl(request, response);
    }
%><%!String generateProgressBar(long percentValue) {

    StringBuilder builder = new StringBuilder("<table class='layout'><tr><td><div class=\"ProgressBarContainer\"><div class=\"ProgressBarExecuted\" width=\"");
    builder.append(percentValue).append("%\">&nbsp;</div></div></td><td>&nbsp;").append(percentValue).append("%</td></tr></table>");
    builder.append("<style>.ProgressBarExecuted{width:").append(percentValue).append("%;}</style>");
    return builder.toString();

  }%>