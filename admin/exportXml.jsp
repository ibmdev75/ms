<%= XmlUtil.XML_HEADER %><%--
--%><%
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/xml; charset=UTF-8"); 
%><%@ page import="com.jalios.jcms.mashup.*" 
%><%@ include file='/jcore/doInitPage.jspf' %><%
ExportManager exportMgr = ExportManager.getInstance();

// Check IP
if (!exportMgr.checkIP(request.getRemoteAddr())) {
  sendForbidden(request, response);
  return;
}

// print the exported data
Data data = getDataParameter("id");
if (data != null) {
  out.print(exportMgr.exportXml(data, loggedMember));
} else {
  out.print(exportMgr.exportXml(request.getQueryString(), loggedMember));
}
%>
