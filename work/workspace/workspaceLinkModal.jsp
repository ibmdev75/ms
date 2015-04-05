<%@page import="com.jalios.jcms.taglib.*"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

   HierarchicalWorkspacesManager hwManager = HierarchicalWorkspacesManager.getInstance();
   String urlWorkAreaUpdate = getValidHttpUrl("urlWorkAreaUpdate");
   
   Workspace ws = getWorkspaceParameter("ws");
   if (hasParameter("opChange") && ws != null) {
     hwManager.saveWSForMember(ws, loggedMember);
     String redirectUrl = urlWorkAreaUpdate != null ? urlWorkAreaUpdate + "ws=" + ws.getId() : null;
     if (getBooleanParameter("modal", true)) {
       request.setAttribute("modal.redirect", redirectUrl);
     } else {
       sendRedirect(redirectUrl);
     }
     %><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
   }   
%>


<jalios:modal title="ui.wrksp-tag.title.changews" 
              url="<%= WorkspaceTag.WORKSPACE_LINK_MODIFIER %>" 
              css="modal-md"
              picture=""
              op="opChange"
              button="ui.wrksp-tag.btn.changews">

    <%
      Set<Workspace> workingWorkspaceSet = Workspace.getAllWorkingWorkspaceSet(loggedMember, jcmsContext);
      Set<Workspace> lastWorkspaceSet = hwManager.getLastUsedWorkspaces(loggedMember);
      boolean showAllWorkingWorkspaces = hwManager.isShowAllWorkingWorkspace(workingWorkspaceSet);
      %>
      
      
     <% if (!showAllWorkingWorkspaces) { %>
     <div class="row" style="margin-bottom: 20px;">
       <jalios:field  name='ws' resource="field-inline">
         <jalios:control type="<%= ControlType.WORKSPACE %>" />
       </jalios:field>
       <input type="hidden" name="urlWorkAreaUpdate" value="<%= encodeForHTMLAttribute(getUntrustedStringParameter("urlWorkAreaUpdate", "")) %>" /> 
     </div>
     <% } %>
     
    <% if (showAllWorkingWorkspaces || Util.notEmpty(lastWorkspaceSet)) { %>    
    <div >
      <jalios:query name="workspaceSet" dataset="<%= showAllWorkingWorkspaces ? workingWorkspaceSet : lastWorkspaceSet %>" comparator='<%= Workspace.getNameComparator(userLang) %>'/> 
      <ol>
        <jalios:foreach name="itWorkspace" type="Workspace" collection="<%= workspaceSet %>" > 
        <li> 
          <a href="work/pubBrowser.jsp?ws=<%= itWorkspace.getId() %>">
            <jalios:icon src='<%= itWorkspace.getIcon() %>'   /> <%= itWorkspace.getTitle(userLang) %>
          </a>
        </li>
        </jalios:foreach>
      </ol>
    </div>
    <% } %>
</jalios:modal>
