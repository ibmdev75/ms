<% request.setAttribute("CheckCSRF", Boolean.TRUE); %><%
%><%@ page contentType="text/html; charset=UTF-8"   %><%
%><%@ include file='/jcore/doInitPage.jspf'          %><%
  
  if (!checkAccess("admin/operation/properties")) {
    sendForbidden(request, response);
    return;
  }
  
  boolean msg = com.jalios.jcms.ajax.JcmsJSONUtil.checkLDAPConnection(
    getUntrustedStringParameter("ldap_server_hostname",""), 
    getUntrustedStringParameter("ldap_server_port",""),
    getUntrustedStringParameter("ldap_server_ssl",""),
    getUntrustedStringParameter("ldap_server_login",""),
    getUntrustedStringParameter("ldap_server_password","")
  );
  
%><%= msg ? "ok" : "Error" %>