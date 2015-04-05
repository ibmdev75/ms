<%--
  @Summary: ACL editor
  @Since: jcms-7.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.accesscontrol.*" %><%

if (JcmsUtil.checkDataWriteDisabled(request, response, "admin/doAdminMsg.jsp", userLang)) {
  return;
}

/* ACL Edit require TRUE ADMIN ACCESS */ 
if (!isAdmin || !channel.isValidAdminIP(request)) {
  sendForbidden(request, response);
  return;
}

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.EditAclHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    return;
  }

  String title = formHandler.getAccessControlList() == null ? glp("acl.acl-edit.title-add") : glp("acl.acl-edit.title-update", encodeForHTML(formHandler.getAccessControlList().getName()));
  AccessControlList acl = formHandler.getAccessControlList();
  
  request.setAttribute("title", title);  
  request.setAttribute("aclManagerSubAdminMenu", "true");
  request.setAttribute("formHandler", formHandler);  
  
  jcmsContext.addCSSHeader("css/jalios/acl.css");
  
%><%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header">
  <h1>
    <% /* %>ACL Editor<% */ %><%= title %>
    <jalios:include target="EDIT_ACL_HEADER" />
  </h1>
</div>

<%@ include file='/jcore/doMessageBox.jspf' %>

<form action="admin/editAcl.jsp" method="post" name="editForm" class="form-horizontal">
  <jalios:include target="EDIT_ACL_FORMHEADER" />
  
<div class='tab-single-pane' id="editAcl-tab">
  
	<%-- NAME ------------------------------------------------------- --%> 
  <jalios:field name='name' label='ui.com.lbl.name' required='<%= true %>' value='<%= formHandler.getAvailableName() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>

	<%-- WORKSPACE ACL ------------------------------------------------------- --%> 
	<jalios:field name="workspaceACL" label="acl.acl-edit.lbl.ws-acl" tooltip="acl.acl-edit.lbl.ws-acl.h">
    <div class="input-group jalios-input-group">
      <label for="workspaceACLyes" class="radio-inline control-boolean">
      <input name="workspaceACL" id="workspaceACLyes" type="radio" value="true" <%= formHandler.getAvailableWorkspaceACL() ? "checked=\"true\"" : "" %>
             data-jalios-action="toggle:disabled toggle:hide" data-jalios-target=".wsRsrc INPUT.rsrc,.nonWsRsrc INPUT.rsrc | .wsRsrc, .nonWsRsrc" /> 
      <%= glp("ui.com.lbl.yes") %>
    </label>
    &nbsp;
    <label for="workspaceACLno" class="radio-inline control-boolean">
      <input name="workspaceACL" id="workspaceACLno" type="radio" value="false" <%= formHandler.getAvailableWorkspaceACL() ? "" : "checked=\"true\"" %>
             data-jalios-action="toggle:disabled toggle:hide" data-jalios-target=".wsRsrc INPUT.rsrc,.nonWsRsrc INPUT.rsrc | .wsRsrc, .nonWsRsrc" /> 
      <%= glp("ui.com.lbl.no") %>
    </label>
    </div>
	</jalios:field>
    
