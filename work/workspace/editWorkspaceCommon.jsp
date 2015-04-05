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

if (!checkAccess("admin-ws/conf/ws")) {
  sendForbidden(request, response);
  return;
}

%><jsp:useBean id="extFormHandler" scope="page" class="generated.EditWorkspaceExtensionHandler"><%
  %><jsp:setProperty name="extFormHandler" property="request"     value="<%= request %>"/><%
  %><jsp:setProperty name="extFormHandler" property="response"    value="<%= response %>"/><%
  %><jsp:setProperty name="extFormHandler" property="id"          value="<%= workspace.getId() %>"/><%
  %><jsp:setProperty name="extFormHandler" property="*" /><%
%></jsp:useBean><%

%><jsp:useBean id="commonFormHandler" scope="page" class="com.jalios.jcms.workspace.EditWorkspaceCommonHandler"><%
  %><jsp:setProperty name="commonFormHandler" property="request"        value="<%= request %>"/><%
  %><jsp:setProperty name="commonFormHandler" property="response"       value="<%= response %>"/><%
  %><jsp:setProperty name="commonFormHandler" property="id"             value="<%= workspace.getId() %>"/><%
  %><jsp:setProperty name="commonFormHandler" property="extFormHandler" value="<%= extFormHandler %>"/><%
  %><jsp:setProperty name="commonFormHandler" property="*" /><%
%></jsp:useBean><%

AbstractEditWorkspaceHandler formHandler = (AbstractEditWorkspaceHandler) commonFormHandler;
if (formHandler.validate()) {
  return;
}

String title = formHandler.getWorkspace() == null ? glp("ui.wrkspc-edit.title-add") : glp("ui.wrkspc-edit.title-updt", formHandler.getWorkspace().getTitle(userLang), glp("ui.wrkspc-edit.common"));
Workspace workspc = formHandler.getWorkspace();

request.setAttribute("title", title);
request.setAttribute("adminCommonMenu", "true");

%><%@ include file='/work/doWorkHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>

<div class="page-header"><h1><% /* %>Workspace Editor<% */ %><%= title %></h1></div>

<form action="<%= contextPath %>/work/workspace/editWorkspaceCommon.jsp" method="post" name="editForm" class="form-horizontal">

  <div class='tab-single-pane'>
    <jalios:include target="EDIT_WS_MAINTAB_HEADER" />

    <%-- GENERAL ------------------------------------------------------- --%>
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

    <jalios:include target="EDIT_WS_TYPETAB_FOOTER" />
  </div>

  <%-- BUTTONS -------------------------------------------------------------------- --%>
  <p>
    <input type='hidden' name='redirect' value='<%= contextPath %>/work/workspace/adminWorkspace.jsp' />
    <button class='btn btn-primary' type='submit' name='opUpdate' value="true"><%= glp("ui.com.btn.save") %></button>
    <button class='btn btn-default' type='submit' name='opCancel' value="true"><%= glp("ui.com.btn.cancel") %></button>
  </p>

  <input type='hidden' name='action' value='true' />
  <input type='hidden' name='loaded' value='false' />
  <input type='hidden' name="anchor" />
  <input type='hidden' name="opItem" />
  <input type='hidden' name="itemPos" />
</form>

<% if (formHandler.isTabForced()) { %>
  <jalios:javascript>
    setSelectedTab("editWorkspace-tab", <%= formHandler.getOpenTab() %>);
  </jalios:javascript>
<% } %>

<p><%= glp("ui.com.txt.required") %></p>
<%@ include file='/work/doWorkFooter.jspf' %>