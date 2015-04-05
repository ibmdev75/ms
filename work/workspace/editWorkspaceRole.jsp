<%--
  @Summary: Group editor
  @Category: Admin / Data
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-4.1
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

 if (JcmsUtil.checkDataWriteDisabled(request, response, "admin/doAdminMsg.jsp", userLang)) {
  return;
 }

  if (!checkAccess("admin-ws/users/role")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="roleFormHandler" scope="page" class="com.jalios.jcms.workspace.EditWorkspaceRoleHandler"><%
  %><jsp:setProperty name="roleFormHandler" property="request"        value="<%= request %>"/><%
  %><jsp:setProperty name="roleFormHandler" property="response"       value="<%= response %>"/><%
  %><jsp:setProperty name="roleFormHandler" property="id"             value="<%= workspace.getId() %>"/><%
  %><jsp:setProperty name="roleFormHandler" property="*" /><%
%></jsp:useBean><%

  AbstractEditWorkspaceHandler formHandler = (AbstractEditWorkspaceHandler) roleFormHandler;
  if (formHandler.validate()) {
    return;
  }
    
  String title = formHandler.getWorkspace() == null ? glp("ui.wrkspc-edit.title-add") : glp("ui.wrkspc-edit.title-updt", formHandler.getWorkspace().getTitle(userLang), glp("ui.com.lbl.roles"));
  Workspace workspc = formHandler.getWorkspace();

  request.setAttribute("title", title); 
  request.setAttribute("adminRolesMenu", "true");
 
%><%@ include file='/work/doWorkHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>

<div class="page-header">
	<h1><%= title %></h1>
</div>
<% int formElementCount  = 0; %>

<form action="<%= contextPath %>/work/workspace/editWorkspaceRole.jsp" method="post" name="editForm">
<div class='formBox'>
  <jalios:message msg="ui.adm.wf-edit.ro.hlp" title="" />

  <div class='inputArea'>
  <%@ include file='/work/workspace/doEditWorkspaceRole.jspf' %>
  <%-- ID ------------------------------------------------------------ --%> 
  <jalios:if predicate='<%= workspc != null %>'>
	  <br />
	  <input name="id" type="hidden" value="<%= workspc.getId() %>" /><% formElementCount++; %>
  </jalios:if>
 </div>
</div>

<%-- BUTTONS -------------------------------------------------------------------- --%> 
<div class='formBoxButtons'>

  <input type='hidden' name='redirect' value='<%= contextPath %>/work/workspace/adminWorkspace.jsp' /><% formElementCount++; %>
  <input type='hidden' name='oldEditableRole' value='<%= roleFormHandler.getAvailableEditableRole() != null ? roleFormHandler.getAvailableEditableRole().getId() : "" %>' />
  <input type='hidden' name='action' value='true' />
  <input type='hidden' name='loaded' value='false' />
  <input type='hidden' name="anchor" />
  <input type='hidden' name="opItem" />
  <input type='hidden' name="itemPos" />

</form>
</div>


<%-- FLASH WF -------------------------------------------------------------------- --%> 
<% String xmlWFId    = roleFormHandler.getAvailableWfId(); %> 
<jalios:if predicate='<%= xmlWFId != null && !WorkflowConstants.ALL_WF.equals(xmlWFId) %>'>
<% 
  String xmlFileURL = ServletUtil.encodeURL("work/workflow.jsp");
  String xmlWFLabel = WorkflowManager.getInstance().getWorkflow(xmlWFId).getLabel(userLang);
%>
<%@ include file='/admin/doWFFlash.jspf' %> 
</jalios:if>

<%@ include file='/work/doWorkFooter.jspf' %>
