<%@ include file='/jcore/doInitPage.jspf' %><%

String redirect = Util.getString(jcmsContext.getAjaxRequestAttribute("redirect"), "work/workspace/wsWorkspaceList.jsp");
Set<Workspace> unsortedWorkspaceSet = (Set<Workspace>)jcmsContext.getAjaxRequestAttribute("workspaceSet");
if (unsortedWorkspaceSet == null) {
  sendRedirect(redirect, request, response);
}
String additionalWSTitle = Util.getString((String) jcmsContext.getAjaxRequestAttribute("additionalWSTitle"), "");

// Workspace filters
// -----------------
String[] availableFilters = new String[]{"all", "ws", "cs", "closed", "model"};
boolean isSomeCS = WorkspaceManager.getCollaborativeSpaceCount() > 0;
String userFilter = getStringEnumParameter("wsFilter", "all", availableFilters);
boolean isFilterTypeWS = isSomeCS && "ws".equals(userFilter);
boolean isFilterTypeCS = isSomeCS && "cs".equals(userFilter);;
boolean isFilterClosed = "closed".equals(userFilter);;
boolean isFilterModel = "model".equals(userFilter);

DataSelector csSelector = new Workspace.CollaborativeSpaceSelector();
DataSelector wsSelector = new ReverseDataSelector(new Workspace.CollaborativeSpaceSelector());
DataSelector closedSelector = new ReverseDataSelector(new Workspace.OpenWorkspaceSelector());
DataSelector modelSelector = new Workspace.ModelWorkspaceSelector();

