<%@ include file='/jcore/doInitPage.jspf' %>
<%
String css = getIncludeString("css", null);
css = Util.notEmpty(css) ? " " + css : "";

String style = getIncludeString("style", null);
style = Util.notEmpty(style) ? " style=\"" + style + "\"" : "";
%>
<div class="panel-heading<%= css %>"<%= style %>>
  <% if (Util.notEmpty(getIncludeString("title", null))) { %>
    <div class="panel-actions"><%= getIncludeString("PANEL_HEADING_BTN", "") %></div>
    <div class="panel-title">
      <jalios:icon src='<%= getIncludeString("picture", null) %>' />
      <%= glp(getIncludeString("title", "")) %>
    </div>
  <% } else { %>
    <%= getIncludeBody() %>
  <% } %>
</div>