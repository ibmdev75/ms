<%@ include file="/jcore/doInitPage.jspf" %><%@page import="com.jalios.jcms.taglib.TreeViewTag" %><%

  TreeNode node = channel.getPublication((String) request.getAttribute("treeId"));
  request.removeAttribute("treeId");
  if (node != null && !((Publication)node).canBeReadBy(loggedMember)){
    return;
  }
  
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
    PortalElement itNode = (PortalElement) it;
    if (itNode == null) { continue; }
    if (!itNode.canBeReadBy(loggedMember)) { continue; }
%>
<li data-jalios-id="<%= itNode.getId() %>">
  <jalios:dataicon data="<%= itNode %>" css="icon-portlet" />
 
  <% if (null != treeview) { %>
  <a href='<%= Util.getString(treeview.getTreeLink(itNode, jcmsContext),"#") %>' class='treeview-name <%= treeview.isAjaxLink() ? "ajax-refresh" : "" %>'><%= itNode.getTitle(userLang) %></a>
  <% } else { %><span class='treeview-name'><%= itNode.getTitle(userLang) %></span><% } %>
  <% if (Util.notEmpty(itNode.getTreeChildren())) { %>
    <jalios:treeview prefix="<%= prefix %>" node="<%= itNode %>"/>
  <% } %>
</li>
<% } %>