<%--
  @Summary: Workflow editor
  @Category: Admin / Workflow
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-3.0
--%><%
%><%!
String getStateColor(WFState state) {
  if (!state.isSpecialState()) {
    return "#ff9900";
  }
  switch(state.getPstatus()) {
    case WorkflowManager.SCHEDULED_PSTATUS:
      return "#FFCC00";
    case WorkflowManager.PUBLISHED_PSTATUS:
      return "#009933";
    case WorkflowManager.EXPIRED_PSTATUS:
      return "#FF3300";
    default:
      return "#CCCCCC";
  }
}

%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/work/workflow")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.WFEditorHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    return;
  }
 
  int formElementCount = 0;
  final Workflow wf = formHandler.getWorkflow(); 

  request.setAttribute("title", glp("ui.adm.wf-edit.title", formHandler.getAvailableLabel(userLang))); 
  request.setAttribute("workflowListSubAdminMenu", "true");
  boolean canEdit = !channel.isJSyncEnabled();
  WFState state = formHandler.getAvailableState();
  boolean isSpecialState = (state != null && state.isSpecialState());
  boolean isStateUpdate = state != null;

%><%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header"><h1><%= formHandler.getAvailableLabel(userLang) %></h1></div>
<% if (!canEdit) { 
  setWarningMsg(glp("msg.adm.wf-edit.forbidden"), request);
  }
%>
<%@ include file='/jcore/doMessageBox.jspf' %>

<div class="tab-pane" id="wfEditor-tab">
  <%-- *** STATES TAB ******************************************* --%>
  <%@ include file='/admin/wfEditor_state.jspf' %>
  
  <%-- *** ROLES TAB ******************************************** --%>
  <%@ include file='/admin/wfEditor_role.jspf' %>

  <%-- *** TRANSITIONS TAB ************************************** --%>
  <%@ include file='/admin/wfEditor_transition.jspf' %>

  <%-- *** PROPERTIES TAB ************************************** --%>
  <%@ include file='/admin/wfEditor_prop.jspf' %>
  
</div>

<hr>

<form method="post" action="admin/wfEditor.jsp" name="editSaveModification">
<p>
<% formElementCount = 0 ;%>
  <% boolean isDisabled = !wf.isNew() && !wf.isUpdated(); %>
  <% String confirm = encodeForJavaScript(glp("msg.js.confirm")); %>
  <input class='btn btn-default <%= isDisabled ? "" :"btn-primary" %>' type="button" name="opSave" value='<%= glp("ui.com.btn.save-apply") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/wfList.jsp?opSave=true&amp;id=<%= formHandler.getAvailableId() %>")' <%= isDisabled ? "disabled='disabled'" : "" %> />&nbsp;&nbsp;<% formElementCount++ ;%>
  <input class='btn btn-default' type="button" name="opRevert" value='<%= glp("ui.adm.wf-list.btn.revert") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/wfList.jsp?opRevert=true")' <%= isDisabled ? "disabled='disabled'" : "" %> />&nbsp;&nbsp;<% formElementCount++ ;%>
  <% if (Util.isEmpty(channel.getWorkspaceSet(wf)) ) { %>
    <% String confirmDeleteWorkflow = encodeForJavaScript(glp("ui.adm.wf-edit.lbl.delete-wf", formHandler.getAvailableLabel(userLang))); %>
    <input class='btn btn-default' type='button' name='opDeleteWorkflow' value='<%= glp("ui.com.btn.delete") %>' <%= !canEdit ? "disabled='disabled'": "" %> onclick='confirmAction("<%= confirmDeleteWorkflow %>", "<%= contextPath %>/admin/wfEditor.jsp?opDeleteWorkflow=true&amp;id=<%= formHandler.getAvailableId() %>")' /><% formElementCount++ ;%>
  <% } %>
</p>
</form>
<% 
  String xmlFileURL = ServletUtil.encodeURL("work/workflow.jsp");
  String xmlWFId    = formHandler.getAvailableId();
  String xmlWFLabel = formHandler.getAvailableLabel(userLang);
%>
<%@ include file='/admin/doWFFlash.jspf' %> 


<jalios:javascript>
 'JCMS.wfeditor.WfEditorMgr'._namespace({
     submitEditRoleForm : function(action , roleId) { 
		   window.document.editRoleForm.editRole.value = roleId;
		   window.document.editRoleForm.action.name    = action;
		   window.document.editRoleForm.submit();
     }
 });

<% if (formHandler.isTabForced() ) { %>
setSelectedTab("wfEditor-tab", <%= formHandler.getOpenTab() %>);
<% } %>

</jalios:javascript>
  
<%@ include file='/admin/doAdminFooter.jspf' %> 
