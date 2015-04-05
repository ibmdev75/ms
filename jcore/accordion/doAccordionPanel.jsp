<%@ include file="/jcore/doInitPage.jspf" %>
<div class="jalios-accordion-panel panel <%= getIncludeString("css", "panel-default") %>" >
  <%
  String parentId = getIncludeString("parent-id", "");
  String panelId = getIncludeString("id", ServletUtil.generateUniqueDOMId(request, parentId));
  boolean active = Util.toBoolean(getIncludeString("active", "false"), false);
  %>
  <% if (Util.notEmpty(getIncludeString("title", null))) { %>
    <div class="panel-heading" data-toggle="collapse" data-parent="#<%= parentId %>" data-target="#<%= panelId %>">
      <div class='panel-actions collapse-action<%= active ? " dropup" : "" %>'><jalios:icon src='<%= active ? "accordion-collapse" : "accordion-expand" %>' /></div>
      <div class="panel-title">
        <a href="#<%= panelId %>" onclick="return false;">
          <jalios:icon src='<%= getIncludeString("picture", null) %>' />
          <%= glp(getIncludeString("title", "")) %>
        </a>
      </div>
    </div>
  <% } else if (Util.notEmpty(getIncludeString("PANEL_HEADING", null))) { %>
    <div class="panel-heading" data-toggle="collapse" data-parent="#<%= parentId %>" data-target="#<%= panelId %>"><%= getIncludeString("PANEL_HEADING", "") %></div>
  <% } else if (Util.notEmpty(PanelTag.getIncludeObject(request, "PANEL_HEADING_TAG", null))) { %>
    <%= PanelTag.getIncludeObject(request, "PANEL_HEADING_TAG", "") %>
  <% } %>
  
  <div id="<%= panelId %>" class='panel-collapse collapse <%= active ? "in" : "" %>'>
	<% if (Util.notEmpty(PanelTag.getIncludeObject(request, "PANEL_BODY_TAG", null))) { %>
      <%= PanelTag.getIncludeObject(request, "PANEL_BODY_TAG", "") %>
    <% } else { %>
      <div class="panel-body responsive"><%= getIncludeBody() %></div>
    <% } %>
    
    <% if (Util.notEmpty(getIncludeString("PANEL_BODY_EXTENSION", null))) { %>
      <%= getIncludeString("PANEL_BODY_EXTENSION", "") %>
    <% } %>

    <% if (Util.notEmpty(getIncludeString("PANEL_FOOTER", null))) { %>
      <div class="panel-footer"><%= getIncludeString("PANEL_FOOTER", "") %></div>
    <% } else if (Util.notEmpty(PanelTag.getIncludeObject(request, "PANEL_FOOTER_TAG", null))) { %>
      <%= PanelTag.getIncludeObject(request, "PANEL_FOOTER_TAG", "") %>
    <% } %>
  </div>
</div>