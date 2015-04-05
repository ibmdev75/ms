<%--
  @Summary: List all custom types
  @Category: Admin / Types
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/work/workflow")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.WFEditorHandler"><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    return;
  }

request.setAttribute("title", glp("ui.adm.wf-list.title")); 
request.setAttribute("workflowListSubAdminMenu", "true"); 
boolean canEdit = !channel.isJSyncEnabled();

%><%@ include file='/admin/doAdminHeader.jspf' %>

<h1 class="boTitle icon iconWork"><% /* %>Workflow List<% */ %><%= glp("ui.adm.wf-list.title") %></h1>
<% if (!canEdit) { 
  setWarningMsg(glp("msg.adm.wf-edit.forbidden"), request);
  }
%>
<%@ include file='/jcore/doMessageBox.jspf' %>
<div class="row">
   <div class="col-md-9">
   
      <%-- *** WORKFLOW LIST ******************************************* --%>
      <table id='typeTable' class='table-data'>
        <thead>
        <tr>
          <th>&nbsp;</th>
          <th><% /* %>Label<% */ %><%= glp("ui.com.lbl.label") %></th>
          <th><% /* %>Type<% */ %><%= glp("ui.adm.wf-list.lbl.type") %></th>
          <th><% /* %>#WrkSpc<% */ %><%= glp("ui.com.lbl.wspc-cnt") %></th>
          <th><% /* %>#Pub<% */ %><%= glp("ui.com.lbl.pub-cnt") %></th>
          <th>&nbsp;</th>
        </tr>
        </thead>
        <% int cpt = 0; %>
        <jalios:foreach collection="<%= formHandler.getWorkflowSet() %>" name="itWorkflow" type="Workflow">
        <% if (itWorkflow != WorkflowManager.DEFAULT_WORKFLOW && !"filedocument".equals(itWorkflow.getId())) { %>
	        <% Set     workspaceSet = channel.getWorkspaceSet(itWorkflow); %>
	        <% String confirmDelete = encodeForJavaScript(glp("msg.js.confirm-delete", itWorkflow.getLabel(userLang))); %>
	        <% String labelClass = itWorkflow.isNew() ? "wfLabelNew" : (itWorkflow.isUpdated() ? "wfLabelUpdated" : "wfLabelNormal"); %>
	        <tr> 
	          <td class="text-right text-overflow"><%= ++cpt %>. <a href="admin/wfEditor.jsp?id=<%= itWorkflow.getId() %>"><jalios:icon src="edit" alt='<%= glp("ui.com.alt.edit") %>' /></a></td>
	          <td class="text-overflow" width='100%'><jalios:icon src='wf'  /> <a href="admin/wfEditor.jsp?id=<%= itWorkflow.getId() %>"><span class='<%= labelClass %>'><%= itWorkflow.getLabel(userLang) %></span></a></td>
	          <td class="text-overflow" width='100%'><%= glp("ui.adm.wf-list.lbl.type." + itWorkflow.getType()) %></td>
	          <td class="numeric"><%= workspaceSet.size() %></td>
	          <td class="numeric"><%= channel.getPublicationSet(channel.getDataSet(Publication.class) , itWorkflow).size() %></td>
	          <td class="text-overflow">
	            <jalios:if predicate='<%= Util.isEmpty(workspaceSet) %>'>
	            <a href='admin/wfList.jsp?opDeleteWorkflow=true&amp;id=<%= itWorkflow.getId() %>&amp;confirm=true' onclick='confirmAction("<%= confirmDelete %>", this.href); return false;'><jalios:icon src="trash-empty" alt='<%= glp("ui.com.alt.remove") %>' /></a>
	            </jalios:if>
	          </td>
	        </tr>
        <% } %>
        </jalios:foreach>
      </table>
      
      <form method="post" action="admin/wfList.jsp" name="editSave">
        <% boolean isDisabled = !WorkflowManager.getInstance().isUpdated(); %>
        <% String confirm = encodeForJavaScript(glp("msg.js.confirm")); %>
        <input class='btn btn-default <%= isDisabled ? "" : "btn-primary" %>' type="button" name="opSave" value='<%= glp("ui.com.btn.save-apply") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/wfList.jsp?opSave=true")' <%= isDisabled ? "disabled='disabled'" : "" %> />&nbsp;&nbsp;
        <input class='btn btn-default' type="button" name="opRevert" value='<%= glp("ui.adm.wf-list.btn.revert") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/wfList.jsp?opRevert=true")' <%= isDisabled ? "disabled='disabled'" : "" %> />&nbsp;&nbsp;
      </form>
   </div>
   
   <div class="col-md-3">
    
      <%-- *** ADD A NEW WF ******************************************* --%>
      <jalios:panel title="ui.adm.wf-list.lbl.add">
        <form method="post" action="admin/wfList.jsp" name="editForm" style="display:inline;">

					<jalios:field label="ui.com.lbl.label" name="label" required='true' ml='<%= channel.isMultilingual() %>' resource="field-vertical">
					  <jalios:control type="<%= ControlType.TEXTFIELD %>" />
					</jalios:field>
					
					<% String type = formHandler.getAvailableType(); %>
					<jalios:field label="ui.adm.wf-list.lbl.type" name="type" required='true' value='<%= type %>'  resource="field-vertical">
                      <jalios:control settings='<%= new EnumerateSettings()
                                                          .select()
                                                          .enumValues(WorkflowManager.WFTYPE_PUBLISH, WorkflowManager.WFTYPE_PROCESS)
                                                          .enumLabels("ui.adm.wf-list.lbl.type.publish", "ui.adm.wf-list.lbl.type.process") %>' />
					</jalios:field>
					
					<%
						List values = new ArrayList();
						List labels   = new ArrayList();
						values.add("empty"); labels.add("");
						for (Workflow itWorkflow : formHandler.getWorkflowSet()){
						  if (itWorkflow != WorkflowManager.DEFAULT_WORKFLOW){
						    values.add(itWorkflow.getId()); labels.add(itWorkflow.getLabel(userLang));
						  }
						}
					%>
					<jalios:field label="ui.adm.wf-list.lbl.copy" name="wfFrom" required='true' value='<%= type %>' resource="field-vertical">
                      <jalios:control settings='<%= new EnumerateSettings().select().enumValues(values).enumLabels(labels) %>' />
					</jalios:field>
					
					<p class="text-center">
					  <button class='btn <%= canEdit ?"btn-primary" : "btn-default" %>' type="submit" name="opAddWorkflow" <%= !canEdit ? "disabled='disabled'": "" %>  value="true"><%= glp("ui.com.btn.add") %></button>
					</p>

        </form>
    </jalios:panel>
  </div>
</div>
<%@ include file='/admin/doAdminFooter.jspf' %>



