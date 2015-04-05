<%--
  @Summary: Access Control Manager
  @Since: jcms-7.0 
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><%

  /* ACL Manager require TRUE ADMIN ACCESS */ 
  if (!isAdmin || !channel.isValidAdminIP(request)) {
    sendForbidden(request, response);
    return;
  }

  jcmsContext.addCSSHeader("css/jalios/acl.css");

  request.setAttribute("title", glp("accesscontrol.manager"));  
  request.setAttribute("aclManagerSubAdminMenu", "true");
  
%><%@ include file="/admin/doAdminHeader.jspf" %>
<div class="page-header">
	<h1><jalios:icon src="acl-big"/> <%= glp("accesscontrol.manager") %></h1>
</div>
<%@ include file='/jcore/doMessageBox.jspf' %>

<div class="tab-pane" id="aclManagerTab">
<%
  boolean aclWorkspaceFilter = false;
  boolean manageAcl = true;
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
<%@ include file="/admin/doAdminFooter.jspf" %>