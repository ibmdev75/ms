<%--
  @Summary: Type Field List
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
TreeSet usedCatSet = new TreeSet(); 
boolean areDbFieldsAvailable = Util.notEmpty(DBUtil.getDataSourceMap());
String rootClassName = formHandler.getRootClassName();

jcmsContext.addJavaScript("js/typeEditor.js");
%>
  
   
<div class="tab-page">
  <h2 class="tab"><%= glp("ui.adm.type-edit.fld.tab") %></h2>
  
  <div class="row">
  
    <%-- FIELD LIST --%>
    <div class="col-md-9">
      <%@ include file='/admin/typeEditor/doTypeFields_list.jspf' %>

      <form method="post" action="admin/typeListEditor.jsp" name="editSaveModification">
        <% String confirm = encodeForJavaScript(glp("msg.js.confirm")); %>
  
        <input type='hidden' name="rootClass" value="<%= rootClassName %>" />
  
        <input class='btn <%= formHandler.isRestartNeeded() ?"btn-danger" : "btn-default" %>' type="button" name="opSaveAndRestart" value='<%= glp("ui.adm.type-list.btn.restart") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/typeListEditor.jsp?opSaveAndRestart=true&amp;rootClass=<%= rootClassName %>")' <%= !formHandler.isRestartNeeded() ? "disabled='disabled'" : "" %>/>&nbsp;&nbsp;
        <input class='btn <%= formHandler.isApplyNeeded() ?"btn-primary" : "btn-default" %>' type="button" name="opSaveAndApply" value='<%= glp("ui.adm.type-list.btn.apply") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/typeListEditor.jsp?opSaveAndApply=true&amp;rootClass=<%= rootClassName %>")' <%= !formHandler.isApplyNeeded() ? "disabled='disabled'" : "" %>/>&nbsp;&nbsp;
        <input class='btn btn-default' type="submit" name="opSave" value='<%= glp("ui.com.btn.save") %>' <%= !formHandler.isModified() ? "disabled='disabled'" : "" %>/>
        <input class='btn btn-default' type="button" name="opRevert" value='<%= glp("ui.adm.type-list.btn.revert") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/typeListEditor.jsp?opRevert=true&amp;rootClass=<%= rootClassName %>")' <%= !formHandler.isModified() ? "disabled=disabled" : "" %>/>&nbsp;&nbsp;
        <input class='btn btn-default' type="button" name="opRevert" value='<%= glp("ui.adm.type-list.btn.force-update") %>' onclick='confirmAction("<%= confirm %>", "<%= contextPath %>/admin/typeListEditor.jsp?opForceUpdate=true&amp;name=<%= formHandler.getTypeName() %>&amp;rootClass=<%= rootClassName %>")' />&nbsp;&nbsp;
      </form>
    </div>
    
    <%-- ADD FIELD --%>
    <div class="col-md-3">
      <%@ include file='/admin/typeEditor/doTypeFields_add.jspf' %>
    </div>
  </div>
</div>
