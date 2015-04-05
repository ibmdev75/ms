<%@ include file='/jcore/doInitPage.jspf' %>
<% String id = getIncludeString("id", ServletUtil.generateUniqueDOMId(request, "vertical_submenu")); %>
<% int depthLevel = Util.toInt(getIncludeObject("depthLevel", null), -1); %>
<% int maxDepthLevel = Util.toInt(getIncludeObject("maxDepthLevel", null), -1); %>
<% boolean active = Util.toBoolean(getIncludeString("active", ""), false); %>
<% Category currentCategory = (Category) request.getAttribute(PortalManager.PORTAL_CURRENTCATEGORY); %>
<% boolean isCurrentActive = currentCategory != null && id.equals(currentCategory.getId()); %>
<% String css = getIncludeString("css", ""); %>
<% if(maxDepthLevel < 0 || depthLevel < maxDepthLevel) { %>
  <a href="#<%= id %>" class='list-group-item list-group-item-submenu<%= isCurrentActive ? " active" : (active ? " dropup" : "") %><%= (Util.notEmpty(css) ? " " + css : "") %>' data-toggle="collapse" data-parent='#<%= depthLevel == 0 ? getIncludeString("parentId", "") : id %>'>
    <jalios:icon src='<%= getIncludeString("icon", null) %>' /><%= getIncludeString("label", "") %> <jalios:icon src='<%= active ? "accordion-collapse" : "accordion-expand" %>' />
  </a>
  <div id="<%= id %>" class='collapse submenu list-group-submenu<%= active && !isCurrentActive ? " in" : "" %>'>
    <a href="<%= getIncludeString("link", "#") %>" class="list-group-item title"><jalios:icon src='<%= getIncludeString("icon", null) %>' /><%= getIncludeString("label", "") %></a>
    <%= getIncludeBody() %>
  </div>
<% } %>