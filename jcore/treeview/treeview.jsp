<%@ include file="/jcore/doInitPage.jspf" %><%@page import="com.jalios.jcms.taglib.TreeViewTag" %>
<%!
public String checkTemplate(String prop, String hint, String clazz) {
  String val = channel.getProperty(prop + "." + clazz + "." + hint, null);
  if (null == val) { val = channel.getProperty(prop + "." + clazz, null); }
  if (null == val) { val = channel.getProperty(prop + "." + hint,  null); }
  return val;
}
%>
<%
// Prefix
String treePrefix = getUntrustedStringParameter(TreeViewTag.TREE_PREFIX_ATTR, null);
treePrefix = Util.getString(request.getAttribute(TreeViewTag.TREE_PREFIX_ATTR), treePrefix);

// TreeView
TreeViewTag.TreeView treeview = (TreeViewTag.TreeView) jcmsContext.getAjaxRequestAttribute(treePrefix + "." + TreeViewTag.TREEVIEW_ATTR);
request.setAttribute(TreeViewTag.TREEVIEW_ATTR, treeview);

// TreeId
String treeId = null;
if (request.getAttribute("treeIdParameter") == null) {
  treeId = getUntrustedStringParameter(TreeViewTag.TREE_ID_ATTR, treeId);
  request.setAttribute("treeIdParameter", Boolean.TRUE);
}
treeId = Util.getString(request.getAttribute(TreeViewTag.TREE_ID_ATTR), treeId);
if (null != treeId) { request.setAttribute(TreeViewTag.TREE_ID_ATTR, treeId); }

// TreeHint
String treeHint = getUntrustedStringParameter("treeHint", null);
treeHint = Util.getString(treeview.getTreeHint(), treeHint);

// Compute "opened"
Collection<Data> treeOpened = channel.getDataSet(getStringParameterValues("treeOpened", HttpUtil.DATAID_REGEX), Data.class, true);
if (Util.notEmpty(treeOpened)) {
  // request.removeAttribute(TreeViewTag.TREE_LEVEL_ATTR); // it's a hack to reset the internal level. It should be moved inside the setTreeOpened() but relies on request...
  treeview.setTreeOpened(treeOpened);
}

// Compute "highlighed"
Collection<Data> treeHighlighted = channel.getDataSet(getStringParameterValues("treeHighlighted", HttpUtil.DATAID_REGEX), Data.class, true);
if (Util.notEmpty(treeHighlighted)) {
  treeview.setTreeHighlighted(treeHighlighted);
}

// Compute "checked"
Collection<Data> treeChecked = channel.getDataSet(getStringParameterValues("treeChecked", HttpUtil.DATAID_REGEX), Data.class, true);
if (Util.notEmpty(treeChecked)) {
  treeview.setTreeChecked(treeChecked);
}

// Compute collection
if (null == treeId && null != treeview) {
  Collection<Data> treeCollec = channel.getDataSet(getStringParameterValues("treeCollection", HttpUtil.DATAID_REGEX), Data.class, true);
  Collection collection = treeview.addTreeCollection(treeCollec);
  request.setAttribute("treeCollection", collection);
  
  Object tmp = Util.getFirst(collection);
  if (tmp instanceof TreeNode){
    treeId = ((TreeNode)tmp).getId();
  } 
  else if (tmp instanceof Data){ // Kludge (same code in TreeViewTag)
    treeId = ((Data)tmp).getId();
  }

  if (null == treeHint){
    treeHint = Util.getClassShortName(tmp);
  }
}

String treeTemplate = checkTemplate("jcms.resource.treeview", treeHint, null); 
Data data = channel.getData(treeId);
if (data != null){
  treeTemplate = checkTemplate("jcms.resource.treeview", treeHint, Util.getClassShortName(data));
  // If the tree template is not defined, we use a default tree template for PortalElement and Publication objects
  if(treeTemplate == null && data instanceof PortalElement) {
    treeTemplate = checkTemplate("jcms.resource.treeview", treeHint, Util.getClassShortName(PortalElement.class));  
  } else if(treeTemplate == null && data instanceof Publication) {
    treeTemplate = checkTemplate("jcms.resource.treeview", treeHint, Util.getClassShortName(Publication.class));  
  }
}
  
// Exit if empty
if (Util.isEmpty(treeTemplate)) {
  // Do not forget doAjaxFooter.jspf in hook
  %><jalios:include target="TREEVIEW_HOOK" targetContext="li" /><%
  request.removeAttribute(TreeViewTag.TREEVIEW_ATTR);
  return;
}
  
// Override choosen 
request.setAttribute("treeTemplate", treeTemplate);
%><jalios:include target="TREEVIEW_FILTER" targetContext="empty" /><%
treeTemplate = (String) request.getAttribute("treeTemplate");
  
// Include template
if (Util.notEmpty(treeTemplate)) {
  %><jsp:include page='<%= "/"+treeTemplate %>' flush="true" /><%
  %><%@ include file='/jcore/doAjaxFooter.jspf' %><%  
}
request.removeAttribute(TreeViewTag.TREEVIEW_ATTR);
%>
