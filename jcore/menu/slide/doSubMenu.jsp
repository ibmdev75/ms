<%@ include file='/jcore/doInitPage.jspf' %>
<% String id = getIncludeString("id", null); %>
<% int depthLevel = Util.toInt(getIncludeObject("depthLevel", null), -1); %>
<% int maxDepthLevel = Util.toInt(getIncludeObject("maxDepthLevel", null), -1); %>
<% boolean active = Util.toBoolean(getIncludeString("active", ""), false); %>
<% String css = getIncludeString("css", ""); %>
<% if(depthLevel == 0) { // Root Sub Menu %>
  <div class='jalios-menu-container btn-group<%= (Util.notEmpty(css) ? " " + css : "") %>'>
    <button type="button" class='btn btn-default dropdown-toggle main-menu-item<%= (Util.notEmpty(id) ? " menuitem-" + id : "")%><%= active ? " active" : "" %>' data-toggle="dropdown">
      <jalios:icon src='<%= getIncludeString("icon", null) %>' />
      <%= getIncludeString("label", "") %>
      <% if(maxDepthLevel != 0) { %><jalios:icon src="caret" /><% } %>
    </button>
    <% if(maxDepthLevel != 0) { %>
      <div id="<%= "jalios-menu-" + UUID.randomUUID().toString() %>" class="menu-slide closed invisible">
        <div class="multilevelpushmenu">
          <div class='title<%= (Util.notEmpty(id) ? " menu-title-" + id : "") %>'>
            <a href="<%= getIncludeString("link", "#") %>">
              <jalios:icon src='<%= getIncludeString("icon", null) %>' />
              <%= getIncludeString("label", "") %>
            </a>
          </div>
          <ul class='submenu<%= (Util.notEmpty(id) ? " submenu-" + id : "") %>'>
            <%= getIncludeBody() %>
          </ul>
        </div>
      </div>
    <% } %>
  </div>
<% } else { // Sub Menu %>
  <li class='menuitem<%= (Util.notEmpty(id) ? " menuitem-" + id : "") %><%= active ? " active" : "" %><%= (Util.notEmpty(css) ? " " + css : "") %>'>
    <a href='<%= getIncludeString("link", "#") %>'>
      <jalios:icon src='<%= getIncludeString("icon", null) %>' />
      <%= getIncludeString("label", "") %>
    </a>
    <% if(maxDepthLevel < 0 || depthLevel < maxDepthLevel) { %>
      <div class='title<%= (Util.notEmpty(id) ? " menu-title-" + id : "") %>'>
        <a href="<%= getIncludeString("link", "#") %>">
          <jalios:icon src='<%= getIncludeString("icon", null) %>' />
          <%= getIncludeString("label", "") %>
        </a>
      </div>
      <ul class='submenu<%= (Util.notEmpty(id) ? " submenu-" + id : "") %>'><%= getIncludeBody() %></ul>
    <% } %>
  </li>
<% } %>