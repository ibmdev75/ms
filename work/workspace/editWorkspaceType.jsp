<%--
  @Summary: Group editor
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
%><jsp:useBean id="typeFormHandler" scope="page" class="com.jalios.jcms.workspace.EditWorkspaceTypeHandler"><%
  %><jsp:setProperty name="typeFormHandler" property="request"        value="<%= request %>"/><%
  %><jsp:setProperty name="typeFormHandler" property="response"       value="<%= response %>"/><%
  %><jsp:setProperty name="typeFormHandler" property="id"             value="<%= workspace.getId() %>"/><%
  %><jsp:setProperty name="typeFormHandler" property="*" /><%
%></jsp:useBean><%

  AbstractEditWorkspaceHandler formHandler = (AbstractEditWorkspaceHandler) typeFormHandler;
  if (formHandler.validate()) {
    return;
  }
    
  String title = formHandler.getWorkspace() == null ? glp("ui.wrkspc-edit.title-add") : glp("ui.wrkspc-edit.title-updt", formHandler.getWorkspace().getTitle(userLang), glp("ui.wrkspc-edit.types"));
  Workspace workspc = formHandler.getWorkspace();

  request.setAttribute("title", title); 
  request.setAttribute("adminTypesMenu", "true");
  
%><%@ include file='/work/doWorkHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>
<div class="page-header">
	<h1><%= title %></h1>
</div>
<% int formElementCount  = 0; %>
<form action="<%= contextPath %>/work/workspace/editWorkspaceType.jsp" method="post" name="editForm">


  <%-- *** GENERAL ******************************************* --%>
	  <%@ include file='/work/workspace/doEditWorkspaceType.jspf' %>
      <%-- ID ------------------------------------------------------------ --%> 
      <jalios:if predicate='<%= workspc != null %>'>
          <input name="id" type="hidden" value="<%= workspc.getId() %>" /><% formElementCount++; %>
      </jalios:if>

<%-- BUTTONS -------------------------------------------------------------------- --%> 
<p> 
  <input type='hidden' name='redirect' value='<%= contextPath %>/work/workspace/adminWorkspace.jsp' />
  <input class='btn btn-primary' type='submit' name='opUpdate' value='<%= glp("ui.com.btn.save") %>' />
  <input class='btn btn-default' type='submit' name='opCancel' value='<%= glp("ui.com.btn.cancel") %>' />
</p>
<input type='hidden' name='action' value='true' />
<input type='hidden' name='loaded' value='false' />
<input type='hidden' name="anchor" />
<input type='hidden' name="opItem" />
<input type='hidden' name="itemPos" />
<input type='hidden' name='alertThreshold' value='<%= ""+formHandler.getAvailableAlertThreshold() %>' /> 
<input type='hidden' name='quotaValue' value='<%= ""+formHandler.getAvailableQuotaValue() %>' /> 
<input type='hidden' name='quotaUnit' value='<%= ""+formHandler.getAvailableQuotaUnit()%>' /> 
<input type='hidden' name='useDefaultQuota' value='<%= ""+formHandler.getAvailableUseDefaultQuota()%>' /> 



</form>
<jalios:if predicate='<%= formHandler.isTabForced() %>'>
 <jalios:javascript>
   setSelectedTab("editWorkspace-tab", <%= formHandler.getOpenTab() %>);
 </jalios:javascript>
</jalios:if>

<p><%= glp("ui.com.txt.required") %></p>
<%@ include file='/work/doWorkFooter.jspf' %>
