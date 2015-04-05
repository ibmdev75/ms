<%--
  @Summary: Workspace duplication wizard
  @Category: Admin / Data
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-4.1.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.workspace.WorkspaceWizardHandler">
  <jsp:setProperty name="formHandler" property="request"        value="<%= request %>"/>
  <jsp:setProperty name="formHandler" property="response"       value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<%

if (formHandler.validate()) {
 return;
}

request.setAttribute("title", glp("ui.adm.wrkspc-list.lbl.wizard")); 
request.setAttribute("workspaceSubAdminMenu", "true");

%><%@ include file='/work/doWorkHeader.jspf' %><%

%><%@ include file='doWorkspaceWizard.jspf' %><%

%><%@ include file='/work/doWorkFooter.jspf' %>

