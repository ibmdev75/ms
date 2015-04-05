<%@ include file='/jcore/doInitPage.jspf' %>
<% if (JcmsUtil.checkDataWriteDisabled(request, response, "admin/doAdminMsg.jsp", userLang)) {
  return;
} %>
<jsp:useBean id="wsteFormHandler" scope="page" class="com.jalios.jcms.workspace.EditWSTypeEntryHandler">
  <jsp:setProperty name="wsteFormHandler" property="request"    value="<%= request %>"/>
  <jsp:setProperty name="wsteFormHandler" property="response"   value="<%= response %>"/>
  <jsp:setProperty name="wsteFormHandler" property="*" />
  <jsp:setProperty name="wsteFormHandler" property="ws"         value="<%= workspace.getId() %>"/>
</jsp:useBean>
<%
  if (wsteFormHandler.validate()){
    return;
  }
%>

<%
  TypeEntry   typeEntry = channel.getTypeEntry(wsteFormHandler.getType());
  WSTypeEntry tmpEntry  = wsteFormHandler.getWorkspace().getWSTypeEntry(wsteFormHandler.getType());
  
  String title = glp("ui.wrkspc-edit.typesentry", typeEntry.getLabel(userLang), workspace.getTitle(userLang));
  request.setAttribute("title", title); 
  request.setAttribute("adminTypesMenu", "true"); 
  request.setAttribute("formHandler", wsteFormHandler); 
%>
<%@ include file='/work/doWorkHeader.jspf' %>

<div class="page-header"><h1><% /* %>Workspace TypeEntry Editor<% */ %><%= title %></h1></div>
<%@ include file='/jcore/doMessageBox.jspf' %>
<form action="<%= contextPath %>/work/workspace/editWSTypeEntry.jsp" method="post" name="editForm" class="form-horizontal">

