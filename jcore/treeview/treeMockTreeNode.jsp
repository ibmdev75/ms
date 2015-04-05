<%@ include file="/jcore/doInitPage.jspf" %><%@page import="com.jalios.jcms.taglib.TreeViewTag" %><%

  String nodeId = (String) request.getAttribute("treeId");
  request.removeAttribute("treeId");
  
  // HACK
  Map map = (Map) request.getSession().getAttribute("MockMap");
  TreeNode node = (TreeNode) map.get(nodeId);
  
  // Provides a Set of roots
  Collection<? extends TreeNode> nodeSet =  (Collection<? extends TreeNode>) request.getAttribute("treeCollection");
  request.removeAttribute("treeCollection");
  if (nodeSet == null && node != null){
    nodeSet = node.getTreeChildren();
  }
  
  TreeViewTag.TreeView treeview = (TreeViewTag.TreeView) request.getAttribute("treeview");
  String prefix =  treeview != null ? treeview.getTreePrefix() : null;
  
  if (nodeSet == null) { return; }
  for (TreeNode it : nodeSet){
    MockTreeNode itNode = (MockTreeNode) it;
%>
<li data-jalios-id="<%= itNode.getId() %>">
  
  <%-- CHECKBOX / RADIO --%>
  <% if (treeview != null && Util.notEmpty(treeview.getTreeInput())) { 
       String checked  = treeview.isChecked(itNode)  ? "checked='checked'"   : ""; 
       String disabled = treeview.isDisabled(itNode) ? "disabled='disabled'" : ""; %>
    <input type="checkbox" name="<%= treeview.getTreeInput() %>" value="<%= itNode.getId() %>" <%= checked %> <%= disabled %>/>
  <% } %>
  
  <jalios:icon src="icon-folder" />
  
  <%-- LINK / HIGHLIGHT --%>
  <% boolean hl   = (treeview != null) && treeview.isHighlighted(itNode); %>
  <% boolean ajax = (treeview != null) && treeview.isAjaxLink(); %>
  <% if (treeview != null && Util.notEmpty(treeview.getTreeInput())) { %> 
    <label class='treeview-name <%= hl ? "treeview-hl" : "" %>'><%= itNode.getName() %></label>  
  <% } else if (null != treeview) { 
    String clazz = (hl ? "treeview-hl " : "") + (ajax ? "ajax-refresh " : ""); 
  %><a href="display.jsp?tvid=<%= itNode.getId() %>" class='treeview-name <%= Util.getString(clazz,"") %>'><%= itNode.getName() %></a>
  <% } else { %> 
    <span class='treeview-name <%= hl ? "treeview-hl" : "" %>'><%= itNode.getName() %></span>
  <% } %>
  
  <%-- EDIT --%>
  
  <%-- HELP --%>
  <% if (Util.notEmpty(itNode.getName())) { %>
    <jalios:tooltip><%= WikiRenderer.wiki2html(itNode.getName(), userLocale, null) %></jalios:tooltip>
  <% } %>
  
  <%-- CHILDREN --%>
  <% if (Util.notEmpty(itNode.getTreeChildren())) { %>
    <jalios:treeview prefix="<%= prefix %>" node="<%= itNode %>" />
  <% } %>
</li>
<% } %>