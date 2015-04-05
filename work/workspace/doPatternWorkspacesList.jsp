<%@ include file='/jcore/doInitPage.jspf' %>
<%!
  public static DataSelector PATTERN_WORKSPACE_SELECTOR = new Workspace.ModelWorkspaceSelector();
%>
<% 
  Workspace parentWorkspace = (Workspace) request.getAttribute(Workspace.PARENT_WORKSPACE_PARAMNAME);
  String redirect = ServletUtil.getUrl(request); 
%>
<jalios:pager name='wlPagerHandler' declare='true' action='init'/>
<jalios:query name="workspaceSet"
              dataset="<%= channel.getDataSet(Workspace.class) %>"
              selector="<%= PATTERN_WORKSPACE_SELECTOR %>"
              comparator='<%= ComparatorManager.getComparator(Workspace.class, wlPagerHandler.getSort(), wlPagerHandler.isReverse()) %>'/> 
<jalios:pager name='wlPagerHandler' action='compute' size='<%= workspaceSet.size() %>'/>
<div class="page-header"><h1><%= glp("ui.wrkspc-list.patternwslist") %>(<%= workspaceSet.size() %>)</h1></div>
<%@ include file='/jcore/doMessageBox.jspf' %>


<table id='groupTable' class="table-data table-condensed">
  <% String sortImg = (wlPagerHandler.isReverse() ? "sortUp.gif" : "sortDown.gif"); %>
  <tr>
   <th>
      <% if (isAdmin) { %>
      <a href='admin/exportCSVWorkspace.jsp'><jalios:icon src="csv"  title='<%= glp("ui.com.btn.csv") %>' /></a>
      <% } %>
    </th>
   <th width='100%' nowrap="nowrap">
      <% /* %>Title<% */ %><%= glp("ui.com.lbl.title") %>
      <jalios:pager name='wlPagerHandler' action='showSort' sort='name'/>
    </th>
   <th width='100%' nowrap="nowrap">
      <% /* %>Administrators<% */ %><%= glp("ui.wrkspc-edit.lbl.admin") %>
    </th>
   <th nowrap="nowrap">
      <% /* %>Order<% */ %><%= glp("ui.adm.wrkspc-list.lbl.order") %>
      <jalios:pager name='wlPagerHandler' action='showSort' sort='order'/>
    </th>
     <th nowrap="nowrap">
      <% /* %>#Groups<% */ %><%= glp("ui.adm.wrkspc-list.lbl.grp-cnt") %>
      <jalios:pager name='wlPagerHandler' action='showSort' sort='grpsize'/>
    </th>
     <th nowrap="nowrap">
      <% /* %>#Members<% */ %><%= glp("ui.adm.wrkspc-list.lbl.mbr-cnt") %>
      <jalios:pager name='wlPagerHandler' action='showSort' sort='mbrsize'/>
    </th>
   <th nowrap="nowrap">
      <% /* %>Created<% */ %><%= glp("ui.com.lbl.cdate") %>
      <jalios:pager name='wlPagerHandler' action='showSort' sort='date'/>
    </th>
   <th nowrap="nowrap">
      <% /* %>Ext.<% */ %><%= glp("ui.adm.wrkspc-list.lbl.ext") %>
    </th>
   <th nowrap="nowrap">
      <% /* %>ID<% */ %><%= glp("ui.com.lbl.id") %>
      <jalios:pager name='wlPagerHandler' action='showSort' sort='id'/>
    </th>
    <th nowrap="nowrap">&nbsp;</th>
  </tr>

  <jalios:foreach name="itWorkspace" 
                  type="Workspace"
                  collection="<%= workspaceSet %>"
                  max="<%= wlPagerHandler.getPageSize() %>"
                  skip="<%= wlPagerHandler.getStart() %>"> 

  <tr> 

    <td align="right" nowrap="nowrap">
      <%= wlPagerHandler.getStart() + itCounter.intValue() %>.
      <jalios:edit data='<%= itWorkspace %>' redirect='<%= redirect %>'/>
    </td>
    <td nowrap="nowrap">
      <jalios:icon src='<%= itWorkspace.getIcon() %>'  alt='W' />
      <% if (loggedMember.isAdmin(itWorkspace)) { %><a href='work/workspace/adminWorkspace.jsp?ws=<%= itWorkspace.getId() %>'><% }
      %><%= itWorkspace.getTitle(userLang) %><%
      if (loggedMember.isAdmin(itWorkspace)) { %></a><% } %>
      <jalios:checkIntegrity data='<%= itWorkspace %>' />      
      </td>
    <td class='vTop' nowrap="nowrap">
      <ul>
      <jalios:foreach collection="<%= itWorkspace.getAdministrators() %>" name="itMember" type="Member" counter="adminCounter">
      <li><%= itMember %>
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
    <td align='left' nowrap="nowrap">
      <jalios:caddy data='<%= itWorkspace %>'/>
      <jalios:if predicate='<%= Util.isEmpty(itWorkspace.getGroupSet()) && Util.isEmpty(itWorkspace.getPubSet()) %>'>
        <jalios:delete data='<%= itWorkspace %>' redirect='<%= redirect %>' />
      </jalios:if>
      <jalios:if predicate='<%= channel.getLimitController().checkWorkspaceLimit(true).isOK() %>'>
        <a href='work/workspace/workspaceWizard.jsp?id=<%= itWorkspace.getId() %>&<%= Workspace.PARENT_WORKSPACE_PARAMNAME %>=<%= parentWorkspace.getId() %>&redirect=<%= ServletUtil.getUrl(request) %>&administrator=<%= loggedMember.getId() %>' title="<%= glp("ui.adm.wrkspc-list.lbl.wizard") %>"><jalios:icon src='wizard' /></a>
      </jalios:if>
    </td>
  </tr>
</jalios:foreach>
</table>
<jalios:pager name='wlPagerHandler'/><br />