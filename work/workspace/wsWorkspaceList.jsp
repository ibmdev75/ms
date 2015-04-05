<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin-ws/users/workspace")) {
    sendForbidden(request, response);
    return;
  }

	request.setAttribute("title", glp("ui.adm.wrkspc-list.title")); 
	request.setAttribute("adminWAMenu", "true");
	request.setAttribute("allowWkspFilter", "false");
	request.setAttribute("boHeaderCSS","sticky-display");

%><%@ include file='/work/doWorkHeader.jspf' %><%

  String redirect = ServletUtil.getUrl(request);

  boolean guiShowTree      = false;
  Workspace mbrWorkspace     = null;
  Workspace selectedWorkspace = getWorkspaceParameter(Workspace.PARENT_WORKSPACE_PARAMNAME);
  selectedWorkspace = Util.notEmpty(selectedWorkspace) ? selectedWorkspace : workspace;
  boolean showPatternWS = "show".equals(getStringEnumParameter("showPatternWS", "hide", new String[] {"hide", "show"}));

  boolean showTree = getBooleanParameter("showTree", guiShowTree); 
%>
<table class='layout spliter'>
  <tr>
    <%-- *** TREE ******************************************* --%>
    <% if (showTree) { %>
    <td class="sidebar">
      <% TreeHelper.printWorkspacesTree(mbrWorkspace, false, "gid", out, userLang, jcmsContext, loggedMember); %>
      </td>
    <% } %>
    <%-- *** VERTICAL SEPARATOR ******************************************* --%>
    <td class="split">
      <% if (showTree) { %>
      <a href='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"showTree"}, new String[] {"false"}) %>'><jalios:icon src='chevron-left' /></a>
      <% } else { %>
      <a href='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"showTree"}, new String[] {"true"}) %>'><jalios:icon src='chevron-right' /></a>
      <% } %>
    </td>
    <td class='vTop'>
    <div class="AdminArea WorkArea">    

<%
  if (Util.isEmpty(selectedWorkspace)) {
    Set workspaceSet = Workspace.getAllWorkspaceSet(loggedMember);
    request.setAttribute("workspaceSet", workspaceSet);
  } else { // else if selectedWorkspace is not empty
    boolean allSubWS = getBooleanParameter("allSubWS", false);
    if ( allSubWS ) {
      jcmsContext.setAjaxRequestAttribute("workspaceSet", selectedWorkspace.getAllSubWorkspaces(loggedMember));
      jcmsContext.setAjaxRequestAttribute("additionalWSTitle",   " : " + glp("ui.wrkspc-list.allsubworkspaces", selectedWorkspace.getTitle(userLang)) );
    } else {
      jcmsContext.setAjaxRequestAttribute("workspaceSet", selectedWorkspace.getSubWorkspaces(loggedMember));
      jcmsContext.setAjaxRequestAttribute("additionalWSTitle",   " : " + glp("ui.wrkspc-list.subworkspaces", selectedWorkspace.getTitle(userLang)) );
    }
%>
    <form action="<%= ServletUtil.getUrl(request)%>" method="get" class="br">
      <input type="hidden" name="allSubWS" value="<%= "" + !allSubWS %>" />
      <input type="hidden" name="showTree" value="<%= "" + showTree %>" />
      <input type="hidden" name="<%= Workspace.PARENT_WORKSPACE_PARAMNAME %>" value="<%= selectedWorkspace.getId() %>" />
      <% String subWSFilter = glp("ui.wrkspc-list." + ( allSubWS ? "subworkspaces" : "allsubworkspaces"), selectedWorkspace.getTitle(userLang)); %>
      <input class='btn btn-default'  type="submit" value="<%= subWSFilter %>" />
    </form>
<%
  } // end else selectedWorkspace is not empty
  jcmsContext.setAjaxRequestAttribute("redirect", redirect);
%>
  <jsp:include flush="true" page="/work/workspace/doWorkspaceList.jsp" />

<form action="<%= ServletUtil.getUrl(request)%>" method="get">
  <input type="hidden" name="showPatternWS" value="<%= showPatternWS ? "hide" : "show" %>" />
    <input type="hidden" name="<%= Workspace.PARENT_WORKSPACE_PARAMNAME %>" value="<%= selectedWorkspace.getId() %>" />
    <input type="hidden" name="showTree" value="<%= "" + showTree %>" />
    <input class='btn btn-default'  type="submit" value='<%= glp("ui.wrkspc-list.showpatternws." + !showPatternWS) %>' />
</form>
<% if (showPatternWS) {  
  request.setAttribute(Workspace.PARENT_WORKSPACE_PARAMNAME, selectedWorkspace);
%>
  <jalios:include jsp="/work/workspace/doPatternWorkspacesList.jsp" />
<%
  request.removeAttribute(Workspace.PARENT_WORKSPACE_PARAMNAME);
   } // End if showPatternWS %>
    </div>
    </td>
   </tr>
</table>
<%@ include file='/work/doWorkFooter.jspf' %>

