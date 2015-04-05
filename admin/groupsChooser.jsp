<%@ include file='/jcore/doInitPage.jspf' %>
<%
  if (!isLogged) {
    sendForbidden(request, response);
    return;
  }
  
  request.setAttribute("title",glp("ui.work.grp-ch.list"));
  request.setAttribute("zone","InternalUI");
	boolean   isDetailView     = getBooleanParameter("detail", false);
	
  boolean   guiShowTree      = channel.getBooleanProperty("hierarchical-ws.admingroupschooser.guishowtree", false);
  boolean   showDetailView   = true;
  boolean   showRadioInsert  = false;
  boolean   showCheckInsert  = true;
  Workspace grpWorkspace     = null;
	boolean   guiShowName      = true;
	boolean   guiShowAcl       = false;
	boolean   guiShowParent    = isDetailView;
	boolean   guiShowWorkspace = isDetailView && !getBooleanParameter("filterWK",false);
  boolean   guiShowVisibility = isDetailView;  
	boolean   guiShowOrder     = false;
	boolean   guiShowWebdav    = false;
	boolean   guiShowCookie    = false;
	boolean   guiShowMembers   = true;
	boolean   guiShowCdate     = false;
	boolean   guiShowId        = false;
	boolean   guiShowExt       = false;
  boolean   guiLastLDAPSync  = false;
	boolean   guiRemoveGroup   = false;
	boolean   guiShowPager     = true;
	String    guiExportCSV     = null;
	String    redirect         = ServletUtil.getUrl(request);
	String    target           = "_blank";
	Set       selectedGroups   = new TreeSet<Group>(getDataListParameter("groups", Group.class));
	Set       groupSet         = null;
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
	Workspace mbrWorkspace     = null;
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