DataSelector finalSelector = null;
if (isFilterTypeWS) {
  finalSelector = wsSelector;
} else if (isFilterTypeCS) {
  finalSelector = csSelector;
} else if (isFilterClosed) {
  finalSelector = closedSelector;
} else if (isFilterModel) {
  finalSelector = modelSelector;
}
%>
<div class="ajax-refresh-div" id='doWorkspaceList'>
  <a href="work/workspace/doWorkspaceList.jsp" class="ajax-refresh-url" style="display:none;"></a>
  <jalios:pager name='wlPagerHandler' declare='true' action='init' />
  <jalios:query name="workspaceSet" 
                dataset="<%= unsortedWorkspaceSet %>" 
                selector='<%= finalSelector %>'
                comparator='<%= ComparatorManager.getComparator(Workspace.class, wlPagerHandler.getSort(), wlPagerHandler.isReverse()) %>'/> 
  <jalios:pager name='wlPagerHandler' action='compute' size='<%= workspaceSet.size() %>'/>
  <div class="page-header">
  	<h1><jalios:icon src="workspace48"/> <%= glp("ui.adm.wrkspc-list.title") %> <%= additionalWSTitle %> (<%= workspaceSet.size() %>)</h1>
  </div>
  
  <%@ include file='/jcore/doMessageBox.jspf' %>
  
  <%@ include file='/work/workspace/doWorkspaceListNavbar.jspf' %>

  <table id='groupTable' class="table-data table-condensed">
    <thead>
      <tr>
        <th class="fit">
          <% if (isAdmin || checkAccess("admin/work/workspace")) { %>
            <jalios:caddy action='add' workspaceQueryString='<%= "all=true" %>' checkPstatus='false'/>
            <a href='admin/exportCSVWorkspace.jsp' title='<%= glp("ui.com.btn.csv") %>'><jalios:icon src="csv" /></a>
          <% } %>
        </th>
        <th><% /* %>Title<% */ %><%= glp("ui.com.lbl.title") %> <jalios:pager name='wlPagerHandler' action='showSort' sort='name'/></th>
        <th><% /* %>Administrators<% */ %><%= glp("ui.wrkspc-edit.lbl.admin") %></th>
        <th class="fit"><% /* %>Order<% */ %><%= glp("ui.adm.wrkspc-list.lbl.order") %> <jalios:pager name='wlPagerHandler' action='showSort' sort='order'/></th>
        <th class="fit"><% /* %>#Groups<% */ %><%= glp("ui.adm.wrkspc-list.lbl.grp-cnt") %> <jalios:pager name='wlPagerHandler' action='showSort' sort='grpsize'/></th>
        <th class="fit"><% /* %>#Members<% */ %><%= glp("ui.adm.wrkspc-list.lbl.mbr-cnt") %> <jalios:pager name='wlPagerHandler' action='showSort' sort='mbrsize'/></th>
        <th class="fit"><% /* %>Created<% */ %><%= glp("ui.com.lbl.cdate") %> <jalios:pager name='wlPagerHandler' action='showSort' sort='date'/></th>
        <th class="fit"><% /* %>Ext.<% */ %><%= glp("ui.adm.wrkspc-list.lbl.ext") %></th>
        <th class="fit"><% /* %>ID<% */ %><%= glp("ui.com.lbl.id") %> <jalios:pager name='wlPagerHandler' action='showSort' sort='id'/></th>
        <th class="fit">&nbsp;</th>
      </tr>
    </thead>

    <jalios:foreach name="itWorkspace" 
                    type="Workspace"
                    collection="<%= workspaceSet %>"
                    max="<%= wlPagerHandler.getPageSize() %>"
                    skip="<%= wlPagerHandler.getStart() %>"> 
  
      <tr>
        <td class="text-right text-overflow">
          <%= wlPagerHandler.getStart() + itCounter.intValue() %>.
          <jalios:edit data='<%= itWorkspace %>' redirect='<%= redirect %>'/>
        </td>
        <td class="text-overflow">
          <% if (itWorkspace.isClosed()) { %>
            <jalios:icon src="workspace-closed" title='<%= glp("ui.wrkspc-edit.closed-workspace") %>'/>
          <% } else { %>
            <jalios:icon src='<%= itWorkspace.getIcon() %>' alt='W' />
          <% } %>
          <% if (isAdmin || itWorkspace.isAdmin(loggedMember)) { %>
            <a href='work/workspace/adminWorkspace.jsp?ws=<%= itWorkspace.getId() %>'><%= itWorkspace.getTitle(userLang) %></a>
          <% } else { %>
            <%= itWorkspace.getTitle(userLang) %>
          <% } %>
          <jalios:checkIntegrity data='<%= itWorkspace %>' />      
        </td>
        <td class="text-overflow">
          <ul>
            <jalios:foreach collection="<%= itWorkspace.getAdministrators() %>" name="itMember" type="Member" counter="adminCounter">
              <li><%= itMember %></li>
            </jalios:foreach>
          </ul>
        </td>
        <td class="text-right"><%= itWorkspace.getOrder() %></td>
        <td class="text-right">
          <% if (Util.notEmpty(itWorkspace.getGroupSet())) { %>
            <a href="admin/groupList.jsp?wid=<%= itWorkspace.getId() %>"><%= itWorkspace.getGroupSet().size() %></a>
          <% } else { %>
            <%= itWorkspace.getGroupSet().size() %>
          <% } %>
        </td>
        <td class="text-right"><%= itWorkspace.getMemberSet().size() %></td>
        <td class="text-right"><jalios:date date='<%= itWorkspace.getCdate() %>' format='<%= "short" %>'/></td>
        <td class="text-center"><%= itWorkspace.getExtension() != null ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
        <td><%= itWorkspace.getId() %></td>
        <td class="text-overflow">
          <jalios:caddy data='<%= itWorkspace %>'/>
          <% if (Util.isEmpty(itWorkspace.getPubSet())) { %>
            <jalios:delete data='<%= itWorkspace %>' redirect='<%= redirect %>' />
          <% } %>
          <% if ((!itWorkspace.isCollaborativeSpace() && itWorkspace.isModel() && channel.getLimitController().checkWorkspaceLimit(true).isOK()) && (isAdmin || checkAccess("admin/work/workspace"))) { %>
            <a href='work/workspace/workspaceWizard.jsp?id=<%= itWorkspace.getId() %>&redirect=<%= ServletUtil.getUrl(request) %>' title="<%= glp("ui.adm.wrkspc-list.lbl.wizard") %>"><jalios:icon src='wizard' /></a>
          <% } %>
        </td>
      </tr>
    </jalios:foreach>
  </table>
  
  <jalios:pager name='wlPagerHandler'/>
</div> <%-- end of ajax-refresh-div --%>