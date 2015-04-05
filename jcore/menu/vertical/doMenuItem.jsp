<%@ include file='/jcore/doInitPage.jspf'%>
<% boolean active = Util.toBoolean(getIncludeString("active", ""), false); %>
<% String css = getIncludeString("css", ""); %>
<a href="<%= getIncludeString("link", "#") %>" class='list-group-item menuitem<%= active ? " active" : "" %><%= (Util.notEmpty(css) ? " " + css : "") %>' data-parent='#<%= getIncludeString("parentId", "") %>'>
  <jalios:icon src='<%= getIncludeString("icon", null) %>' /><%= getIncludeString("label", "") %>
</a>
