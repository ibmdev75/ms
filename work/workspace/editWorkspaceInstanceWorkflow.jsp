<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<%  
boolean isDataWriteEnable = channel.isDataWriteEnabled();  
if (!isDataWriteEnable) {  
  JcmsUtil.setDataWriteDisabledMsg(request, userLang);  
}  
jcmsContext.addJavaScript("js/jalios/admin.js");
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.workspace.EditWorkflowInstanceHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />  
</jsp:useBean>
  
<jalios:modal title='ui.work.form.lbl.wf-by-instance.edit' url="work/workspace/editWorkspaceInstanceWorkflow.jsp" 
  formHandler="<%= formHandler %>" css="modal-lg workflow-instance-form" picture="workspace48">
  <%
  boolean isClosing = false;
  if (formHandler.validate() && Util.toBoolean(request.getAttribute("ignoreClosePopup"), false) == false) { 
    isClosing = true;
    %><jalios:javascript>
       JCMS.window.Modal.close(jQuery('.workflow-instance-form').closest("FORM"));
     </jalios:javascript><%
  } 
  
  String wsId = HttpUtil.getDataIdParameter(request, "wsId");
  
  Set<Workflow> selectedWorkflowSet =  new TreeSet(WorkflowManager.getInstance().getAlphabeticalComparator());
  Set<Workflow> tmpSelectedWorkflowSet = formHandler.getSelectedWorkflowSet();
  if(tmpSelectedWorkflowSet != null) {
    selectedWorkflowSet = new TreeSet( WorkflowManager.getInstance().getAlphabeticalComparator());
    selectedWorkflowSet.addAll(tmpSelectedWorkflowSet);
  }
  Set<Workflow> availableWorkflowSet = new TreeSet<Workflow>(WorkflowManager.getInstance().getAlphabeticalComparator());
  availableWorkflowSet.addAll(WorkflowManager.getInstance().getWorkflowSet(formHandler.getType()));
  int nbElt = Math.max(availableWorkflowSet.size(), selectedWorkflowSet.size());
  %>
  <div class="group-edit container-fluid">
    <jalios:message msg='<%= glp("ui.work.form.lbl.wf-by-instance.edit-title", channel.getTypeLabel(formHandler.getType(), workspace, userLang)) %>' title="" />
    <p><%= glp("ui.work.form.lbl.wf-by-instance.edit-group-description") %></p>
    <jalios:field name="groups" value="<%= formHandler.getAvailableGroups()%>" keyword="true" resource="field-vertical" css="nobr">
      <jalios:control type="<%= ControlType.GROUP %>" />
    </jalios:field>
  </div>
  <div class="select-area container-fluid">
    <p><%= glp("ui.work.form.lbl.wf-by-instance.edit-description") %></p>
    <div class="row">        
      <h3 class="col-md-5"><%= glp("ui.work.form.lbl.wf-by-instance.available") %></h3>
      <h3 class="col-md-5 col-md-offset-2"><%= glp("ui.work.form.lbl.wf-by-instance.selected") %></h3>
    </div>
    <div class="row">       
       <ul class="list-group availableWorkflows sortable col-md-5 list-unstyled <%=availableWorkflowSet.size() == 0 ?"empty":"" %>" data-jalios-action="ajax-refresh" data-value="available"  data-jalios-sortable-connect=".selectedWorkflows" data-jalios-ajax-refresh="noscroll nohistory isform">
         <jalios:foreach collection='<%= availableWorkflowSet %>' type='Workflow' name='itWorkflow' counter='itCounter1'>
           <jalios:if predicate='<%= itWorkflow != WorkflowManager.DEFAULT_WORKFLOW && !selectedWorkflowSet.contains(itWorkflow) %>'>
            <%
              String wfId = itWorkflow.getId();
            %>
            <li data-value="<%=wfId%>" class="list-group-item <%= wfId %> handle"><jalios:icon  src="wf" /> <%= itWorkflow.getLabel(userLang) %></li>
           </jalios:if>
         </jalios:foreach>
         <%
           for(int i = 0; i< (nbElt-(availableWorkflowSet.size()-selectedWorkflowSet.size())); i++){
             %><li class=" empty">&nbsp;</li><%
           }
         %>
       </ul>
      <div class="button-column col-md-2">
        <div class="row">
          <button type="submit" value="<%= encodeForHTMLAttribute(formHandler.COPY_ALL_TEXT) %>" class="btn btn-default ajax-refresh col-md-6 col-md-offset-3" name="addAll"><%=encodeForHTML(formHandler.COPY_ALL_TEXT) %></button>
        </div>
        <div class="row">
          <button type="submit" value="<%= encodeForHTMLAttribute(formHandler.DELETE_ALL_TEXT) %>" class="btn btn-default ajax-refresh col-md-6 col-md-offset-3"  name="deleteAll"><%=encodeForHTML(formHandler.DELETE_ALL_TEXT) %></button>
        </div>
      </div>
      <ul class="list-group selectedWorkflows sortable col-md-5 list-unstyled <%=selectedWorkflowSet.size() == 0?"empty":"" %>" data-jalios-action="ajax-refresh"  data-value="selected"   data-jalios-sortable-connect=".availableWorkflows" data-jalios-ajax-refresh="noscroll nohistory isform">
        <jalios:foreach collection='<%= selectedWorkflowSet %>' type='Workflow' name='itWorkflow' counter='itCounter2'>
          <% String wfId = itWorkflow.getId(); %>
          <li data-value="<%=wfId%>" class="list-group-item <%= wfId %> handle"><jalios:icon  src="wf"/> <%= itWorkflow.getLabel(userLang) %></li>
          <input type="hidden" name="selectedWorkflows" value="<%= wfId %>" class="selectedWorkflows"/>                    
        </jalios:foreach>
        <%
        for(int i = 0; i< (nbElt-selectedWorkflowSet.size()-1); i++){
          %><li class=" empty">&nbsp;</li><%
        }
        %>                  
       </ul>
    </div>                
  </div>
   <input type='hidden' name='typeName' value='<%=formHandler.getType().getName() %>' class="typeName"/>
   <input type='hidden' name='"wsId"' value='<%=formHandler.getWsId() == null ?"":formHandler.getWsId() %>' class="wsId"/>
   <input type='hidden' name='opAction' value='' class="action"/>
   <input type='hidden' name='value' value='' class="value"/>
</jalios:modal>