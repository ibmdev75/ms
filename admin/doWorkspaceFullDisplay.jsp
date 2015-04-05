<%@include file='/jcore/doInitPage.jspf' %>
<% { %>
<% 
Workspace ws = getWorkspaceParameter("wsid");
if (ws == null) {
  ws = (Workspace) request.getAttribute("ws");    
}
Workspace obj = ws; // for doWorkspaceExtensionFullDisplay.jsp

if (ws == null) {
  return;
}

if (!isLogged || !loggedMember.belongsToWorkspace(ws)) {
  sendForbidden(request, response);
  return;
}

%>

<div class="fullDisplay Workspace"> 
<p class='title'>
  <jalios:icon src='<%= ws.getIcon() %>'  alt='W' />
  <%= ws.getTitle(userLang) %>
  <jalios:edit data='<%= ws %>' />
</p>

<table class="fieldList">

  <%-- Administrators ------------------------------------------------------------ --%> 
  <tr class="field administrators memberEditor"> 
    <td class="label">
      <% /* %>Administrators<% */ %><%= glp("ui.wrkspc-edit.lbl.admin") %>
    </td>
    <td class='data'> 
        <ol>
          <jalios:foreach counter="itMbrCounter" name="itMbr" type="Member" collection="<%= ws.getAdministrators() %>">
            <jalios:if predicate='<%= itMbr != null %>'>
              <li>
              <%= itMbr.getLangSalutation(userLang) %> <%= itMbr.getFullName() %> 
              </li>
            </jalios:if>
          </jalios:foreach>
        </ol>
    </td>
  </tr>
  
  <%-- Categories ------------------------------------------------------------ --%> 
  <tr class="field categories categoryEditor"> 
    <td class="label">
      <% /* %>Categories<% */ %><%= glp("ui.com.lbl.categories") %>
    </td>
    <td class='data'> 
        <ol>
          <jalios:foreach counter="itCatCounter" name="itCat" type="Category" collection="<%= ws.getCatSet() %>">
            <jalios:if predicate='<%= itCat != null %>'>
              <li>
                <%= itCat.getAncestorString(" > ", false, userLang) %> > <b><%= itCat.getName(userLang) %> </b>
              </li>
            </jalios:if>
          </jalios:foreach>
        </ol>
    </td>
  </tr>

  <%-- EXTENSION ------------------------------------------------------- --%> 
  <%@ include file='/types/WorkspaceExtension/doWorkspaceExtensionFullDisplay.jspf' %>

</table> 
</div>
<% } %>
