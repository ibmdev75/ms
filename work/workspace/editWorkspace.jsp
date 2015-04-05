<%--
  @Summary: Workspace editor
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

if (!(isAdmin || checkAccess("admin/work/workspace"))) {
  String queryString = ServletUtil.getQueryString(request, false);
  String target  = "work/workspace/editWorkspaceCommon.jsp?" + queryString;
  sendRedirect(target, request, response);
  return;
}
%><jsp:useBean id="extFormHandler" scope="page" class="generated.EditWorkspaceExtensionHandler"><%
  %><jsp:setProperty name="extFormHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="extFormHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="extFormHandler" property="*" /><%
%></jsp:useBean><%

%><jsp:useBean id="commonFormHandler" scope="page" class="com.jalios.jcms.workspace.EditWorkspaceCommonHandler"><%
  %><jsp:setProperty name="commonFormHandler" property="request"        value="<%= request %>"/><%
  %><jsp:setProperty name="commonFormHandler" property="response"       value="<%= response %>"/><%
  %><jsp:setProperty name="commonFormHandler" property="*" /><%
%></jsp:useBean><%

%><jsp:useBean id="typeFormHandler" scope="page" class="com.jalios.jcms.workspace.EditWorkspaceTypeHandler"><%
  %><jsp:setProperty name="typeFormHandler" property="request"        value="<%= request %>"/><%
  %><jsp:setProperty name="typeFormHandler" property="response"       value="<%= response %>"/><%
  %><jsp:setProperty name="typeFormHandler" property="*" /><%
%></jsp:useBean><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.workspace.EditWorkspaceHandler"><%
  %><jsp:setProperty name="formHandler" property="request"           value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response"          value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="extFormHandler"       value="<%= extFormHandler %>"/><%
  %><jsp:setProperty name="formHandler" property="commonFormHandler" value="<%= commonFormHandler %>"/><%
  %><jsp:setProperty name="formHandler" property="typeFormHandler"   value="<%= typeFormHandler %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

if (formHandler.validate()) {
  return;
}

String title = formHandler.getWorkspace() == null ? glp("ui.wrkspc-edit.title-add") : glp("ui.wrkspc-edit.title-update", formHandler.getWorkspace().getTitle());
Workspace workspc = formHandler.getWorkspace();

request.setAttribute("title", title);
request.setAttribute("workspaceSubAdminMenu", "true"); 

%><%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header"><h1><% /* %>Workspace Editor<% */ %><%= title %></h1></div>
<%@ include file='/jcore/doMessageBox.jspf' %>

<form action="<%= contextPath %>/work/workspace/editWorkspace.jsp" method="post" name="editForm" class='form-horizontal'>

  <div class="tab-pane" id="editWorkspace-tab">
  
  <%-- *** GENERAL ******************************************* --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>General<% */ %><%= glp("ui.com.tab.general") %></h2>
    <jalios:include target="EDIT_WS_MAINTAB_HEADER" />
    <%@ include file='/work/workspace/doEditWorkspaceCommon.jspf' %>
    <%-- ID ------------------------------------------------------------ --%> 
    <% if (workspc != null) { %>
      <input name="id" type="hidden" value="<%= workspc.getId() %>" />
      <dl class="dl-horizontal">
      <dt><%= glp("ui.com.lbl.id") %></dt><dd><%= workspc.getId() %></dd>
      <dt><%= glp("ui.com.lbl.cdate") %></dt><dd><jalios:time date='<%= workspc.getCdate() %>' format='short' /> <jalios:date date='<%= workspc.getCdate() %>' format='short' /></dd>
      <dt><%= glp("ui.com.lbl.mdate") %></dt><dd><jalios:time date='<%= workspc.getMdate() %>' format='short' /> <jalios:date date='<%= workspc.getMdate() %>' format='short' /></dd>
      </dl>
    <% } %>
    <jalios:include target="EDIT_WS_MAINTAB_FOOTER" />
  </div>
  
  <div class="tab-page">
    <h2 class="tab"><% /* %>Types<% */ %><%= glp("ui.wrkspc-edit.types") %></h2>
    <jalios:include target="EDIT_WS_TYPETAB_HEADER" />
  
    <%@ include file='/work/workspace/doEditWorkspaceType.jspf' %>
    <jalios:include target="EDIT_WS_TYPETAB_FOOTER" />
  </div>
  
  <jalios:include target="EDIT_WORKSPACE" targetContext="tab-page" />
  </div>

  <%-- BUTTONS -------------------------------------------------------------------- --%> 
  <p> 
    <input type='hidden' name='redirect' value='<%= formHandler.getRedirect() %>' />
    <% if (workspc == null) { %> 
      <input class='btn btn-primary' type='submit' name='opCreate' value='<%= glp("ui.com.btn.save") %>' />
      <input class='btn btn-default' type='submit' name='opCancel' value='<%= glp("ui.com.btn.cancel") %>' />
    <% } else { %> 
      <input class='btn btn-primary' type='submit' name='opUpdate' value='<%= glp("ui.com.btn.save") %>' />
      <input class='btn btn-default' type='submit' name='opCancel' value='<%= glp("ui.com.btn.cancel") %>' />
      <% String confirmDelete = encodeForHTMLAttribute(glp("msg.js.confirm-delete", workspc.getTitle())); %>
      <input class='btn btn-default modal confirm' type='submit' name='opDelete' value='<%= glp("ui.com.btn.delete") %>' title='<%= confirmDelete %>' />
      <input type="checkbox" name="forceDelete" value="true" id='forceDelete' />
      <label class='formMandatory' for='forceDelete'><% /* %>Delete Groups and Unlink Members<% */ %><%= glp("ui.wrkspc-edit.lbl.force-del") %></label>
    <% } %> 
  </p>

  <input type='hidden' name='action' value='true' />
  <input type='hidden' name='loaded' value='false' />
  <input type='hidden' name="anchor" />
  <input type='hidden' name="opItem" />
  <input type='hidden' name="itemPos" />
</form>

<p><%= glp("ui.com.txt.required") %></p>
<jalios:javascript>
	setSelectedTab($('editWorkspace-tab'), <%= HttpUtil.getIntParameter(request, "openTab", 0) %>);
</jalios:javascript>
<%@ include file='/admin/doAdminFooter.jspf' %>