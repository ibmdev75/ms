<%--
  @Summary: Category editor
  @Category: Work Area / Categories
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-4.1
--%><%@ include file='/jcore/doInitPage.jspf' %><% 

if (workspace == null || !(workspace.isAdmin(loggedMember) || checkAccess("admin-ws/"))) { 
  sendForbidden(request, response);
  return;
}

request.setAttribute("title", /* Workspace Administration */glp("ui.work.mn.map")); 
request.setAttribute("adminWAMenu", "true");
request.setAttribute("allowWkspFilter", "false");

%><%@ include file='/work/doWorkHeader.jspf' %><%
%><%@ include file='/jcore/doMessageBox.jspf' %>

<div class="row">
  <div class="col-md-9">
    
    <div class="page-header">
      <h1><jalios:icon src="workspace48"/> <%= glp("ui.work.mn.map") %></h1>
    </div>
    
    <div id="adminFunc" class="row">
      <div class="col-md-6">
        
      <% if (checkAccess("admin-ws/users/")) { %>
      <jalios:panel title="ui.adm.mn.users" css="panel-default" id="users">
        <div class="panel-msg"><%= glp("ui.work.mn.users.info") %></div>
        <div class="list-group sticky-sides sticky-bottom">
          <% if (checkAccess("admin-ws/users/workspace")) { %>
            <a class="list-group-item" href="work/workspace/wsWorkspaceList.jsp"><jalios:icon src='<%= Workspace.WORKSPACE_ICON %>' /> <%= glp("ui.adm.mn.work.ws") %></a>
          <% } %>
          <% if (checkAccess("admin-ws/users/member")) { %>
            <a class="list-group-item" href="work/workspace/workspaceMemberList.jsp"><jalios:icon src='mbr-default' /> <%= glp("ui.com.lbl.members") %></a>
            <% if (workspace.hasDBMember()) { %>
            <a class="list-group-item" href="work/workspace/workspaceDBMemberList.jsp"><jalios:icon src='dbmbr-default' /> <%= glp("ui.com.lbl.dbmembers") %></a>
            <% } %>
          <% } %>
          <% if (checkAccess("admin-ws/users/group")) { %>
            <a class="list-group-item" href="work/workspace/workspaceGroupList.jsp"><jalios:icon src='group' /> <%= glp("ui.com.lbl.groups") %></a>
          <% } %>
          <% if (checkAccess("admin-ws/users/acl-audit")) { %>
            <a class="list-group-item" href="work/workAccessAudit.jsp"><jalios:icon src='key' /> <%= glp("accesscontrol.audit") %></a>
          <% } %>
          <% if (checkAccess("admin-ws/users/role")) { %>
            <a class="list-group-item" href="work/workspace/editWorkspaceRole.jsp"><jalios:icon src='role' /> <%= glp("ui.com.lbl.roles") %></a>
          <% } %>
          <a class="list-group-item modal" href="jcore/alert/sendAlert.jsp?refineWorkspace=<%= workspace.getId() %>"><jalios:icon src="email-error" /> <%= glp("alert.send-alert.lbl.title") %></a>
          <jalios:include target="WORKADMIN_USERS" targetContext="li" />
        </div>
      </jalios:panel>
      <% } %>
             
      <% if (checkAccess("admin-ws/reporting/")) { %>
      <jalios:panel title="ui.adm.mn.reporting" css="panel-default">
        <div class="panel-msg"><%= glp("ui.work.mn.reporting.info") %></div> 
        <div class="list-group sticky-sides sticky-bottom">
          <% if (checkAccess("admin-ws/reporting/analytics") && !workspace.isModel()) { %>
            <a class="list-group-item" href='admin/analytics/report/indexWorkspace.jsp'><jalios:icon src="analytics"  /> <%= glp("ui.adm.mn.files.analytics-report") %></a>
          <% } %>
          <% if (checkAccess("admin-ws/reporting/data-report")) { %>
            <a class="list-group-item" href="work/wsDataReport.jsp"><jalios:icon src='list'  /> <%= glp("ui.adm.mn.reporting.data") %></a>
          <% } %>
          <% if (checkAccess("admin-ws/reporting/friendly-urls")) { %>
            <a class="list-group-item" href="work/friendlyURLsWS.jsp"><jalios:icon src='www'  /> <%= glp("ui.com.lbl.friendly-urls") %></a>
          <% } %>
          <jalios:include target="WORKADMIN_REPORTING" targetContext="li" />
        </div>
      </jalios:panel>
      <% } %>
             
      </div>
      <div class="col-md-6">
            
      <% if (checkAccess("admin-ws/conf/")) { %>
      <jalios:panel title="ui.adm.mn.conf" css="panel-default">
        <div class="panel-msg"><%= glp("ui.work.mn.conf.info") %></div>
        <div class="list-group sticky-sides sticky-bottom">
          <% if (checkAccess("admin-ws/conf/ws")) { %>
            <a class="list-group-item" href="work/workspace/editWorkspaceType.jsp"><jalios:icon src='form'  /> <%= glp("ui.work.mn.types") %></a>
            <a class="list-group-item" href="work/workspace/editWorkspaceCommon.jsp"><jalios:icon src='properties'  /> <%= glp("ui.adm.mn.conf.prop") %></a>
          <% } %>
          <jalios:include target="WORKADMIN_CONFIGURATION" targetContext="li" />
        </div>
      </jalios:panel>
      <% } %>

      </div>
    </div>
    
  </div>
  <div class="col-md-3">
    
    <jalios:panel title="ui.adm.mn.docs" css="panel-info">
      <div class="list-group sticky">
        <a class="list-group-item" href='http://community.jalios.com/' target="_blank"><jalios:icon src='world-link'  /> Jalios Community</a>
        <a class="list-group-item" href='http://community.jalios.com/howto/administrator/' target="_blank"><jalios:icon src='world-link'  /> <%= glp("ui.adm.mn.docs.jx.admin") %></a>
        <jalios:include target="WORKADMIN_DOCUMENTATION" targetContext="li" />
      </div>
    </jalios:panel>

  </div>
</div>

<%@ include file='/work/doWorkFooter.jspf' %>
