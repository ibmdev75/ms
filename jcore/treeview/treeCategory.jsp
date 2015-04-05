<%@ include file="/jcore/doInitPage.jspf" %><%@page import="com.jalios.jcms.taglib.*" %><%

  Category node = (Category) channel.getCategory((String) request.getAttribute("treeId"));
  request.removeAttribute("treeId");
  
  // Retrieve dedicated TreeView params
  TreeCatViewTag.TreeCatView treecat = null;
  TreeViewTag.TreeView treeview = (TreeViewTag.TreeView) request.getAttribute("treeview");
  if (treeview instanceof TreeCatViewTag.TreeCatView) {
    treecat = (TreeCatViewTag.TreeCatView) treeview;
  }
  
  String prefix =  treeview != null ? treeview.getTreePrefix() : null;
  
  // Hand Drag and Drop
  if (null != treecat) {
    treecat.handleDragDrop(jcmsContext);
  }
  
  // Provides a Set of roots
  Collection<Category> nodeSet =  (Collection<Category>) request.getAttribute("treeCollection");
  request.removeAttribute("treeCollection");
  if (nodeSet == null && node != null) {
    nodeSet = node.getChildrenSet();
  }
  if (nodeSet == null) { return; }
  
  // Sort in a new Set
  TreeSet set = new TreeSet(Category.getOrderComparator(userLang));
  set.addAll(nodeSet); nodeSet = set;
  
  // Check Rights: read / use / manage
  if (treecat != null) {
    treecat.filterRights(jcmsContext, nodeSet);
  }
  
  // Prevent display if empty
  if (Util.isEmpty(nodeSet)) { return; }
  
  for (Category itNode : nodeSet) {
    // Check if the category is persisted because when a category is deleted, the TreeView object in the AjaxRequestAttribute still contains this category
    if ((treeview != null && treeview.isRemoved(itNode)) || !itNode.isPersisted()) { continue; }
    
    Set<Workspace> wSet = treecat != null ? treecat.getWorkspaceSet(itNode, loggedMember, isAdmin) : null;
    boolean wId = Util.notEmpty(wSet) && treecat != null;
    String clazzLI = wId && treecat.showWorkspace && wSet.contains(workspace) ? "class='treeview-ws'" : "";
    
%>
<li data-jalios-id="<%= itNode.getId() %>" <%= clazzLI %>>
  
  <%-- CHECKBOX / RADIO --%>
  <% if (treeview != null && treecat != null && Util.notEmpty(treeview.getTreeInput()) && !CategoryFilter.isFiltered(itNode, loggedMember, treecat.filter)) { 
       String checked  = treeview.isChecked(itNode)  ? "checked='checked'"   : ""; 
       String disabled = treecat.isDisabled(itNode) ? "disabled='disabled'" : ""; %>
    <input type="<%= Util.getString(treeview.getTreeType(), "checkbox") %>" name="<%= treeview.getTreeInput() %>" value="<%= itNode.getId() %>" id="<%= itNode.getId() %>" <%= checked %> <%= disabled %>/>
  <% } %>
  
  <jalios:icon src="treeview-item-closed" css="treeview-item-icon" />
  <jalios:icon src="treeview-item-opened" css="treeview-item-icon" />
  
  <%-- READABLE COUNT --%>
  <% if (treecat != null && treecat.showReadable && treecat.hasAnyUnread(itNode, loggedMember)) { %>
  <jalios:icon src="readable" title="ui.com.alt.readable"/>
  <% } %>
  
  <%-- LINK / HIGHLIGHT --%>
  <% boolean hl   = (treeview != null) && treeview.isHighlighted(itNode); %>
  <% boolean ajax = (treeview != null) && treeview.isAjaxLink(); %>
  <% if (treeview != null && Util.notEmpty(treeview.getTreeInput())) { %>
    <label class='treeview-name <%= hl ? "treeview-hl" : "" %> ctxmenu-right' data-jalios-id="<%= itNode.getId() %>" for="<%= itNode.getId() %>"><%= itNode.getName(userLang) %></label>
  <% } else if (null != treeview) { 
    String clazz = (hl ? "treeview-hl " : "") + (ajax ? "ajax-refresh " : ""); 
  %><a href="<%= Util.getString(treeview.getTreeLink(itNode, jcmsContext),"#") %>" 
       title="<%= encodeForHTMLAttribute(itNode.getName(userLang), true) %>" <%-- Insert dataname title to help user know the name of each link even on panel with overflow hidden (DEVJCMS-613) --%>
       class='treeview-name <%= Util.getString(clazz,"") %> ctxmenu-right' data-jalios-id="<%= itNode.getId() %>"><%= itNode.getName(userLang) %></a>
  <% } else { %> 
    <span <%= hl ? "class='treeview-hl treeview-name'" : "" %>><%= itNode.getName(userLang) %></span>
  <% } %>
  
  <%-- EDIT --%>
  <% if (treecat != null && treecat.showEdit) { %>
    <jalios:edit data="<%= itNode %>" />
  <% } %>
  
  <%-- RIGHTS --%>
  <% if (treecat != null && treecat.showRights && itNode.hasAnyReadRights()) { %>
    <jalios:icon src="rights" title='<%= glp("ui.com.alt.restrictcat", itNode.getReadRightsString(5)) %>' alt="O-m" />
  <% } %>
  
  <%-- WORKSPACE --%>
  <% if (wId && treecat.showWorkspaceIcon) { %>
    <jalios:icon src="<%= treecat.getWorkspaceIcon(wSet) %>" title="<%= treecat.getWorkspaceIconTitle(wSet, userLang) %>" alt='<%= wSet.size() > 1 ? "[WW]" : "[W]" %>' />
  <% } %>
  
  <%-- PORTAL (FIXME: optimize, subtree) --%>
  <% Set<PortalInterface> pSet = treecat != null ? treecat.getPortalSet(itNode, loggedMember) : null;
    if (Util.notEmpty(pSet) && treecat != null && treecat.showPortal) { %>
      <% boolean displayPortlaLink = treecat.getMemoMap() != null && Util.toBoolean(treecat.getMemoMap().get("display-portal-link"), false); %>
      <% String portalUrlLink = pSet.size() == 1 && displayPortlaLink ? ServletUtil.getUrlWithUpdatedParam(request, "portalId", Util.getFirst(pSet).getId()) : null; %>
      <% if(portalUrlLink != null) { %><a href="<%= portalUrlLink %>"><% } %>
      <jalios:icon src="<%= treecat.getPortalIcon(pSet) %>" title="<%= treecat.getPortalIconTitle(pSet, loggedMember, userLang) %>" alt='<%= pSet.size() > 1 ? "[PP]" : "[P]" %>' />
      <% if(portalUrlLink != null) { %></a><% } %>
  <% } %>
  
  <%-- PUBLICATION COUNT --%>
  <%
    if (treecat != null && treecat.showPubCount){ 
      Set pubSet = Util.interSet(itNode.getAllPublicationSet(), channel.getPublicationSet(Content.class, loggedMember));
      if (Util.notEmpty(pubSet)) { %>
    <span class="pub-count badge"><%= pubSet.size() %></span>
  <% }} %>
  
  <%-- HELP --%>
  <% if (Util.notEmpty(itNode.getDescription(userLang))) { %>
    <jalios:tooltip><%= WikiRenderer.wiki2html(itNode.getDescription(userLang), userLocale, null) %></jalios:tooltip>
  <% } %>
  
  <%-- CTXMENU 
  <% if (treecat != null && treecat.showCtxMenu){  %>
  <a href="#" class="tree-arrow" data-jalios-id="<%= itNode.getId() %>" data-jalios-action="ctxmenu">
    <jalios:icon src="chevron-down" />
  </a>
  <% } %>
  --%>
  
  <%-- CHILDREN --%>
  <% if (Util.notEmpty(itNode.getChildrenSet())) { %>
    <jalios:treecatview prefix="<%= prefix %>" node="<%= itNode %>" />
  <% } %>
</li>
<% } %>
