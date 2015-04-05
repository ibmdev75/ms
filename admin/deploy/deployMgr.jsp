<%@ include file='/jcore/doInitPage.jspf' %><%

if (!channel.isDeployManagerEnabled() || !checkAccess("admin/operation/deploy-mgr")) {
  sendForbidden(request, response);
  return;
}

request.setAttribute("deploySubAdminMenu", "true"); 
request.setAttribute("title", glp("ui.adm.dm.title"));  

%><%@ include file='/admin/doAdminHeader.jspf' %><%

WebAppManager wam = new WebAppManager(channel.getServletContext());

%>

<%-- ************************************************************ --%>
<div class="page-header"><h1><%= glp("ui.adm.dm.title") %></h1></div>

<%@ include file='/jcore/doMessageBox.jspf' %>

<table class="table-data table-condensed">	
  <tr>
    <th><%= glp("ui.adm.dm.webapp") %></th>
    <th><%= glp("ui.adm.dm.urid") %></th>
    <th><%= glp("ui.adm.dm.ctxt") %></th>
    <th><%= glp("ui.adm.dm.status") %></th>
    <th align='center'><%= glp("ui.adm.dm.action") %></th>
<jalios:foreach collection='<%= wam.getWebAppInfoMap().values() %>' name='itWebapp' type='WebAppInfo'>
  <% 
  File deltaDir = com.jalios.io.IOUtil.getTempDir("jcms_deploy_" + itWebapp.getWebappId(), null, null); 
  String urlDevCopyDownload  = "javascript:popupWindow(JCMS.Security.getUrlWithCSRFToken('" + contextPath + "/admin/deploy/popupDownload.jsp?webappId=" + itWebapp.getWebappId() + "&amp;action=opDevCopy'), '', 600, 250)"; 
  String urlDevCopySave      = "javascript:popupWindow(JCMS.Security.getUrlWithCSRFToken('" + contextPath + "/admin/deploy/popupDownload.jsp?webappId=" + itWebapp.getWebappId() + "&amp;action=opDevCopy&amp;save=true'), '', 600, 250)"; 
  String urlFullCopyDownload = "javascript:popupWindow(JCMS.Security.getUrlWithCSRFToken('" + contextPath + "/admin/deploy/popupDownload.jsp?webappId=" + itWebapp.getWebappId() + "&amp;action=opFullCopy'), '', 600, 250)"; 
  String urlFullCopySave     = "javascript:popupWindow(JCMS.Security.getUrlWithCSRFToken('" + contextPath + "/admin/deploy/popupDownload.jsp?webappId=" + itWebapp.getWebappId() + "&amp;action=opFullCopy&amp;save=true'), '', 600, 250)"; 
  String urlJsyncCopyDownload = "javascript:popupWindow(JCMS.Security.getUrlWithCSRFToken('" + contextPath + "/admin/deploy/popupDownload.jsp?webappId=" + itWebapp.getWebappId() + "&amp;action=opJsyncCopy'), '', 600, 250)"; 
  String urlJsyncCopySave     = "javascript:popupWindow(JCMS.Security.getUrlWithCSRFToken('" + contextPath + "/admin/deploy/popupDownload.jsp?webappId=" + itWebapp.getWebappId() + "&amp;action=opJsyncCopy&amp;save=true'), '', 600, 250)"; 
  String urlSignDownload     = "javascript:popupWindow(JCMS.Security.getUrlWithCSRFToken('" + contextPath + "/admin/deploy/downloadMonitor.jsp', 'DownloadMonitor', 440, 160));document.location=JCMS.Security.getUrlWithCSRFToken('" + contextPath + "/admin/deploy/deployMgrDownload.jsp?uploadDir=false&amp;docDir=false&amp;webappId=" + itWebapp.getWebappId() + "&amp;opSign=true');"; 
  String urlSignSave         = "javascript:popupWindow(JCMS.Security.getUrlWithCSRFToken('" + contextPath + "/admin/deploy/downloadMonitor.jsp', 'DownloadMonitor', 440, 160));document.location=JCMS.Security.getUrlWithCSRFToken('" + contextPath + "/admin/deploy/deployMgrDownload.jsp?uploadDir=false&amp;docDir=false&amp;webappId=" + itWebapp.getWebappId() + "&amp;opSign=true&amp;save=true');"; 
  String urlUpgrade = HttpUtil.getUrlWithCSRFToken("admin/deploy/deployMgrUpgrade.jsp?webappId=" + itWebapp.getWebappId(), request, true); 
  String urlRestart = HttpUtil.getUrlWithCSRFToken("admin/deploy/deployMgrDownload.jsp?webappId=" + itWebapp.getWebappId() + "&amp;opRestart=true", request, true);
  %>
  <tr> 
    <td><a href='<%= itWebapp.getUrl() %>'><%= itWebapp.getName() %></a></td>
    <td><%= itWebapp.getUrid() %></td>
    <td><%= itWebapp.getContext() %></td>
    <td><%= itWebapp.getStatusLabel(userLang) %></td>
    <td>
     <ul>
      <li><%= glp("ui.adm.dm.a.dev", urlDevCopyDownload, urlDevCopySave) %>
      <li><%= glp("ui.adm.dm.a.full", urlFullCopyDownload, urlFullCopySave) %>
      <jalios:if predicate='<%= itWebapp.isJsyncEnabled() %>'>
      <li><%= glp("ui.adm.dm.a.jsync", urlJsyncCopyDownload, urlJsyncCopySave) %>
      </jalios:if>
      <li><%= glp("ui.adm.dm.a.sign", urlSignDownload, urlSignSave) %>
      <li><a href='<%= urlUpgrade %>'><%= deltaDir.exists() ? glp("ui.adm.dm.a.upgrade2") : glp("ui.adm.dm.a.upgrade1") %></a>
        <% if (deltaDir.exists()) { %>
        &nbsp;
        <a href='<%= urlUpgrade %>&amp;opAbort=true&amp;deltaDir=<%= Util.encodeUrl(deltaDir.toString()) %>'><%= glp("ui.adm.dm.a.abort") %></a>
        <% } %>
      <li><a href="<%= urlRestart %>"><%= glp("ui.adm.dm.a.restart") %></a>
     </ul>
    </td>
  </tr>
</jalios:foreach>
</table>
<br />

<%@ include file='/admin/doAdminFooter.jspf' %>
