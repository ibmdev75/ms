<%@ include file='/jcore/doInitPage.jspf' %>
<%
String id = getIncludeString("id", null);
id = Util.notEmpty(id) ? " id=\"" + id + "\"" : "";

String css = getIncludeString("css", "panel-default");
css = Util.notEmpty(css) ? " " + css : "";

String style = getIncludeString("style", null);
style = Util.notEmpty(style) ? " style=\"" + style + "\"" : "";
%>
<div<%= id %> class="panel<%= css %>"<%= style %>>

  <% if (Util.notEmpty(getIncludeString("title", null))) { %>
    <div class="panel-heading">
      <div class="panel-actions"><%= getIncludeString("PANEL_HEADING_BTN", "") %></div>
      <div class="panel-title">
        <jalios:icon src='<%= getIncludeString("picture", null) %>' />
        <%= glp(getIncludeString("title", "")) %>
      </div>
    </div>
  <% } else if (Util.notEmpty(getIncludeString("PANEL_HEADING", null))) { %>
    <div class="panel-heading"><%= getIncludeString("PANEL_HEADING", "") %></div>
  <% } else if (Util.notEmpty(PanelTag.getIncludeObject(request, "PANEL_HEADING_TAG", null))) { %>
    <%= PanelTag.getIncludeObject(request, "PANEL_HEADING_TAG", "") %>
  <% } %>
  
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