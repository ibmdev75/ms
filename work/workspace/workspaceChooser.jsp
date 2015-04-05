<%@ include file='/jcore/doInitPage.jspf' %><%
  if (loggedMember == null) {
    sendForbidden(request, response);
    return;
  }
  String targetInput  = getChooserParameter("targetInput");
  String targetLabel  = getChooserParameter("targetLabel");
  
  request.setAttribute("title",glp("ui.com.alt.wkspc-chooser"));
  request.setAttribute("zone","InternalUI");
%>
<jalios:buffer name='customHeader'>
	<script>
	function insertLink(id, label) {
	  <% if (Util.notEmpty(targetInput)){ %>
	  opener.<%= targetInput %> = id;
	  opener.<%= targetLabel %> = label;
	  <% } else { %>
	  Popup.callback(id, label);
	  <% } %>
	  close();
	}
	</script>
</jalios:buffer>
<% jcmsContext.addCustomHeader(customHeader); %>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<%
  String redirect = ServletUtil.getUrl(request);

  boolean   guiShowTree       = channel.getBooleanProperty("hierarchical-ws.workworkspacechooser.guishowtree", false);
  Workspace mbrWorkspace      = null;
  Workspace selectedWorkspace = getWorkspaceParameter(Workspace.PARENT_WORKSPACE_PARAMNAME);
%>
<% boolean showTree = getBooleanParameter("showTree", guiShowTree); %>
<div id='mainDiv' style='border-bottom: 1px solid #000000;'>

<table class='layout'>
  <tr>
    <%-- *** TREE ******************************************* --%>
    <% if (showTree) { %>
    <td style="vertical-align: top; width: 25%; padding: 0px; background-color: #EEEEE0;">
      <% TreeHelper.printWorkspacesTree(mbrWorkspace, false, "gid", out, userLang, jcmsContext, loggedMember); %>
      </td>
    <% } %>
    <%-- *** VERTICAL SEPARATOR ******************************************* --%>
    <td style="vertical-align: top; text-align: center; width: 8px; background-color: #DDDDD0; border: 1px solid black; border-width: 0 1px;">
      <% if (showTree) { %>
      <a href='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"showTree"}, new String[] {"false"}) %>'><jalios:icon src='arrowbk' /></a>
      <% } else { %>
      <a href='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"showTree"}, new String[] {"true"}) %>'><jalios:icon src='arrow' /></a>
      <% } %>
      <br />
      <jalios:icon src='s.gif' />
    </td>
    <td class='vTop'>

<%
  if (Util.isEmpty(selectedWorkspace)) {
    Set workspaceSet = Workspace.getAllWorkspaceSet(loggedMember);
    jcmsContext.setAjaxRequestAttribute("workspaceSet", workspaceSet);
  } else { // else if selectedWorkspace is not empty
    boolean allSubWS = getBooleanParameter("allSubWS", false);
    if ( allSubWS ) {
    jcmsContext.setAjaxRequestAttribute("workspaceSet", selectedWorkspace.getAllSubWorkspaces(loggedMember));
    jcmsContext.setAjaxRequestAttribute("additionalWSTitle", " : Tous les espaces en dessous de " + selectedWorkspace.getTitle(userLang));
      } else {
    jcmsContext.setAjaxRequestAttribute("workspaceSet", selectedWorkspace.getSubWorkspaces(loggedMember));
    jcmsContext.setAjaxRequestAttribute("additionalWSTitle", " : Espaces juste en dessous de " + selectedWorkspace.getTitle(userLang));
    }
%>
    <form action="<%= ServletUtil.getUrl(request)%>" method="get">
      <input type="hidden" name="allSubWS" value="<%= "" + !allSubWS %>" />
      <input type="hidden" name="<%= Workspace.PARENT_WORKSPACE_PARAMNAME %>" value="<%= selectedWorkspace.getId() %>" />
      <input class='btn btn-default'  type="submit" value='<%= !allSubWS ? "Tous les sous-espaces" : "Uniquement les sous-espaces directs" %>' />
    </form>
<%
  } // end else selectedWorkspace is not empty
%>
  <jsp:include flush="true" page="/work/workspace/doWorkspaceChooser.jsp" />

  </td>
  </tr>
</table>
  </div>
  <jalios:javascript>
    Popup.autoResize("mainDiv");
  </jalios:javascript>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
