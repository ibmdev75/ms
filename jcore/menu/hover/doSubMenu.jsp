<%@ include file='/jcore/doInitPage.jspf' %>
<% int depthLevel = Util.toInt(getIncludeObject("depthLevel", null), -1); %>
<% if(depthLevel == 0) { // Root Sub Menu %>
  <div class='btn-group <%= getIncludeString("css", "") %>'>
    <a href="<%= getIncludeString("link", "#") %>" class="btn btn-default"><jalios:icon src='<%= getIncludeString("icon", null) %>' /><%= getIncludeString("label", "") %></a>
    <button type="button" class="btn btn-default dropdown-toggle main-menu-item" data-toggle="dropdown"><jalios:icon src="caret" /></button>
    <ul class="dropdown-menu dropdown">
      <%= getIncludeBody() %>
    </ul>
  </div>
<% } else { // Sub Menu %>
  <li class='dropdown-submenu <%= getIncludeString("css", "") %>'>
    <a href="<%= getIncludeString("link", "#") %>"><jalios:icon src='<%= getIncludeString("icon", null) %>' /><%= getIncludeString("label", "") %></a>
    <ul class="dropdown-menu sub-menu"><%= getIncludeBody() %></ul>
  </li>
<% } %>