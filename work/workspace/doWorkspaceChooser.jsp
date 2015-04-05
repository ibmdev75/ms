<%@ include file='/jcore/doInitPage.jspf' %>
<%
  String redirect = ServletUtil.getUrl(request);
  Set unsortedWorkspaceSet = (Set)jcmsContext.getAjaxRequestAttribute("workspaceSet");
  String additionalWSTitle = Util.getString((String) jcmsContext.getAjaxRequestAttribute("additionalWSTitle"), "");
%>
<div class="ajax-refresh-div" id='doWorkspaceChooser' style="margin: 10px;">
  
  <jalios:query name="workspaceSet" dataset="<%= unsortedWorkspaceSet %>" comparator='<%= Workspace.getNameComparator(userLang) %>'/> 
  <div class="page-header"><h1><% /* %>Workspaces<% */ %><%= glp("ui.com.lbl.workspaces") %> <%= additionalWSTitle %> (<%= workspaceSet.size() %>)</h1></div>
  <%@ include file='/jcore/doMessageBox.jspf' %>
  <jalios:pager name='wcPagerHandler' declare='true' action='init' size='<%= workspaceSet.size() %>'
                resourcePath='work/workspace/doWorkspaceChooser.jsp'
                />
  <table id='pubTable' class="table-data table-condensed">
    <tr> 
      <th>&nbsp;</th>
      <th>&nbsp;</th>
     <th width='100%'>
        <% /* %>Name<% */ %><%= glp("ui.com.lbl.name") %>
      </th>
    </tr>
    <jalios:foreach name="itWorkspace" type="Workspace" collection="<%= workspaceSet %>"
                    max="<%= wcPagerHandler.getPageSize() %>"
                    skip="<%= wcPagerHandler.getStart() %>"> 
    <tr> 
      <% String label = HttpUtil.encodeForJavaScript(itWorkspace.getTitle(userLang)); %>
      <td class='text-right'><input type="radio" onclick="javascript:insertLink('<%= itWorkspace.getId() %>', '<%= label %>')" /></td>
      <td class="text-right"><%= wcPagerHandler.getStart() + itCounter.intValue() %>.</td>
      <td><jalios:icon src='<%= itWorkspace.getIcon() %>'   /> <%= itWorkspace.getTitle(userLang) %></td>
    </tr>
  </jalios:foreach>
  </table>
  <jalios:pager name='wcPagerHandler'/>
</div>