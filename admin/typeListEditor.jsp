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

  if (!checkAccess("admin/dev/types")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.TypeListEditorHandler"><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

  formHandler.validate();

String rootClassName = getStringParameter("rootClass", Content.class.getName(), HttpUtil.CLASSNAME_REGEX);
Class rootClass = channel.getClass(rootClassName);

String title = "";
boolean isContentEditor = false;
boolean isPortletEditor = false;
boolean isFormEditor = false;
boolean isUGCEditor = false;

if (rootClass == PortalElement.class) {
  title = glp("ui.adm.type-list.title.pte");
  request.setAttribute("portletTypeListSubAdminMenu", "true"); 
  request.setAttribute("whSuffix", "p");
  isPortletEditor = true; 
} else if (rootClass == Form.class) {
  title = glp("ui.adm.type-list.title.fte");
  request.setAttribute("formTypeListSubAdminMenu", "true"); 
  request.setAttribute("whSuffix", "f");
  isFormEditor = true;
} else if (rootClass == UserContent.class) {
  title = glp("ui.adm.type-list.title.ute");
  request.setAttribute("ugcTypeListSubAdminMenu", "true"); 
  request.setAttribute("whSuffix", "c");
  isUGCEditor = true;
} else {
  title = glp("ui.adm.type-list.title.cte");
  request.setAttribute("contentTypeListSubAdminMenu", "true"); 
  request.setAttribute("whSuffix", "c");
  isContentEditor = true;
}
boolean isDatabaseSupported = !isPortletEditor;

request.setAttribute("title", title); 
jcmsContext.addCSSHeader("css/jalios/typeEditor.css");

%><%@ include file='/admin/doAdminHeader.jspf' %><%

  // Get the DOM Element associated to this type
  boolean isModified = true;
  TypeProcessor typeProcessor = TypeProcessor.getInstance();
  org.jdom.Document typeDocument = typeProcessor.getNewTypeDocument(false);
  if (typeDocument == null) {
    isModified = false;
    typeDocument = typeProcessor.getTypeDocument();
  }
  org.jdom.Element root = typeDocument.getRootElement();
  boolean isRestartNeeded = (typeProcessor.getTypeChangeLevel() == TypeProcessor.CHANGE_LEVEL_CLASS);
  boolean isApplyNeeded = isModified && !isRestartNeeded;
  List typeList = TypeUtil.getSubEltList(root.getChildren("type"), rootClass);
%>

<div class="page-header"><h1><% /* %>Type Editor<% */ %><%= title %></h1></div>
<%@ include file='/jcore/doMessageBox.jspf' %>

  <div class="row">
    <div class="col-md-9">
    
      <%-- *** TYPE LIST ******************************************* --%>
      <table id='typeTable' class='table-data'>
        <tr> 
          <th class="fit nowrap">&nbsp;</th>
          <th><%= glp("ui.adm.type-list.lbl.name") %></th>
          <th class="fit nowrap"><%= glp("ui.adm.type-list.lbl.extends") %></th>
          <% if (isDatabaseSupported) { %>
          <th class="fit nowrap"><%= glp("ui.adm.type-list.lbl.storage") %></th>
          <% } %>
          <th class="fit nowrap"><%= glp("ui.adm.type-list.lbl.int-name") %></th>
          <th class="fit nowrap"><%= glp("ui.com.lbl.pub-cnt") %></th>
          <th class="fit nowrap">&nbsp;</th>
        </tr>
        <jalios:foreach collection='<%= typeList %>' type='org.jdom.Element' name='itType'>
        <%
          int pos = itCounter.intValue() - 1; 
              boolean isNew = Util.notEmpty(itType.getAttributeValue(TypeConstants.TYPE_NEW_MARK));
              boolean isUpdated = Util.notEmpty(itType.getAttributeValue(TypeConstants.TYPE_UPDATED_MARK));
              String name = itType.getAttributeValue("name");
              String labelProperty = TypeUtil.getTypeLabelProperty(name);
              String label = Util.getString(TypeUtil.getLabel(itType, userLang), glp(labelProperty));
              boolean isAbstract = Util.getString(itType.getAttributeValue("abstract"), "false").equals("true");
              String database = Util.getString(itType.getAttributeValue("database"),"false");
              String superClass = Util.getString(itType.getAttributeValue("superclass"), Content.class.getName());
          
              Class clazz = null;
              long pubCount = 0;
              try {
                clazz = channel.getClass("generated." + name);
                pubCount = channel.getDataCount(clazz);
              } catch(Exception ex) {
                // Nothing
              }
              org.jdom.Element superElt = XmlUtil.searchChild(itType.getParentElement(), "type", "name", Util.getClassShortName(superClass));
              boolean isCustomSuper = superElt == null && !superClass.equals(Content.class.getName());
              String confirmDelete = encodeForJavaScript(glp("msg.js.confirm-delete", label));
        %> 
        <% ; 
        String anchorClass = "";
        if (isNew) { anchorClass = "newType"; } else if (isUpdated) { anchorClass = "updatedType"; }
        %>
        <tr> 
          <td class="text-right" nowrap="nowrap"><%= itCounter %>. <a href="admin/typeEditor.jsp?type=<%= name %>"><jalios:icon src="edit" alt='<%= glp("ui.com.alt.edit") %>' /></a></td>
          <td class="text-left" width='100%' nowrap="nowrap"><span <%= isAbstract ? "style='font-style: italic'" : "" %>><a href="admin/typeEditor.jsp?type=<%= name %>" class="type <%= anchorClass %>"><%= label %></a></span></td>
          <td class="text-left" width='100%' nowrap="nowrap">
            <% if (isCustomSuper) { %>
            <%= Util.getClassShortName(superClass) %>
            <% } else if (superElt != null) { 
              String superLabelProperty = TypeUtil.getTypeLabelProperty(superElt.getAttributeValue("name"));
              String superLabel = Util.getString(TypeUtil.getLabel(superElt, userLang), glp(superLabelProperty));
              %><%= superLabel %><%
              } else { %>
            &nbsp;
            <% } %>
          </td>
          <% if (isDatabaseSupported) { %>
          <td class="text-center" nowrap="nowrap">
            <% if (database.equals("true")) { %>
            <jalios:icon src="db" alt="DB"  title='<%= glp("ui.adm.type-list.lbl.storage.db") %>' />
            <% } else { %>
            <jalios:icon src="store"  alt="JStore" title='<%= glp("ui.adm.type-list.lbl.storage.jstore") %>' />
            <% } %>
          </td>
          <% } %>
          <td class="text-left" nowrap="nowrap"><%= name %></td>
          <td class="text-right" nowrap="nowrap">
          <% if (clazz == null) { %>
          ?
          <% } else if (pubCount == 0) { %>
          0
          <% } else { %>
          <a href="work/queryWork.jsp?types=<%= name %>"><%= pubCount %></a>
          <% } %>
          </td>
          <td class="text-left" nowrap="nowrap">
            <jalios:if predicate='<%= pubCount == 0 && TypeUtil.getSubEltList(itType).isEmpty() && TypeUtil.getLinkedEltList(itType).isEmpty() %>'>
            <a href='admin/typeListEditor.jsp?opDelete=true&amp;name=<%= name %>&amp;rootClass=<%= rootClassName %>' onclick='confirmAction("<%= confirmDelete %>", this.href); return false;'><jalios:icon src="trash-empty" alt='<%= glp("ui.com.alt.remove") %>' /></a>
            </jalios:if>
          </td>
        </tr>
        </jalios:foreach> 
      </table>
      
      <form method="post" action="admin/typeListEditor.jsp" name="editSaveModification">
        <% String confirm = encodeForJavaScript(glp("msg.js.confirm")); %>
        <input type="hidden" name="rootClass" value="<%= rootClassName %>" />
        <input class='btn btn-default <%= isRestartNeeded ? "btn-danger" : "btn-default" %>' type="button" name="opSaveAndRestart" value='<%= glp("ui.adm.type-list.btn.restart") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/typeListEditor.jsp?opSaveAndRestart=true&amp;rootClass=<%= rootClassName %>")' <%= !isRestartNeeded ? "disabled" : "" %>>&nbsp;&nbsp;
        <input class='btn btn-default <%= isApplyNeeded ?"btn-primary" : "btn-default" %>' type="button" name="opSaveAndApply" value='<%= glp("ui.adm.type-list.btn.apply") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/typeListEditor.jsp?opSaveAndApply=true&amp;rootClass=<%= rootClassName %>")' <%= !isApplyNeeded ? "disabled" : "" %>>&nbsp;&nbsp;
        <input class='btn btn-default' type="submit" name="opSave" value='<%= glp("ui.com.btn.save") %>' <%= !isModified ? "disabled" : "" %>>
        <input class='btn btn-default' type="button" name="opRevert" value='<%= glp("ui.adm.type-list.btn.revert") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/typeListEditor.jsp?opRevert=true&amp;rootClass=<%= rootClassName %>")' <%= !isModified ? "disabled" : "" %>>&nbsp;&nbsp;
      </form>
    
    </div>
    <div class="col-md-3">
    
      <%-- *** ADD A NEW TYPE ******************************************* --%>
      <jalios:panel title="ui.adm.type-list.lbl.add">
	      <form method="post" action="admin/typeListEditor.jsp" name="editForm">
	      
	        <jalios:field label="ui.com.lbl.name" name="typeLabels" required="true" >
	            <jalios:control type="<%= ControlType.TEXTFIELD %>" />
	        </jalios:field>
	        
	        <% 
	          String eValue = "";
	          List  eLabels = new ArrayList();
	          List  eValues = new ArrayList();

	          if (!isPortletEditor) { eLabels.add(""); eValues.add(""); }
	          for (Iterator it = typeList.iterator() ; it.hasNext() ; ){
	            org.jdom.Element itType = (org.jdom.Element) it.next();
	            
	            String labelProperty = TypeUtil.getTypeLabelProperty(itType.getAttributeValue("name"));
	            eLabels.add(Util.getString(TypeUtil.getLabel(itType, userLang), glp(labelProperty)));
	            
	            String value = "generated." + itType.getAttributeValue("name");
	            eValues.add(value);
	            if (isPortletEditor && itType.getAttributeValue("name").equals("AbstractPortletSkinable")){
	              eValue = value;
	            }
	          }
            
            if (isContentEditor) {
              eLabels.add(channel.getTypeLabel(FileDocument.class, userLang));
              eLabels.add(channel.getTypeLabel(DBFileDocument.class, userLang));
              eValues.add(FileDocument.class.getName());
              eValues.add(DBFileDocument.class.getName());
            }
	        %>
	        <jalios:field label="ui.adm.type-list.lbl.extends" name="superClass" tooltip="ui.adm.type-list.lbl.extends.h" value="<%= eValue %>">
              <% String htmlAttributes = "onchange=\"document.editForm.copy.settings.selectedIndex=0;\""; %>
              <jalios:control settings='<%= new EnumerateSettings().select().enumValues(eValues).enumLabels(eLabels).htmlAttributes(htmlAttributes) %>' />
	        </jalios:field>
	        
	        
	        <%
	          eLabels = new ArrayList();
	          eValues = new ArrayList();
	          eLabels.add(""); eValues.add("");
	          for (Iterator it = typeList.iterator() ; it.hasNext() ; ){
	            org.jdom.Element itType = (org.jdom.Element) it.next();
	                
	            String labelProperty = TypeUtil.getTypeLabelProperty(itType.getAttributeValue("name"));
	            eLabels.add(Util.getString(TypeUtil.getLabel(itType, userLang), glp(labelProperty)));
	            eValues.add(itType.getAttributeValue("name"));
	          }
	        %>
	        <jalios:field label="ui.adm.type-list.lbl.copy" name="copy" tooltip="ui.adm.type-list.lbl.copy.h" >
              <% String htmlAttributes = "onchange=\"document.editForm.copy.settings.selectedIndex=0;\""; %>
              <jalios:control settings='<%= new EnumerateSettings().select().enumValues(eValues).enumLabels(eLabels).htmlAttributes(htmlAttributes) %>' />
	        </jalios:field>
	        
	        <p class="text-center">
		        <button class='btn btn-primary' type="submit" name="opAdd"  value="true"><%= glp("ui.adm.type-list.btn.add") %></button>
		        <% if (isFormEditor) { %>
		        <input type='hidden' name='formAuthorId' value='<%= channel.getDefaultAdmin().getId() %>'/>
		        <% } else if (isUGCEditor) { %>
		        <input type="hidden" name="ugc" value="true"/>
		        <% } %>
	        </p>
	      </form>
      </jalios:panel>
      
    </div>
  </div>
      
<%@ include file='/admin/doAdminFooter.jspf' %>



