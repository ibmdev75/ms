<%--
  @Summary: Group editor
  @Category: Admin / Data
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-4.1.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/work/workspace")) {
    sendForbidden(request, response);
    return;
  }

  request.setAttribute("title", glp("ui.adm.wrkspc-list.title")); 
  request.setAttribute("workspaceSubAdminMenu", "true");
  request.setAttribute("boHeaderCSS","sticky-display");
  
%><%@ include file='/admin/doAdminHeader.jspf' %> <%
  String redirect = ServletUtil.getUrl(request);

  boolean   guiShowTree       = channel.getBooleanProperty("hierarchical-ws.workworkspacelist.guishowtree", false);
  Workspace selectedWorkspace = getWorkspaceParameter(Workspace.PARENT_WORKSPACE_PARAMNAME);
  Set hlWs = null;
  if (selectedWorkspace != null){
    hlWs = Util.getHashSet(selectedWorkspace);
  }
%>

<% boolean showTree = getBooleanParameter("showTree", guiShowTree); %>
<table class="layout spliter">
  <tr>
    <%-- *** TREE ******************************************* --%>
    <% if (showTree) { %>
    <td class="sidebar">
      <jalios:treeview prefix="treews"
              collection="<%= Workspace.getRootWorkspaces(Workspace.getOrderComparator(userLang), loggedMember) %>" 
              opened="<%= hlWs %>"
              highlighted="<%= hlWs %>"
              link='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[]{ "showTree", Workspace.PARENT_WORKSPACE_PARAMNAME } , new String[]{ "true", "_NODE_ID_" }) %>' />
    </td>
    <% } %>
    <%-- *** VERTICAL SEPARATOR ******************************************* --%>
    <td class="split">
      <% if (showTree) { %>
      <a href='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"showTree"}, new String[] {"false"}) %>'><jalios:icon src='chevron-left'  /></a>
      <% } else { %>
      <a href='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"showTree"}, new String[] {"true"}) %>'><jalios:icon src='chevron-right'  /></a>
      <% } %>
    </td>
    <td>
    <div class="AdminArea WorkArea">    

<%
  if (Util.isEmpty(selectedWorkspace)) {
    Set workspaceSet = Workspace.getAllWorkspaceSet(loggedMember);
    jcmsContext.setAjaxRequestAttribute("workspaceSet", workspaceSet);
  } else { // else if selectedWorkspace is not empty
    boolean allSubWS = getBooleanParameter("allSubWS", false);
    if ( allSubWS ) {
      jcmsContext.setAjaxRequestAttribute("workspaceSet", selectedWorkspace.getAllSubWorkspaces());
      jcmsContext.setAjaxRequestAttribute("additionalWSTitle",   " : " + glp("ui.wrkspc-list.allsubworkspaces", selectedWorkspace.getTitle(userLang)) );
    } else {
      jcmsContext.setAjaxRequestAttribute("workspaceSet", selectedWorkspace.getSubWorkspaces());
      jcmsContext.setAjaxRequestAttribute("additionalWSTitle",   " : " + glp("ui.wrkspc-list.subworkspaces", selectedWorkspace.getTitle(userLang)) );
    }
%>
    <form action="<%= ServletUtil.getUrl(request)%>" method="get">
      <input type="hidden" name="allSubWS" value="<%= "" + !allSubWS %>" />
      <input type="hidden" name="<%= Workspace.PARENT_WORKSPACE_PARAMNAME %>" value="<%= selectedWorkspace.getId() %>" />
      <% String subWSFilter = glp("ui.wrkspc-list." + ( allSubWS ? "subworkspaces" : "allsubworkspaces"), selectedWorkspace.getTitle(userLang)); %>
      <input class='btn btn-default'  type="submit" value="<%= subWSFilter %>" />
    </form>
<%
  } // end else selectedWorkspace is not empty
  jcmsContext.setAjaxRequestAttribute("redirect", redirect);
%>
  <jalios:include jsp="/work/workspace/doWorkspaceList.jsp" />

    </div>
    </td>
   </tr>
</table>
<%@ include file='/admin/doAdminFooter.jspf' %>

