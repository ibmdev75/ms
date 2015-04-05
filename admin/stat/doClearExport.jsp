
<%@page import="java.util.zip.ZipEntry"%>
<%@page import="java.util.zip.ZipOutputStream"%><%@ include
	file='/jcore/doInitPage.jspf'%><%@page import="com.jalios.jcms.stat.*"%>
<%
  HashMap<String, ExportParameters> paramsMap = (HashMap<String, ExportParameters>) loggedMember.getExtraInfo(StatExporter.JCMS_EXPORT_RAW_DATA_PARAMS_MAP);
  String token = getAlphaNumParameter(StatExporter.TOKEN, null);
  if (token != null) {
    ExportParameters params = paramsMap.get(token);
    if (params != null) {
      File exportedFile = params.getExportedFile();
      if (exportedFile != null) {
        if (!exportedFile.delete()) {
          logger.warn("Cannot delete exported file" + exportedFile.getAbsolutePath());
        } else {
          logger.debug("Exported file '" + exportedFile.getAbsolutePath() + "' has been deleted");
        }
      }
      paramsMap.remove(token);
    }
  }
  sendRedirect(contextPath + "/admin/stat/adminExportRawData.jsp");
  return;
%>