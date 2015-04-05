<% request.setAttribute("CheckCSRF", Boolean.TRUE); %><%
%><%@ page contentType="text/html; charset=UTF-8"   %><%
%><%@ include file='/jcore/doInitPage.jspf'          %><%
  
  if (!checkAccess("admin/operation/properties")) {
    sendForbidden(request, response);
    return;
  }
  
  String msg = com.jalios.jcms.ajax.JcmsJSONUtil.checkDataSourceConnection(
    getUntrustedStringParameter("db_jcmsdb",""), 
    getUntrustedStringParameter("db_datasource","")
  );
  
%><%= msg %>