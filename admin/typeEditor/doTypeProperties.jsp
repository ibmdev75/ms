<%--
  @Summary: Type Properties Editor
  @Category: Admin / Types
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: False
  @Deprecated: False
  @Since: jcms-4.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>

<% 
com.jalios.jcms.handler.TypeEditorHandler formHandler = (com.jalios.jcms.handler.TypeEditorHandler)request.getAttribute("formHandler"); 
String rootClassName = formHandler.getRootClassName();
%>
  
  <%-- *** TYPE PROPERTIES ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Type Properties<% */ %><%= glp("ui.adm.type-edit.prop.tab") %></h2>
    <% { // OPEN PROPERTIES SCOPE %>
    <form method="post" action="admin/typeListEditor.jsp" name="editFormProperties" class="form-horizontal">
    
    <input type='hidden' name="rootClass" value="<%= rootClassName %>" />
    <div class="tab-pane br" id="typeEditor-prop-tab">

      <%-- *** GENERAL ******************************************* --%>
      <div class="tab-page">
        <h2 class="tab"><% /* %>General<% */ %><%= glp("ui.com.tab.general") %></h2>
      
        <%-- NAME ------------------------------------------------------- --%>  
        <jalios:field name="typeLabels" label="ui.com.lbl.name" required='<%= true %>' ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getTypeLabelMap() %>'>
          <jalios:control settings='<%= new TextFieldSettings().showLanguageChooser() %>' />
        </jalios:field>

        <%-- DESCRIPTION ------------------------------------------------------- --%>  
        <jalios:field  name="typeDescriptions" label="ui.com.lbl.description" tooltip="ui.adm.type-edit.lbl.desc.h" ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getTypeDescriptionMap() %>'>
          <jalios:control settings='<%= new TextAreaSettings().rows(2) %>' />
        </jalios:field>

        <%-- FRONT EDIT ------------------------------------------------------- --%> 
        <jalios:field name="unitFieldEdition" label="ui.adm.type-list.lbl.unit-field-edition" tooltip="ui.adm.type-list.lbl.unit-field-edition.h" value="<%= formHandler.isTypeUnitFieldEdition() %>">
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>

        <%-- AUDIENCED PUBLICATION ------------------------------------------------------- --%> 
        <% if (!formHandler.isFormEditor() && !formHandler.isDatabase()) { %>
        <jalios:field name="audienced" label="ui.adm.type-list.lbl.audienced" tooltip="ui.adm.type-list.lbl.audienced.h" value="<%= formHandler.isAudienced() %>">
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>          
        <% } %>
        
        <%-- VISIBLE TAB ------------------------------------------------------- --%> 
        <% if (formHandler.isContentEditor() || formHandler.isPortletEditor()) { %>
        <jalios:field label="ui.adm.type-list.lbl.visible-tab" tooltip="ui.adm.type-list.lbl.visible-tab.h" >
          <div class="checkbox">        
            <label><input type="checkbox" name="categoryTab"    value="true"  <%= formHandler.isTypeCategoryTab() ?    "checked='checked'" : "" %>> <%= glp("ui.work.form.lbl.categories") %></label>
          </div>         
          <div class="checkbox">        
            <label><input type="checkbox" name="readRightTab"   value="true"  <%= formHandler.isTypeReadRightTab() ?   "checked='checked'" : "" %>> <%= glp("ui.work.form.lbl.read-rights") %></label>
          </div>         
          <div class="checkbox">        
            <% if (!formHandler.isDatabase()) { %>
            <label><input type="checkbox" name="updateRightTab" value="true"  <%= formHandler.isTypeUpdateRightTab() ? "checked='checked'" : "" %>> <%= glp("ui.work.form.lbl.update-rights") %></label>
          </div>         
          <div class="checkbox">        
            <label><input type="checkbox" name="templateTab"    value="true"  <%= formHandler.isTypeTemplateTab() ?    "checked='checked'" : "" %>> <%= glp("ui.work.form.lbl.templates") %></label>
            <% } %>
          </div>         
          <div class="checkbox">        
            <label><input type="checkbox" name="workflowTab"    value="true"  <%= formHandler.isTypeWorkflowTab() ?    "checked='checked'" : "" %>> <%= glp("ui.work.form.lbl.wf") %></label>
          </div>         
          <div class="checkbox">        
            <label><input type="checkbox" name="advancedTab"    value="true"  <%= formHandler.isTypeAdvancedTab() ?    "checked='checked'" : "" %>> <%= glp("ui.work.form.tab.adv") %></label>
          </div>
        </jalios:field>
        <% } %>
          
        <%-- FORM SPECIFIC PROPERTIES ------------------------------------------------------- --%> 
        <% if (formHandler.isFormEditor()) { %>
        <%--    FORM AUTHOR ------------------------------------------------------- --%> 
        <jalios:field  name="formAuthorId" label="ui.adm.type-list.lbl.form-author" tooltip="ui.adm.type-list.lbl.form-author.h" value='<%= formHandler.getTypeFormAuthor() %>'>
          <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
        </jalios:field>

        <%--    FORM WORKSPACE ---------------------------------------------------- --%> 
        <jalios:field  name="formWorkspaceId" label="ui.com.lbl.workspace" tooltip="ui.adm.type-list.lbl.form-ws.h" value='<%= formHandler.getTypeFormWorkspace() %>'>
          <jalios:control type="<%= ControlType.WORKSPACE %>" />
        </jalios:field>

        <%--    FORM NOTIFY ------------------------------------------------------- --%> 
        <jalios:field name="formNotify" label="ui.adm.type-list.lbl.form-notify" tooltip="ui.adm.type-list.lbl.form-notify.h" value="<%= formHandler.isTypeFormNotify() %>">
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>     

        <%--    FORM REDIRECT ------------------------------------------------------- --%> 
        <jalios:field label="ui.adm.type-list.lbl.form-redirect" tooltip="ui.adm.type-list.lbl.form-redirect.h" value="<%= formHandler.isTypeFormNotify() %>">
          <div class="radio">        
            <% boolean isChecked = formHandler.getTypeFormRedirectMode().equals("display"); %>
            <label><input type='radio' name='formRedirectMode' value='display' <%= isChecked ? "checked='checked'" : "" %>/> <%= glp("ui.adm.type-list.lbl.form-redirect-dpl") %></label>
          </div>

          <div class="radio">        
            <% isChecked = formHandler.getTypeFormRedirectMode().equals("home"); %>
            <label><input type='radio' name='formRedirectMode' value='home' <%= isChecked ? "checked='checked'" : "" %>/> <%= glp("ui.adm.type-list.lbl.form-redirect-home") %></label>
          </div>

          <div class="radio">        
            <% isChecked = formHandler.getTypeFormRedirectMode().equals("url"); %>
            <label><input type='radio' name='formRedirectMode' value='url' <%= isChecked ? "checked='checked'" : "" %>/> <%= glp("ui.com.lbl.url") %></label>
            <jalios:field name="formRedirectUrl" value='<%= isChecked ? formHandler.getTypeFormRedirectValue() : "" %>' resource="field-inline">
              <jalios:control type="<%= ControlType.TEXTFIELD %>" />
            </jalios:field>            
          </div>

          <div class="radio">        
            <% isChecked = formHandler.getTypeFormRedirectMode().equals("currentCategory"); %>
            <label><input type='radio' name='formRedirectMode' value='currentCategory' <%= isChecked ? "checked='checked'" : "" %>/> <%= glp("ui.adm.type-list.lbl.form-redirect-curcat") %></label>
          </div>

          <div class="radio">        
            <% isChecked = formHandler.getTypeFormRedirectMode().equals("content"); %>
            <label><input type='radio' name='formRedirectMode' value='content' <%= isChecked ? "checked='checked'" : "" %>/> <%= glp("ui.com.core-type.lbl.Content") %></label>
            <jalios:field  name="formRedirectContent" value='<%= isChecked ? channel.getPublication(formHandler.getTypeFormRedirectValue()) : null %>' resource="field-inline">
              <jalios:control settings='<%= new PublicationSettings().superType(Content.class) %>' />
            </jalios:field>
          </div>
          
          <div class="radio">        
            <% 
              isChecked = formHandler.getTypeFormRedirectMode().equals("category");
              Set<Category> categoryTreeValues = new HashSet<Category>();
              if (isChecked) {
                Category selectedCat = channel.getCategory(formHandler.getTypeFormRedirectValue());
                if (selectedCat != null) {
                  categoryTreeValues.add(selectedCat);
                }
              }
            %>
            <label><input type='radio' name='formRedirectMode' value='category' <%= isChecked ? "checked='checked'" : "" %>/> <%= glp("ui.com.lbl.category") %></label>
						<jalios:field  name="formRedirectCategory" value="<%= categoryTreeValues %>" resource="field-inline">
              <jalios:control settings='<%= new CategorySettings().tree().multiple() %>' />
            </jalios:field>
          </div>
        </jalios:field>
        
        <%--    FORM 1-SUBMIT ------------------------------------------------------- --%> 
        <jalios:field name="formOneSubmit" label="ui.adm.type-list.lbl.form-1-submit" tooltip="ui.adm.type-list.lbl.form-1-submit.h" value="<%= formHandler.isTypeFormOneSubmit() %>">
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>  
        <% } %>
          
        <%-- ABSTRACT TYPE ------------------------------------------------------- --%> 
        <jalios:field name="abstract" label="ui.adm.type-list.lbl.abstract" tooltip="ui.adm.type-list.lbl.abstract.h" value="<%= formHandler.isTypeAbstract() %>">
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>  

        <%-- EXTENDS ------------------------------------------------------- --%> 
        <jalios:field label="ui.adm.type-list.lbl.extends" tooltip="ui.adm.type-list.lbl.extends.h">

          <select name="superClass" class="form-control" onchange="Element[(this.options.selectedIndex == this.options.length - 1) ? 'show' : 'hide']($('customClass'));">
            <%
            String currentSuperType = formHandler.getTypeSuperClass();
            boolean isContent = TypeUtil.isSubTypeOf(formHandler.getTypeElt(), Content.class); 
            %>
            <% if (isContent) { %>
            <option value="<%= Content.class.getName() %>"></option>
            <option>------------------</option>
            <% } %>
            <jalios:foreach collection="<%= formHandler.getAllowedSuperTypeList() %>" name="itType" type="org.jdom.Element">
              <%
                boolean itTypeSelected = currentSuperType.equals("generated." + itType.getAttributeValue("name"));
                String itTypeLabelProperty = TypeUtil.getTypeLabelProperty(itType.getAttributeValue("name"));
                String itTypeLabel = Util.getString(TypeUtil.getLabel(itType, userLang), glp(itTypeLabelProperty));
              %>
              <option value='generated.<%= itType.getAttributeValue("name") %>' <%= itTypeSelected ? "selected='selected'" : "" %>><%= itTypeLabel %></option>
            </jalios:foreach>
            <% if (isContent) { %>
              <jalios:foreach array='<%= new Class[] {FileDocument.class, DBFileDocument.class}%>' name="itClass" type="Class">
              <option value='<%= itClass.getName() %>' <%= itClass.getName().equals(currentSuperType) ? "selected='selected'" : "" %>><%= channel.getTypeLabel(itClass, userLang) %></option>
              </jalios:foreach>
            <% } %>
            <option>------------------</option>
            <option value="custom" <%= formHandler.isCustomSuperClass() ? "selected='selected'" : "" %>><%= glp("ui.adm.type-list.lbl.cust-class") %></option>
          </select>

          <div id='customClass' <%= formHandler.isCustomSuperClass() ? "style='display: block;'" : "style='display: none;'" %>>
            <input class="form-control" type='text' name='customSuperClass' value='<%= formHandler.isCustomSuperClass() ? formHandler.getTypeSuperClass() : "" %>' size='50' />
          </div>
        </jalios:field>

          <%-- SUBTYPES ------------------------------------------------------- --%> 
          <% if (!formHandler.getSubEltList().isEmpty()) { %>
          <jalios:field label="ui.adm.type-edit.lbl.subtypes" tooltip="ui.adm.type-edit.lbl.subtypes.h">
            <jalios:foreach collection="<%= formHandler.getSubEltList() %>" name="itType" type="org.jdom.Element">
             <%
              String itTypeLabelProperty = TypeUtil.getTypeLabelProperty(itType.getAttributeValue("name"));
              String itTypeLabel = Util.getString(TypeUtil.getLabel(itType, userLang), glp(itTypeLabelProperty));
             %>
            <p class="form-control-static">
            
            <a href="admin/typeEditor.jsp?type=<%= itType.getAttributeValue("name") %>" title="<%= glp("ui.com.alt.edit") %>"><%= itTypeLabel %></a>
            </p>
            </jalios:foreach>
          </jalios:field>
          <% } %>
          
          <%-- STORAGE (JSTORE / HIBERNATE) --------------------------------------------- --%> 
          <% if (formHandler.isDatabaseSupported()) { %>
          <jalios:field label="ui.adm.type-list.lbl.storage" tooltip="ui.adm.type-list.lbl.storage.h">
            <div class="radio">
              <label>
                <input type="radio" name="database" value="false" <%= !formHandler.isDatabase() ? "checked='checked'" : "" %>/> 
                <jalios:icon src="store" alt="JStore"  title='<%= glp("ui.adm.type-list.lbl.storage.jstore") %>' />
                <%= glp("ui.adm.type-list.lbl.storage.jstore") %>
              </label> 
            </div>
            <div class="radio">
              <label>    
                <input type="radio" name="database" value="true" <%= formHandler.isDatabase() ? "checked='checked'" : "" %>/> 
                <jalios:icon src="db" alt="DB"  title='<%= glp("ui.adm.type-list.lbl.storage.db") %>' />
                <%= glp("ui.adm.type-list.lbl.storage.db") %>
              </label> 
            </div>            
          </jalios:field>
          <% } %>
          
          <% if (formHandler.isDatabaseSupported() && formHandler.isDatabase()) { %>
          <%-- DBData Revision --------------------------------------------- --%> 
          <jalios:field name="revision" label="ui.adm.type-list.lbl.revision" tooltip="ui.adm.type-list.lbl.revision.h" value="<%= formHandler.isTypeRevision() %>">
            <jalios:control type="<%= ControlType.BOOLEAN %>" />
          </jalios:field>            
        
          <%-- Open Role --------------------------------------------- --%> 
          <jalios:field name="openRole" label="ui.adm.type-list.lbl.openrole" tooltip="ui.adm.type-list.lbl.openrole.h" value="<%= formHandler.isTypeOpenRole() %>">
            <jalios:control type="<%= ControlType.BOOLEAN %>" />
          </jalios:field>              
          <% } %>

        </table>
      </div>

      <%-- *** DEF CATEGORIES ******************************************* --%>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Default Categories<% */ %><%= glp("ui.adm.type-edit.prop.tab.cat") %></h2>
        <jalios:message msg="ui.adm.type-edit.prop.cat.h" />
        <% Set catSet = formHandler.getCategorySet("cids"); %>
        <jalios:treecatview 
          prefix="cids" 
          input="cids" 
          
          opened="<%= catSet %>" 
          checked="<%= catSet %>" 
          highlighted="<%= catSet %>" 
          
          collection="<%= channel.getRootCategory().getChildrenSet() %>"
          filter="<%= com.jalios.jcms.taglib.CategoryFilter.USE %>"
          
          selectable="true" 
          dragdrop="true"
          showCtxMenu="true"
          css="autocomplete" />        
      </div>
      
      <%-- *** DEF READ RIGHTS ******************************************* --%>
      <% if (!formHandler.isDatabase()) { %>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Default Read Rights<% */ %><%= glp("ui.adm.type-edit.prop.tab.rr") %></h2>
        
        <jalios:message msg="ui.adm.type-edit.prop.rr.h" />
        
        <jalios:field  name="authGids" label="ui.adm.type-edit.prop.tab.rr" value='<%=  formHandler.getAuthorizedGroupSet() %>' mv='<%= 3 %>'>
          <jalios:control type="<%= ControlType.GROUP %>" />
        </jalios:field>
      </div>
      <% } %>

      <%-- *** ADVANCED ******************************************* --%>
      <div class="tab-page">
        <h2 class="tab"><% /* %>Advanced<% */ %><%= glp("ui.adm.type-edit.prop.tab.adv") %></h2>
        <jalios:message level="<%= com.jalios.jcms.context.MessageLevel.WARN %>" msg="ui.adm.type-edit.prop.tab.adv.h" />
        
        <%-- JAVA NAME ------------------------------------------------------- --%> 
        <jalios:field name="newName" label="ui.adm.type-edit.fld.lbl.j-name" tooltip="ui.adm.type-edit.fld.lbl.j-name.h" required="true" value="<%= formHandler.getTypeName() %>">
          <% if (formHandler.canEditJavaName()) { %>       
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
          <% } else { %>
          <p class="form-control-static"><code><%= formHandler.getTypeName() %></code></p>
          <% } %>          
          <input name="name" type="hidden" value="<%= formHandler.getTypeName() %>" />          
        </jalios:field>     

        <%-- CUSTOM FORM HANDLER ------------------------------------------------------- --%> 
        <jalios:field name="customFormHandler" label="ui.adm.type-edit.fld.lbl.handler" tooltip="ui.adm.type-edit.fld.lbl.handler.h" value="<%= formHandler.getTypeCustomFormHandler() %>">
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>     

        <%-- CUSTOM SUPER FORM HANDLER ------------------------------------------------------- --%> 
        <jalios:field name="customSuperFormHandler" label="ui.adm.type-edit.fld.lbl.s-handler" tooltip="ui.adm.type-edit.fld.lbl.s-handler.h" value="<%= formHandler.getTypeCustomSuperFormHandler() %>">
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>     


        <%-- CUSTOM INTERFACES ------------------------------------------------------------ --%> 
        <jalios:field name="customInterfaces" label="ui.adm.type-edit.fld.lbl.interface" tooltip="ui.adm.type-edit.fld.lbl.interface.h" value="<%= formHandler.getTypeCustomInterfaces() %>">
          <jalios:control type="<%= ControlType.TEXTAREA %>" />
        </jalios:field>     

        <%-- HIBERNATE MAPPING ------------------------------------------------------------ --%> 
        <% if (formHandler.isDatabaseSupported() && formHandler.isDatabase()) { %>
        <jalios:field name="hbm" label="ui.adm.type-edit.fld.lbl.hbm" tooltip="ui.adm.type-edit.fld.lbl.hbm.h" value="<%= formHandler.isTypeHbm() %>">
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>   
        <% } %>

      </div>
      </div>

      <input type="hidden" name="pos" value="<%= formHandler.getTypePos() %>" />
      <input type="hidden" name="type" value="<%= formHandler.getTypeName() %>" />
      <input type="hidden" name="redirect" value="admin/typeEditor.jsp?type=<%= formHandler.getTypeName() %>" />
      
      <% String confirmDelete = encodeForJavaScript(glp("msg.js.confirm-delete", formHandler.getTypeLabel())); %>
      <div>
        <button class='btn btn-primary' type="submit" name="opUpdate" value='true'><%= glp("ui.com.btn.update") %></button>
        <button class='btn btn-default' type="button" name="opDelete" value='true' onclick='confirmAction("<%= confirmDelete %>", "<%= contextPath %>/admin/typeListEditor.jsp?opDelete=true&amp;name=<%= formHandler.getTypeName() %>")' ><%= glp("ui.com.btn.delete") %></button>
      </div>
    </form>
    <% } // CLOSE PROPERTIES SCOPE %>
   </div>
