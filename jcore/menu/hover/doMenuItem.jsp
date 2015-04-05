<%@ include file='/jcore/doInitPage.jspf'%>
<% int depthLevel = Util.toInt(getIncludeObject("depthLevel", null), -1); %>
<% if(depthLevel == 0) { // Root Menu item %>
  <a href="<%= getIncludeString("link", "#") %>" class="btn btn-default"><jalios:icon src='<%= getIncludeString("icon", null) %>' /><%= getIncludeString("label", "") %></a>
<% } else { // Sub menu item %>
  <li class='<%= getIncludeString("css", "") %>'><a href="<%= getIncludeString("link", "#") %>"><jalios:icon src='<%= getIncludeString("icon", null) %>' /><%= getIncludeString("label", "") %></a></li>
<% } %>