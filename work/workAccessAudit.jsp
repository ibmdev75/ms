<%--
  @Summary: Access Control Manager
  @Since: jcms-7.0 
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

  /* ACL Audit require TRUE ADMIN ACCESS */ 
  if (!checkAccess("admin-ws/users/acl-audit")) {
    sendForbidden(request, response);
    return;
  }

  jcmsContext.addJavaScript("js/jalios/table.js");
  jcmsContext.addCSSHeader("css/jalios/acl.css");
  jcmsContext.addCSSHeader("css/fff-sprite.css");

  request.setAttribute("title", glp("accesscontrol.audit")); 
  request.setAttribute("adminAccessAuditMenu", "true");  
  request.setAttribute("adminWAMenu", "true");
  request.setAttribute("allowWkspFilter", "false");
  
%><%@ include file="/work/doWorkHeader.jspf" %>

<div class="page-header">
  <h1><%= glp("accesscontrol.audit") %></h1>
</div>
<%@ include file='/jcore/doMessageBox.jspf' %>

<div class="tab-pane" id="aclManagerTab">
<%
 boolean aclWorkspaceFilter = true;
 boolean manageAcl = false;
%>
  <%-- *** ACL List ************************************************ --%>
  <%@ include file='/admin/doAccessManagerAclList.jspf' %>

  <%-- *** Resources Audit ***************************************** --%>
  <%@ include file='/admin/doAccessManagerRsrcsAudit.jspf' %>
  
  <%-- *** Member Audit  ******************************************* --%>
  <%@ include file='/admin/doAccessManagerMbrAudit.jspf' %>

  <%-- *** ACL Audit  ********************************************** --%>
  <%@ include file='/admin/doAccessManagerAclAudit.jspf' %>

</div>
<%@ include file="/work/doWorkFooter.jspf" %>