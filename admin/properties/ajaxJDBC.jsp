<% request.setAttribute("CheckCSRF", Boolean.TRUE); %><%
%><%@ page contentType="text/html; charset=UTF-8"   %><%
%><%@ include file='/jcore/doInitPage.jspf'          %><%
  
  if (!checkAccess("admin/operation/properties")) {
    sendForbidden(request, response);
    return;
  }
  
  String msg = com.jalios.jcms.ajax.JcmsJSONUtil.checkJDBCConnection(
    getUntrustedStringParameter("db_jcmsdb",""), 
    getUntrustedStringParameter("db_url",""), 
    getUntrustedStringParameter("db_username",""),  
    getUntrustedStringParameter("db_password","")
  );
  
%><%= msg %>