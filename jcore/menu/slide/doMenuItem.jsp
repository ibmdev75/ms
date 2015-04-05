<%@ include file='/jcore/doInitPage.jspf'%>
<% String id = getIncludeString("id", null); %>
<% int depthLevel = Util.toInt(getIncludeObject("depthLevel", null), -1); %>
<% boolean active = Util.toBoolean(getIncludeString("active", ""), false); %>
<% String css = getIncludeString("css", ""); %>
<% if(depthLevel == 0) { // Root Menu item %>
  <a href="<%= getIncludeString("link", "#") %>" class='btn btn-default menuitem<%= (Util.notEmpty(id) ? " menuitem-" + id : "") %><%= active ? " active" : "" %>'>
    <jalios:icon src='<%= getIncludeString("icon", null) %>' />
    <%= getIncludeString("label", "") %>
  </a>
<% } else { // Sub menu item %>
  <li class='menuitem<%= (Util.notEmpty(id) ? " menuitem-" + id : "") %><%= active ? " active" : "" %><%= (Util.notEmpty(css) ? " " + css : "") %>'>
    <a href="<%= getIncludeString("link", "#") %>">
      <jalios:icon src='<%= getIncludeString("icon", null) %>' />
      <%= getIncludeString("label", "") %>
    </a>
  </li>
<% } %>