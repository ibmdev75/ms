<%@include file='/jcore/doInitPage.jspf' %>
<% { %>
<% 
Group group = getGroupParameter("gid");
if (group == null) {
  group = (Group) request.getAttribute("group");
}
Group obj = group; // for doWorkspaceExtensionFullDisplay.jsp

if (group == null) {
  return;
}

if (!group.canBeReadBy(loggedMember)) {
  sendForbidden(request, response);
  return;
}

%>

<div class="fulldisplay Group"> 
  <h1 class='title'>
    <%= group.getIcon(userLang,true) %>
    <%= group.getName(userLang) %>
    <jalios:edit data='<%= group %>' />
  </h1>

  <% if (Util.notEmpty(group.getDescription())) { %> 
  <div class="description">
    <jalios:wiki><%= group.getDescription() %></jalios:wiki>
  </div>
  <% } %> 
  
 <table class="table-data">
  
  <%-- Workspace ---------------------------------------------------------------- --%> 
  <jalios:if predicate="<%= Util.notEmpty(group.getWorkspace()) %>">
  <tr class="workspace"> 
    <th>
      <% /* %>Workspace<% */ %><%= glp("ui.com.lbl.workspace") %>
    </th>
    <td> 
      <%= group.getWorkspace() %>
    </td>
  </tr>
  </jalios:if>
  
  <%-- Authentication Duration ---------------------------------------------------------------- --%> 
  <tr class="authenticationDuration">
    <th><%= glp("ui.adm.grp-list.lbl.max-age") %></th>
    <td>
        <% if (group.getCookieMaxAge() == 0) { %>
          <% /* %>Default Value<% */ %><%= glp("ui.adm.grp-edit.lbl.max-age.def") %> (<jalios:duration time='<%= 1000L * channel.getIntegerProperty("cookie.max-age", JcmsConstants.COOKIE_MAX_AGE) %>'/>)
        <% } else { %>
          <jalios:duration time='<%= 1000L * group.getCookieMaxAge() %>'/>
        <% } %>
    </td>
  </tr>

  <%-- EXTENSION ------------------------------------------------------- --%> 
  <%@ include file='/types/GroupExtension/doGroupExtensionFullDisplay.jspf' %>

 </table> 
</div>
<% } %>
