<%--
  @Summary: Manage workspace of the caddy
  @Category: Admin Area / Caddy
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.caddy.WorkspaceCaddyManagerHandler">
  <jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<% 
  if (formHandler.validate()) {
    return;
  }
  request.setAttribute("caddyWAMenu", "true");
  request.setAttribute("caddyWorkspaceMenu", "true");
  request.setAttribute("title", glp("ui.work.ws-caddy.title", 0));
  int formElementCount = 0;
%>
<%@ include file='/work/doWorkHeader.jspf' %>
<h1 class='boTitle icon iconWorkspace'><% /* %>Caddy Manager<% */ %><%= glp("ui.work.ws-caddy.title", Caddy.getCaddy(request).getWorkspaceListSize()) %></h1>
<form action='work/caddy/workspaceCaddyManager.jsp' name='editForm' method='post' class="form-horizontal">

    <%@ include file='/jcore/doMessageBox.jspf' %>
        
    <div class="tab-pane" id="mainTab">

      <%-- *** GENERAL TAB ***************************************** --%> 
      <div class="tab-page">
        <h2 class="tab"><% /* %>General<% */ %><%= glp("ui.com.tab.general") %></h2>  
        <%@ include file='/work/caddy/doCommonCaddyManager.jspf' %>
      </div>
      
      <%-- *** TYPES TAB ***************************************** --%> 
      <div class="tab-page">
        <h2 class="tab"><% /* %>Types<% */ %><%= glp("ui.wrkspc-edit.types") %></h2>
      
        <%
          String[] rootClasses = {Content.class.getName(), PortalElement.class.getName(), Form.class.getName() };
          List     allTypeList = new ArrayList();
          Workflow wfFileDoc   = WorkflowManager.getInstance().getWorkflow("filedocument");
          int      gbCounter   = 0;
        %>
          <div class="tab-pane" id="editWorkspaceType-tab"> 
          <jalios:foreach array='<%= rootClasses %>' type='java.lang.String' name='itClassName' counter='itClassCounter'>
          <% 
            Class  clazz     = channel.getClass(itClassName);
            String clazzName = Util.getClassShortName(clazz);
            List   typeList  = channel.getSubTypeList(clazz, userLang);
            typeList.remove(FileDocument.class);
            allTypeList.addAll(typeList);
            allTypeList.add(clazz);
            boolean clazzIsCommon = !WorkspaceCaddyManagerHandler.NOT_COMMON.equals(formHandler.getAvailableTypeMap().get(clazz));
          %>
            <div class="tab-page">
            <h2 class="tab"><% /* %>Clazz<% */ %><%= channel.getTypeLabel(clazz, formHandler.getWorkspace(), userLang) %></h2>
            <table class="table-data table-condensed">
            <tr>
             <th colspan='3' >
                <% /* %>Type<% */ %><%= channel.getTypeLabel(clazz, formHandler.getWorkspace(), userLang) %>&nbsp;
                <select name='typeMap' class="form-control">
                  <option value='<%= clazz.getName() %>|<%= WorkspaceCaddyManagerHandler.NOT_COMMON %>' <%= clazzIsCommon ? "" : "selected" %>><%= glp("ui.work.ws-caddy.lbl.not-common-type") %></option>
                  <option value='<%= clazz.getName() %>|<%= WorkflowManager.DEFAULT_WORKFLOW.getId() %>' <%= WorkflowManager.DEFAULT_WORKFLOW.getId().equals(formHandler.getAvailableTypeMap().get(clazz)) ? "selected" : "" %>  >&nbsp;</option>
              <jalios:foreach collection='<%= WorkflowManager.getInstance().getWorkflowSet(clazz) %>' type='Workflow' name='itWorkflow' counter='itCounter2'>
                <jalios:if predicate='<%= itWorkflow != WorkflowManager.DEFAULT_WORKFLOW && itWorkflow != wfFileDoc %>'>
                  <option value='<%= clazz.getName() %>|<%= itWorkflow.getId() %>' <%= itWorkflow.getId().equals(formHandler.getAvailableTypeMap().get(clazz)) ? "selected" : "" %>  ><%= itWorkflow.getLabel(userLang) %></option>
                </jalios:if>
              </jalios:foreach>
                </select><% formElementCount++; %>
              </th>
            </tr>
            <tr>
              <th width='30%'><% /* %>Type Name<% */ %><%= glp("ui.adm.type-list.lbl.name") %></th>
             <th width='30%'>
                <% /* %>Workflow<% */ %><%= glp("ui.work.form.lbl.wf") %>
                <a href='#' onclick='selectAllwithId(document.editForm, "typeMap", "<%= clazzName %>"); return false;'><jalios:icon src='bullet-square-down-arrow' title='<%= glp("ui.com.alt.select-all") %>'/></a>
              </th>
            </tr>
            <%  int trCounter = 1;%>
            <jalios:foreach collection='<%= typeList %>' type='java.lang.Class' name='itClass' counter='itCounter3'>
            <% 
               TypeEntry te = channel.getTypeEntry(itClass); 
               String shortClass = Util.getClassShortName(itClass);
               boolean itClassIsCommon = !WorkspaceCaddyManagerHandler.NOT_COMMON.equals(formHandler.getAvailableTypeMap().get(itClass));
               String trStyle = te.isAbstract() ? "style='font-style: italic;'" : "";
            %>
            <jalios:if predicate='<%= isAdmin || formHandler.getAvailableTypeMap().containsKey(itClass)%>'> 
            <tr <%= trStyle %>>
              <td><span <%= itClassIsCommon ? "" : "style='background-color: #FFCC88'" %><%= itClassIsCommon && formHandler.getAvailableTypeMap().containsKey(itClass) ? "class='highlight'" : "" %>><%= te.getLabel(userLang) %></span></td>
              <td align='left'  class='text-left'>
                <select name='typeMap' id='<%= clazzName %><%= gbCounter++ %>' class="form-control">
                  <option value='<%= itClass.getName() %>|<%= WorkspaceCaddyManagerHandler.NOT_COMMON %>' <%= itClassIsCommon ? "" : "selected" %>><%= glp("ui.work.ws-caddy.lbl.not-common-type") %></option>
                  <option value='<%= itClass.getName() %>|' <%= itClassIsCommon && formHandler.getAvailableTypeMap().containsKey(itClass) ? "selected" : "" %>><% /* %>Enabled<% */ %><%= glp("ui.wrkspc-edit.usetype") %></option>
                  <jalios:if  predicate='<%= isAdmin %>'>
                    <option value='<%= itClass.getName() %>|disabled' <%= itClassIsCommon && !formHandler.getAvailableTypeMap().containsKey(itClass) ? "selected" : "" %>><% /* %>Disable Type<% */ %><%= glp("ui.wrkspc-edit.notype") %></option>
                  </jalios:if>
                  <optgroup label="<%= glp("ui.wrkspc-edit.usewf") %>">
                  <jalios:foreach collection='<%= WorkflowManager.getInstance().getWorkflowSet(itClass) %>' type='Workflow' name='itWorkflow' counter='itCounter2'>
                    <jalios:if predicate='<%= itWorkflow != WorkflowManager.DEFAULT_WORKFLOW && itWorkflow != wfFileDoc %>'>
                      <option value='<%= itClass.getName() %>|<%= itWorkflow.getId() %>' <%= itWorkflow.getId().equals(formHandler.getAvailableTypeMap().get(itClass)) ? "selected" : "" %>  ><%= itWorkflow.getLabel(userLang) %></option>
                    </jalios:if>
                  </jalios:foreach>
                  </optgroup>
              </select><% formElementCount++; %>
            </td>
            </tr><% trCounter++; %>
            </jalios:if>
            </jalios:foreach>
        </table>
        </div>
        </jalios:foreach>
        </div>
      
        <jalios:foreach collection='<%= formHandler.getAvailableTypeMap().entrySet() %>' type='Map.Entry' name='itEntry'>
          <jalios:if predicate='<%= itEntry.getKey() != null && !allTypeList.contains(itEntry.getKey()) && itEntry.getKey() != FileDocument.class %>'>
            <input type='hidden' name='typeMap' value='<%= ((Class)itEntry.getKey()).getName() %>|<%= itEntry.getValue() %>' /><% formElementCount++; %>
          </jalios:if>
        </jalios:foreach>
        <input type='hidden' name='typeMap'   value='<%= FileDocument.class.getName() %>|<%= wfFileDoc.getId() %>'/><% formElementCount++; %>
        <input type='hidden' name='rootClass' value='<%= Util.join(rootClasses, ",") %>' /><% formElementCount++; %>
  
        <ul>
          <li><span style='background-color: #FFCC88'><%= glp("ui.com.lbl.type")%></span> : <%= glp("ui.work.ws-caddy.lbl.differ-legend") %></li>
          <li><span class='highlight'><%= glp("ui.com.lbl.type")%></span> : <%= glp("ui.work.ws-caddy.lbl.common-legend") %></li>
        </ul>
      </div>
            
      <%-- *** ADVANCED TAB ***************************************** --%> 
      <div class="tab-page">
        <h2 class="tab"><% /* %>Parent<% */ %><%= glp("ui.work.form.tab.adv") %></h2>

        <%-- Workspace Order --%>
        <jalios:field name="order" label="ui.wrkspc-edit.lbl.order">
          <jalios:control settings='<%= new EnumerateSettings().enumValues("ResetOrder", "CaddyOrder").enumLabels("ui.work.grp-caddy.lbl.order-reset", "ui.work.grp-caddy.lbl.order-caddy") %>' />
        </jalios:field>
        
        <%-- Administrators ------------------------------------------------------------ --%>
        <% Set administratorsValues = formHandler.getAvailableAdministratorsSet(); %>
        <jalios:field  name='<%= "administratorsIds" %>' required='<%= false %>' value='<%= administratorsValues %>' mv='<%= 2 %>'
                       label="ui.work.ws-caddy.lbl.administrators">
          <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
        </jalios:field>
          
        <%-- Categories ------------------------------------------------------------ --%>
        <jalios:field name='<%= "cids" %>'
                    label='<%= "ui.work.form.lbl.categories" %>'
                    value='<%= formHandler.getCategorySet() %>'>
        <% if (loggedMember.canEditCategories()) { %>
          <div>          
            <label>
              <input type="checkbox" name="noCommonCategory" value="true" />
              <% /* %>Remove common categories<% */ %><%= glp("ui.work.caddy.lbl.no-common-cat") %>
            </label>
          </div>          
        <% } %>
        
        <p><%= glp("ui.work.ws-caddy.lbl.categories") %></p>
        <jalios:control settings='<%= new CategorySettings().tree().multiple().filter(CategoryFilter.READ) %>' />
      </jalios:field>
      </div>
    </div>

  <% ArrayList workspaceList = Caddy.getCaddy(request).getWorkspaceList(); %>
  <jalios:pager name='caddyPagerHandler' declare='true' action='init' size='<%= workspaceList.size() %>'/>

  <p>
  <%
   boolean showExportCSV = true;
   String dataType = "Workspace";
  %>
  <%@ include file='/work/caddy/doCommonCaddyManagerButton.jspf' %>
  </p>
  
  <%-- WORKSPACE CADDY CONTENT --------------------------------------------------------------- --%>
  <jalios:if predicate='<%= caddyPagerHandler.getItemsNbr() != 0 %>'>
    <div style="margin-top:15px;">
      <table id='groupTable' class="table-data table-condensed">
        <tr>
          <th colspan="3"></th>
          <th width='100%' nowrap="nowrap"><% /* %>Title<% */ %><%= glp("ui.com.lbl.title") %></th>
          <th nowrap="nowrap"><% /* %>Order<% */ %><%= glp("ui.adm.wrkspc-list.lbl.order") %></th>
          <th nowrap="nowrap"><% /* %>#Groups<% */ %><%= glp("ui.adm.wrkspc-list.lbl.grp-cnt") %></th>
          <th nowrap="nowrap"><% /* %>#Members<% */ %><%= glp("ui.adm.wrkspc-list.lbl.mbr-cnt") %></th>
          <th nowrap="nowrap"><% /* %>Created<% */ %><%= glp("ui.com.lbl.cdate") %></th>
          <th nowrap="nowrap"><% /* %>Ext.<% */ %><%= glp("ui.adm.wrkspc-list.lbl.ext") %></th>
          <th nowrap="nowrap"><% /* %>ID<% */ %><%= glp("ui.com.lbl.id") %></th>
        </tr>
      
        <jalios:foreach name="itWorkspace" 
                        type="Workspace"
                        collection="<%= workspaceList %>"
                        max="<%= caddyPagerHandler.getPageSize() %>"
                        skip="<%= caddyPagerHandler.getStart() %>"> 
        <tr> 
          <td class="text-right" nowrap="nowrap">
            <%= caddyPagerHandler.getStart() + itCounter.intValue() %>.
          </td>
          <td nowrap='nowrap'><jalios:edit id="<%= itWorkspace.getId() %>" /></td>
          <td class="text-left" nowrap="nowrap">
            <a href="work/caddy/workspaceCaddyManager.jsp?opRemoveCaddy=true&amp;removeIds=<%= itWorkspace.getId() %>" onclick="this.href=JCMS.Security.getUrlWithCSRFToken(this.href); return true;"><jalios:icon src="caddy-out" title='<%= glp("ui.com.alt.out-caddy") %>'  /></a>
          </td>
          <td nowrap="nowrap">
            <jalios:icon src='work'  />
            <a href='work/workspace/adminWorkspace.jsp?ws=<%= itWorkspace.getId() %>'><%= itWorkspace.getTitle(userLang) %></a>
            <% 
              if (formHandler.isPreviewing()) {
                String previewedString = formHandler.previewSearchAndReplace(itWorkspace.getTitle(userLang), userLang);
                boolean previewedStringDiffers = !previewedString.equals(itWorkspace.getTitle(userLang));
            %>
              <% if (previewedStringDiffers) { %><span style="color: red;"><% } %>
              <br /> ==> <%= previewedString %>
              <% if (previewedStringDiffers) { %></span><% } %>
            <% } %>          
          </td>
          <td class="text-right"><%= itWorkspace.getOrder() %></td>
          <td class="text-right">
            <% if (Util.notEmpty(itWorkspace.getGroupSet())) { %>
            <a href="admin/groupList.jsp?wid=<%= itWorkspace.getId() %>"><%= itWorkspace.getGroupSet().size() %></a>
            <% } else { %>
            <%= itWorkspace.getGroupSet().size() %>
            <% } %>
          </td>
          <td class="text-right"><%= itWorkspace.getMemberSet().size() %></td>
          <td class="text-right"><jalios:date date='<%= itWorkspace.getCdate() %>' format='<%= "short" %>'/></td>
          <td class="text-center"><%= itWorkspace.getExtension() != null ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
          <td><%= itWorkspace.getId() %></td>
        </tr>
      </jalios:foreach>
      </table>
        
      <jalios:pager name='caddyPagerHandler'/>
    </div>
  </jalios:if>
  
</form>

<%@ include file='/work/doWorkFooter.jspf' %>