<%-- RESOURCES -------------------------------------------------- --%> 
 <div class="col-md-12">
  <table class="table-data acls">
   <thead>
    <tr>
     <th><%= glp("acl.acl-edit.lbl.resource") %></th>
     <th style="width: 300px;"><%= glp("acl.acl-edit.lbl.auth") %></th>
    </tr>
   </thead>
   <tbody>
  <%
     for (Map.Entry<String,Integer> entry : AccessControlUtil.getOrderedResourcesAndLevelMap().entrySet()) {
       String resource = entry.getKey();
       int level = entry.getValue();
       Boolean aclResourceAuthorization = formHandler.getAvailableExplicitAccessAuthorization(resource);
       boolean resourceAuthorized = aclResourceAuthorization != null && aclResourceAuthorization.booleanValue();
       String aclInputIdPrefix = Util.buildID(resource); 
       boolean isWSAdminResource = AccessControlUtil.isWorkspaceAdminResource(resource);
       boolean isAdminResource = AccessControlUtil.isAdminResource(resource);
       boolean isHidden = (formHandler.getAvailableWorkspaceACL() && !isWSAdminResource) || (!formHandler.getAvailableWorkspaceACL() && isWSAdminResource);
       boolean isDisabled = isHidden;
       String resourceLabelProp = "acl.resource." + resource;
       String resourceLabelHelpProp = "acl.resource." + resource + ".h";
       boolean hasHelp = !resourceLabelHelpProp.equals(glp(resourceLabelHelpProp)); 
   %>
       <tr class="acl level<%= level %> <%= resourceAuthorized ? "authorized" : "" %> <%= isWSAdminResource ? "wsRsrc" : "nonWsRsrc" %>  <%= isAdminResource ? "adminRsrc" : "nonAdminRsrc" %> <%= isHidden ? "hide" : "" %>" >
        <td class="formLabel"><%= glp(resourceLabelProp) %> <% if (hasHelp) { %><jalios:tooltip property='<%= resourceLabelHelpProp %>' /><% } %></td>
        <td class="formInput">
         <input type="hidden" name="aclResources" value="<%= resource %>"/>
       
         <%-- Allow input --%>
         <input id="<%= aclInputIdPrefix %>-allow" type="radio" class="rsrc<% if (isDisabled) { %> disabled<% } %>" name="acl.<%= resource %>" value="true" <% if (aclResourceAuthorization != null && aclResourceAuthorization.booleanValue()) { %> checked="checked"<% } %> <% if (isDisabled) { %>disabled="disabled"<% } %> data-jalios-action="toggle:authorized" data-jalios-target="TR" data-jalios-target-position="closest" />
         <label for="<%= aclInputIdPrefix %>-allow"><%= glp("acl.allow") %></label>
         
         &nbsp;&nbsp;&nbsp;&nbsp;
         
         <%-- Default input --%>
         <input id="<%= aclInputIdPrefix %>-inherit" type="radio" class="rsrc<% if (isDisabled) { %> disabled<% } %>" name="acl.<%= resource %>" value="" <% if (aclResourceAuthorization == null) { %> checked="checked"<% } %> <% if (isDisabled) { %>disabled="disabled"<% } %> data-jalios-action="toggle:authorized" data-jalios-target="TR" data-jalios-target-position="closest" />
         <label for="<%= aclInputIdPrefix %>-inherit"><%= glp("acl.default") %></label>
         
        </td>
       </tr>      
  <% } %>
    </tbody>
  </table>
  </div>
  
</div>

<%-- BUTTONS -------------------------------------------------------------------- --%> 
<p> 
  <input type='hidden' name='redirect' value='<%= formHandler.getRedirect() %>' />
  <% if (acl == null) { %> 
  <input class='btn btn-primary' type='submit' name='opCreate' value='<%= glp("ui.com.btn.save") %>' />
  <input class='btn btn-default' type='submit' name='opCancel' value='<%= glp("ui.com.btn.cancel") %>' />
  <% } else { %> 
  <input class='btn btn-primary' type='submit' name='opUpdate' value='<%= glp("ui.com.btn.save") %>' />
  <input name="id" type="hidden" value="<%= acl.getId()%>" />
  <input class='btn btn-default' type='submit' name='opCancel' value='<%= glp("ui.com.btn.cancel") %>' />
  <% String confirmDelete = encodeForJavaScript(glp("msg.js.confirm-delete", acl.getName())); %>
  <input class='btn btn-default' type='button' name='opDelete' value='<%= glp("ui.com.btn.delete") %>' onclick='confirmAction("<%= confirmDelete %>", "<%= contextPath %>/admin/editAcl.jsp?opDelete=true&amp;id=<%= acl.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(formHandler.getRedirect()) %>")' />
  <% } %> 
</p>

<input type='hidden' name='action' value='true' />
<input type='hidden' name='loaded' value='false' />
<jalios:include target="EDIT_ACL_FORMFOOTER" />

</form>

<p>
  <%= glp("ui.com.txt.required") %>
</p>

<jalios:include target="EDIT_ACL_FOOTER" />
<%@ include file='/work/doWorkFooter.jspf' %>
