<%@page import="com.jalios.jcms.HttpUtil"%>
<%@ include file="/docs/jcms/common/doInitSection.jspf" %>
<% Workspace ws7 = HttpUtil.getWorkspaceParameter(request, "workspace7"); %>
<% String ws7Description = ws7 != null ? "<span class='label label-info'>Selected Workspace: " + ws7.getTitle() + "</span>" : null; %>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="docs/jcms/form_section_chooser_ajaxrefresh.jsp">
  <jalios:field name="workspace7" label="Workspace select with change event" value="<%= ws7 %>" description="<%= ws7Description %>">
    <jalios:control settings='<%= new WorkspaceSettings().select().enumValues(channel.getDefaultWorkspace()).onChange("ajax-refresh") %>' />
  </jalios:field>
</div>
<% Workspace ws8 = HttpUtil.getWorkspaceParameter(request, "workspace8"); %>
<% String ws8Description = ws8 != null ? "<span class='label label-info'>Selected Workspace: " + ws8.getTitle() + "</span>" : null; %>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="docs/jcms/form_section_chooser_ajaxrefresh.jsp">
  <jalios:field name="workspace8" label="Workspace with change event" value="<%= ws8 %>" description="<%= ws8Description %>">
    <jalios:control settings='<%= new WorkspaceSettings().enumValues(channel.getDefaultWorkspace()).onChange("ajax-refresh") %>' />
  </jalios:field>
</div>