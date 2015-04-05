<%@ include file="/jcore/doInitPage.jspf" %><%@page import="com.jalios.jcms.taglib.TreeViewTag" %><%

Workspace node = channel.getWorkspace((String) request.getAttribute("treeId"));
request.removeAttribute("treeId");

/*
if (node != null && !node.canBeReadBy(loggedMember)){
  return;
}*/ 

// Provides a Set of roots
Collection<Workspace> nodeSet =  (Collection<Workspace>) request.getAttribute("treeCollection");
request.removeAttribute("treeCollection");
if (nodeSet == null && node != null){
  nodeSet = node.getSubWorkspaces();
}

// FIXME: All SubWorkspace or Mine ?
// FIXME: Can be read by => tester le portail co
TreeViewTag.TreeView treeview = (TreeViewTag.TreeView) request.getAttribute("treeview");
Map memo = treeview != null ? treeview.getMemoMap() : null;
String prefix =  treeview != null ? treeview.getTreePrefix() : null;
  
if (nodeSet != null) {
  for (Workspace itNode : nodeSet) {
    if (itNode == null) { continue; }
    /* if (!itNode.canBeReadBy(loggedMember)) { continue; } */
     boolean hl      = (treeview != null) && treeview.isHighlighted(itNode);
     boolean showCat = (memo != null) && memo.containsKey("catLink")   && Util.notEmpty(itNode.getCatSet());
     boolean showGrp = (memo != null) && memo.containsKey("groupLink") && Util.notEmpty(itNode.getGroupSet());
%>
    <li data-jalios-id="<%= itNode.getId() %>">
      <jalios:icon src='workspace' />
      <% if (null != treeview) { %>
        <a href='<%= Util.getString(treeview.getTreeLink(itNode, jcmsContext),"#") %>' class='treeview-name <%= treeview.isAjaxLink() ? "ajax-refresh" : "" %> <%= hl ? "highlight" : "" %>'><%= itNode.getTitle(userLang) %></a>
      <% } else { %>
        <span class='treeview-name <%= hl ? "highlight" : "" %>'><%= itNode.getTitle(userLang) %></span>
      <% } %>
      <% if (Util.notEmpty(itNode.getSubWorkspaces()) || showCat || showGrp) { %>
        <jalios:treeview prefix="<%= prefix %>" node="<%= itNode %>" />
      <% } %>
    </li>
<% }
} %>
 
<% if (node == null){ return; } %>
<% if (memo == null){ return; } %>

<% if (memo.containsKey("groupLink")) { %>
  <%
  // Build a list of group's root under the workspace
  List groupList = new ArrayList();
  for (Iterator it = node.getGroupSet().iterator() ; it.hasNext(); ) {
    Group g = (Group) it.next();
    if (Util.isEmpty(Util.interSet(node.getGroupSet(), g.getParentSet()))){ groupList.add(g); }
  }
  
  // Hack to display group in workspace node:
  // - Decrement current level because we pass 2 times in treeWorkspace.jsp before to handle group nodes (treeGroup.jsp)
  // - Decrement tree level because we have the first with workspace node
  int oldCurrentLevel = treeview.getCurrentLevel();
  treeview.setCurrentLevel(oldCurrentLevel - 1);
  int oldTreeLevel = treeview.getTreeLevel();
  treeview.setTreeLevel(oldTreeLevel - 1);
  %>
  <jalios:treeview prefix="<%= prefix %>"
                   collection="<%= groupList %>"
                   highlighted='<%= (Set) memo.get("groupHL") %>'
                   opened='<%= (Set) memo.get("groupHL") %>'
                   link='<%= (String) memo.get("groupLink") %>'
                   wrapper="false" />
  <%
  treeview.setCurrentLevel(oldCurrentLevel);
  treeview.setTreeLevel(oldTreeLevel);
  %>
<% } %>

<% if (memo.containsKey("catLink")) { %>
  <jalios:treecatview prefix="<%= prefix %>" collection="<%= node.getCatSet() %>" wrapper="false" link='<%= (String) memo.get("catLink") %>'/>
<% } %>

  