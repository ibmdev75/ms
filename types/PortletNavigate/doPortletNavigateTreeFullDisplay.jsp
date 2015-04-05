<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ include file='/types/PortletNavigate/doInitPortletNavigate.jspf' %>

<%
	if (((rootCategory == null) || (rootCategory.isLeaf())) && box.getHideWhenNoResults()){
		request.setAttribute("ShowPortalElement",Boolean.FALSE);
    return;
	}
 
	TreeSet highlightSet = new TreeSet();
	if (box.getNavigatePortlet() && currentCategory != null){
		highlightSet.add(currentCategory);
  }
  else if (!box.getNavigatePortlet()){
    highlightSet.addAll(Arrays.asList(ctxCategories));
  }
  
%>
<% Set rootSet = new TreeSet(); rootSet.add(rootCategory); %>
<%-- level: '- 1' because treeview level begins to 0 and box begins to 1 --%>
<jalios:treecatview 
  prefix="<%= box.getId() %>"
  link='<%= box.getNavigatePortlet() ? TreeViewTag.RXP_DISPLAY_URL : TreeCatViewTag.RXP_CTXCAT_URL %>'
    
  collection="<%= rootSet %>"
  opened="<%= highlightSet %>"
  highlighted="<%= highlightSet %>"  
  
  level="<%= (box.getLevels() - 1) %>"
  dragdrop="true"
  showCtxMenu="true"
/>
<%-- AFAC
<jalios:treecat
  rootSet='<%= rootSet %>'
  highlightCatSet='<%= highlightSet %>'
  nameLink='<%= TreeCat.NAME_LINK_DISPLAY %>'
  openLevel=''
  nodeAjaxSuffix=''
	nameLinkNavigate='<%= box.getNavigatePortlet() %>'
	pubReadableDisplay='<%= true %>'
	toggleLink='<%= !box.getNavigatePortlet() %>'
/>
 --%>