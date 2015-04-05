<%@ include file='/jcore/doInitPage.jspf' %>
<%
  if (!isLogged) {
    sendForbidden(request, response);
    return;
  }
  
  request.setAttribute("title",glp("ui.work.grp-ch.list"));
  request.setAttribute("zone","InternalUI");
	boolean   isDetailView     = getBooleanParameter("detail", false);
	
  boolean   guiShowTree      = channel.getBooleanProperty("hierarchical-ws.admingroupchooser.guishowtree", false);
  boolean   showDetailView   = true;
  boolean   showRadioInsert  = true;
  boolean   showCheckInsert  = false;
  Workspace grpWorkspace     = getWorkspaceParameter("ws");
	boolean   guiShowName      = true;
	boolean   guiShowAcl       = true;
	boolean   guiShowParent    = isDetailView;
	boolean   guiShowWorkspace = !getBooleanParameter("filterWK",false);
  boolean   guiShowVisibility = isDetailView;  
	boolean   guiShowMembers   = true;
	boolean   guiShowOrder     = isDetailView;
	boolean   guiShowWebdav    = isDetailView;
	boolean   guiShowCookie    = isDetailView;
	boolean   guiShowCdate     = isDetailView;
	boolean   guiShowId        = isDetailView;
	boolean   guiShowExt       = isDetailView;
	boolean   guiLastLDAPSync  = isDetailView;
	boolean   guiRemoveGroup   = false;
	boolean   guiShowPager     = true;
	String    guiExportCSV     = null;
	String    redirect         = ServletUtil.getUrl(request);
	String    target           = "_blank";
	Set       selectedGroups   = null;
	Set       groupSet         = grpWorkspace != null ? grpWorkspace.getGroupSet() : channel.getDataSet(Group.class);
	int       formElementCount = 0;
	boolean   guiShowAllGroups = true;  
	boolean   guiShowAddGroup  = false;
	String    guiMainTitle     = grpWorkspace != null ? glp("ui.adm.grp-list.title3", grpWorkspace.getTitle(userLang)) : glp("ui.adm.grp-list.title");
	String    redirectRefresh  = ServletUtil.getUrlWithUpdatedParam(request,"refreshAndClose","true");
	String    alertUrl         = null;
	String    memberListUrl    = getBooleanParameter("filterWK",false) ? "work/workspace/workspaceMemberList.jsp" : "admin/memberList.jsp";
  String    dbmemberListUrl  = "admin/dbmemberList.jsp";
	boolean   guiGroupFilter   = true;
	boolean   guiShowSearchGroup = true;
	Workspace mbrWorkspace   = null;
%>

<%@ include file='/jcore/doEmptyHeader.jspf' %>
  <%@ include file='/work/doInsertLinkParams.jspf' %>
  <%@ include file='/work/doInsertLinkPopup.jspf' %>
  <div id='mainDiv' style='border-bottom: 1px solid #000000;'>
  <%@ include file='/admin/doGroupList.jspf' %>
  </div>
  <jalios:javascript>
    Popup.autoResize("mainDiv");
  </jalios:javascript>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
