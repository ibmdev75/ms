<%--
  @Summary: Tyep Editor
  @Category: Admin / Types
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-3.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.handler.TypeEditorHandler" %><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.TypeEditorHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

if (formHandler.validate()) {
  return;
}
request.setAttribute("formHandler", formHandler);
String title = "";

if (formHandler.isPortletEditor()) {
  title = glp("ui.adm.type-edit.title.pte", formHandler.getTypeLabel());
  request.setAttribute("portletTypeListSubAdminMenu", "true"); 
  request.setAttribute("whSuffix", "p");
} else if (formHandler.isFormEditor()) {
  title = glp("ui.adm.type-edit.title.fte", formHandler.getTypeLabel());
  request.setAttribute("formTypeListSubAdminMenu", "true"); 
  request.setAttribute("whSuffix", "f");
} else if (formHandler.isUGCEditor()) {
  title = glp("ui.adm.type-edit.title.ute", formHandler.getTypeLabel());
  request.setAttribute("ugcTypeListSubAdminMenu", "true"); 
  request.setAttribute("whSuffix", "c");
} else {
  title = glp("ui.adm.type-edit.title.cte", formHandler.getTypeLabel());
  request.setAttribute("contentTypeListSubAdminMenu", "true"); 
  request.setAttribute("whSuffix", "c");
}

request.setAttribute("title", title); 

jcmsContext.addJavaScript("js/typeEditor.js");
jcmsContext.addCSSHeader("css/jalios/typeEditor.css");


%><%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header"><h1><% /* %>Edition of Type<% */ %><%= title %></h1></div>
<%@ include file='/jcore/doMessageBox.jspf' %>

<div class="tab-pane" id="mainTab">

  <%-- *** FIELDS SUMMARY ******************************************* --%>
  <jsp:include page='/admin/typeEditor/doTypeFields.jsp' />

  <%-- *** TYPE PROPERTIES ************************************** --%>
  <jsp:include page='/admin/typeEditor/doTypeProperties.jsp' />

  <%-- *** TEMPLATES ************************************** --%>
  <% if (!formHandler.isDatabase()) { %>
  <jsp:include page='/admin/typeEditor/doTypeTemplates.jsp' />
  <% } %>

  <%-- *** Tabs ************************************** --%>
  <jsp:include page='/admin/typeEditor/doTypeTabs.jsp' />

  <%-- *** FIELD EDITOR ************************************** --%>
  <% if (formHandler.showFieldEditorTab()) { %>
  <jsp:include page='/admin/typeEditor/doTypeFieldEditor.jsp' />
  <% } %>

</div>

<jalios:javascript>
setSelectedTab("mainTab", <%= formHandler.getOpenTab() %>);
<%-- setupAllTabs(); --%>
</jalios:javascript>

<%@ include file='/admin/doAdminFooter.jspf' %> 
