<%@ include file='/jcore/doInitPage.jspf' %>
<%
String parentId = getIncludeString("parent-id", "");
String panelId = getIncludeString("id", ServletUtil.generateUniqueDOMId(request, parentId));
boolean active = Util.toBoolean(getIncludeString("active", "false"), false);
String css = getIncludeString("css", null);
css = Util.notEmpty(css) ? " " + css : "";

String style = getIncludeString("style", null);
style = Util.notEmpty(style) ? " style=\"" + style + "\"" : "";
%>
<div class="panel-heading" data-toggle="collapse" data-parent="#<%= parentId %>" data-target="#<%= panelId %>">
  <% if (Util.notEmpty(getIncludeString("title", null))) { %>
    <div class='panel-actions collapse-action<%= active ? " dropup" : "" %>'><jalios:icon src='<%= active ? "accordion-collapse" : "accordion-expand" %>' /></div>
    <div class="panel-title">
      <a href="#<%= panelId %>" onclick="return false;">
        <jalios:icon src='<%= getIncludeString("picture", null) %>' />
        <%= glp(getIncludeString("title", "")) %>
      </a>
    </div>
  <% } else { %>
    <%= getIncludeBody() %>
  <% } %>
</div>