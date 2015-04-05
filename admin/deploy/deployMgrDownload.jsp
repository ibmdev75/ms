<%@ page import="com.jalios.jcms.*, com.jalios.util.*, com.jalios.io.*, com.jalios.jstore.*, java.io.*, java.util.*, java.net.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
if (!Channel.getChannel().isDeployManagerEnabled() || !checkAccess("admin/operation/deploy-mgr")) {
  response.sendRedirect(ServletUtil.getBaseUrl(request) + JcmsConstants.FORBIDDEN_REDIRECT + "?redirect=" + ServletUtil.encodeURL(ServletUtil.getUrl(request)));
  return;
}
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.DeployManagerDownloadHandler"><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><jsp:setProperty name="formHandler" property="*" /></jsp:useBean><%
formHandler.validate();
if (true) { return; }
%>
