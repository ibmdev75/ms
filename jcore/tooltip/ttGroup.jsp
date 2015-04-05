<%@ include file="/jcore/doInitPage.jspf" %><%
  Group group = getGroupParameter("ttId");
  if (group == null){
    return;
  }
  
  if (!group.canBeReadBy(loggedMember)) {
    return;
  }
  
%><div class='tt-card tt-group'>
  <div class='popover-body tt-card-body'>
    <div class='tt-card-title name'><%= group.getName(userLang) %></div>
    
    <div class='tt-card-abstract description'>
     <% if (Util.notEmpty(group.getDescription())) { %>
      <div class="tt-card-abstract-text">
      <jalios:wiki><%= group.getDescription() %></jalios:wiki>
      </div>
     <% } %>
    </div>
    
    <div class="tt-card-meta">
      <div class="workspace">
      <% if (group.getWorkspace() != null) { %>
      <jalios:link data='<%= group.getWorkspace() %>'/>
      <% } else { %>
      <%= glp("ui.com.lbl.global-group") %>
      <% } %>
      </div>
    </div>
    
    
    <jalios:include target="GROUP_TOOLTIP_CONTENT" targetContext="bloc" />
    </div>
  <jalios:buffer name="groupToolipFooter">
    <jalios:include target="GROUP_TOOLTIP_FOOTER" targetContext="inline" />
  </jalios:buffer>
  <% if (Util.notEmpty(groupToolipFooter)) { %>
  <div class='popover-footer tt-btn  focus'>
  <%= groupToolipFooter %>
  </div>
  <% } %>
</div>