<div class="tab-pane" id="mainTab">
  <div class="tab-page">
    <h2 class="tab"><% /* %>Type's properties<% */ %><%= glp("ui.work.wste-editor.tab") %></h2>

	  <%-- WORKFLOW ------------------------------------------------------------------- --%>
    <%
      List labels = new ArrayList();
      List values = new ArrayList();
      for (Iterator it = WorkflowManager.getInstance().getWorkflowSet(wsteFormHandler.getType()).iterator() ; it.hasNext() ; ){
        Workflow wf = (Workflow) it.next();
        if (WorkflowManager.DEFAULT_WORKFLOW == wf)
          continue;
        labels.add(wf.getLabel(userLang));
        values.add(wf.getId());
      }
    %>
	  <% String enumerateListBoxLabel = "Enumerate List Box"; %>
      <jalios:field  name='<%= "workflowId" %>' label='<%= glp("ui.work.form.lbl.wf") %>' required='<%= false %>' value='<%= wsteFormHandler.getAvailableWorkflowId() %>'>
        <jalios:control settings='<%= new EnumerateSettings().select().enumValues(values).enumLabels(labels) %>' />
      </jalios:field>


  

    <%-- TEMPLATES ------------------------------------------------------------------ --%>
    <% 
      Map<String, Set<TypeTemplateEntry>> tmplMap = typeEntry.getTemplateUsageMap();
      for(Map.Entry itTmplEntry : tmplMap.entrySet()){
        String usage = (String) itTmplEntry.getKey();
        Set<TypeTemplateEntry> tmplSet = (Set<TypeTemplateEntry>) itTmplEntry.getValue();
        
        if (Util.isEmpty(tmplSet)){
          continue;
        }
        
        if (tmplSet.size() == 1){
          TypeTemplateEntry tte = (TypeTemplateEntry) tmplSet.iterator().next();
          continue;
        }
    %>
    <jalios:field name="templates" label='<%= "ui.editportlet.usage."+usage %>' description="ui.work.wste-editor.templates.h">
      <jalios:foreach collection='<%= tmplSet %>' type='TypeTemplateEntry' name='tte'>
        <div class="checkbox">
          <label>
          <input class="formCheckbox" name="templates" value="<%= tte.getName() %>" type="checkbox" <%= wsteFormHandler.hasTemplate(tte.getName()) ? "checked='checked'" : "" %>/>
          <%= tte.getLabel(userLang) %>
          </label>
        </div>
      </jalios:foreach>
    </jalios:field>
    <% } %>
    
    <%-- LABEL --------------------------------------------------------------------- --%>
		<jalios:field  name="label" label="ui.com.lbl.label" ml='<%= channel.isMultilingual() %>' value='<%= wsteFormHandler.getAvailableLabelMap() %>'>
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>


 	  <%-- DESCRIPTION --------------------------------------------------------------------- --%>
	  <jalios:field  name="description" label="ui.com.lbl.description" ml='<%= channel.isMultilingual() %>' value='<%= wsteFormHandler.getAvailableDescriptionMap() %>'>
      <jalios:control settings='<%= new WikiAreaSettings().rows(3) %>' />
    </jalios:field>

  
    <%-- EXTRA DATA INFO ----------------------------------------- --%>
		<jalios:include jsp="/jcore/doEditExtraData.jsp" />
  
	</div>
	
	
  <%-- TAB PROPERTIES ------------------------------------------------------------------- --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.work.wste-editor.tabprops") %></h2>
  
    <% if (wsteFormHandler.showTabCategories()) { %>
    <jalios:field name="categoryTab"  label="ui.work.form.lbl.categories" value='<%= wsteFormHandler.getAvailableCategoryTab() %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    <% } %>
    
    <% if (wsteFormHandler.showTabReadRights()) { %>
    <jalios:field name="readRightTab"  label="ui.work.form.lbl.read-rights" value='<%= wsteFormHandler.getAvailableReadRightTab() %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    <% } %>
    
    <% if (wsteFormHandler.showTabUpdateRights()) { %>
    <jalios:field name="updateRightTab"  label="ui.work.form.lbl.update-rights" value='<%= wsteFormHandler.getAvailableUpdateRightTab() %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    <% } %>
    
    <% if (wsteFormHandler.showTabTemplates()) { %>
    <jalios:field name="templateTab"  label="ui.work.form.lbl.templates" value='<%= wsteFormHandler.getAvailableTemplateTab() %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
    <% } %>
    
    <jalios:field name="workflowTab"  label="ui.work.form.lbl.wf" value='<%= wsteFormHandler.getAvailableWorkflowTab() %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>

    <jalios:field name="advancedTab"  label="ui.work.form.tab.adv" value='<%= wsteFormHandler.getAvailableAdvancedTab() %>'>
      <jalios:control type="<%= ControlType.BOOLEAN %>" />
    </jalios:field>
  </div>
  
  
  <%-- DEFAULT CATEGORIES ------------------------------------------------------------------ --%>
  <% if (wsteFormHandler.showDefaultCategories()) { %>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Default Categories<% */ %><%= glp("ui.adm.type-edit.prop.tab.cat") %></h2>
  
    <%  boolean defaultCat = wsteFormHandler.getAvailableUseDefaultCategories(); %>
  
    <div class="radio">
      <label>
        <input type='radio' onclick="$('wsteCat').hide();" name='useDefaultCategories' value='true'  <%= defaultCat ? "checked='checked'" : "" %>/>
        <%= glp("ui.adm.type-edit.prop.tab.cat.def1") %>
      </label>
    </div>
    <div class="radio">
      <label>
        <input type='radio' onclick="$('wsteCat').show();" name='useDefaultCategories' value='false' <%= defaultCat ? "" : "checked='checked'" %>/>
        <%= glp("ui.adm.type-edit.prop.tab.cat.def2") %>
      </label>
    </div>

    <% Set catSet = channel.getDataSet(wsteFormHandler.getAvailableCategories()); %>
    <div id="wsteCat" <%= defaultCat ? "style='display: none;'" : "" %>>
      <jalios:treecatview prefix="cids" 
                          input="cids" 
                          type="checkbox"
                          
                          opened="<%= catSet %>" 
                          checked="<%= catSet %>" 
                          highlighted="<%= catSet %>" 
                          collection="<%= channel.getRootCategory().getChildrenSet() %>"
                          selectable="true" 
                          dragdrop="true"
                          showCtxMenu="true"
                          css="autocomplete" />      
    </div>

  </div>
  <% } %>
  
  
  
	<%-- DEFAULT READ RIGHT ------------------------------------------------------------------ --%>
  <% if (wsteFormHandler.showDefaultReadRights()) { %>  
	<div class="tab-page">
	  <h2 class="tab"><% /* %>Default Read Rights<% */ %><%= glp("ui.adm.type-edit.prop.tab.rr") %></h2>
    <% boolean defaultRights = wsteFormHandler.getAvailableUseDefaultGroups(); %>
    
    <div class="radio">
      <label>
        <input type='radio' onclick="$('wsteRights').hide();" name='useDefaultGroups' value='true'  <%= defaultRights ? "checked='checked'" : "" %>/>
        <%= glp("ui.adm.type-edit.prop.tab.rr.def1") %>
      </label>
    </div>
    <div class="radio">
      <label>
        <input type='radio' onclick="$('wsteRights').show();" name='useDefaultGroups' value='false' <%= defaultRights ? "" : "checked='checked'" %>/>
        <%= glp("ui.adm.type-edit.prop.tab.rr.def2") %>
      </label>
    </div>

    <div id="wsteRights" <%= defaultRights ? "style='display: none;'" : "" %>>
      <jalios:field  name='<%= "gids" %>' value='<%= wsteFormHandler.getAvailableGroups() %>' mv='<%= 3 %>'>
        <jalios:control type="<%= ControlType.GROUP %>" />
      </jalios:field>
    </div>

	</div>
  <% } %>
</div>
	
	  
	<%-- BUTTONS -------------------------------------------------------------------- --%> 
  <hr>
  <input class='btn btn-primary' type='submit' name='<%= tmpEntry.isForced() ? "opCreate" : "opUpdate" %>' value='<%= glp("ui.com.btn.save") %>' />
  <input class='btn btn-default' type='submit' name='opCancel' value='<%= glp("ui.com.btn.cancel") %>' />
  <jalios:if predicate='<%= !tmpEntry.isForced() %>'><input class='btn btn-default' type='button' name='opDelete' value='<%= glp("ui.com.btn.delete") %>' onclick="confirmSubmitForm(window, window.document.editForm,'opDelete','<%=  glp("msg.wste-editor.delete",typeEntry.getLabel(userLang), workspace.getTitle(userLang)) %>')" /></jalios:if>
  <input name='redirect' type='hidden' value='<%= wsteFormHandler.getRedirect() %>' />
  <input name='typeName' type='hidden' value='<%= wsteFormHandler.getType().getName() %>'/>
  <input name='action'   type='hidden' value='true'/>
</form>

<%@ include file='/work/doWorkFooter.jspf' %>