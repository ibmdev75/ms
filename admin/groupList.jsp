<%--
  @Summary: Group editor
  @Category: Admin / Data
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-3.0.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin/users/group")) {
    sendForbidden(request, response);
    return;
  }

  request.setAttribute("title", glp("ui.adm.grp-list.title")); 
  request.setAttribute("groupSubAdminMenu", "true"); 
  boolean isDetailView = getBooleanParameter("detail", false);

  boolean guiShowTree      = channel.getBooleanProperty("hierarchical-ws.admingrouplist.guishowtree", false);
  boolean   showDetailView   = true;
	boolean   showRadioInsert  = false;
	Workspace grpWorkspace     = null;
	boolean   guiShowName      = true;
	boolean   guiShowAcl       = true;
	boolean   guiShowParent    = true;
	boolean   guiShowWorkspace = isDetailView;
	boolean   guiShowVisibility = isDetailView;
	boolean   guiShowMembers   = true;
	boolean   guiShowWebdav    = true;
	boolean   guiShowOrder     = isDetailView;
	boolean   guiShowCookie    = isDetailView;
	boolean   guiShowCdate     = true;
	boolean   guiShowId        = isDetailView;
	boolean   guiShowExt       = isDetailView;
	boolean   guiLastLDAPSync  = isDetailView;
	boolean   guiRemoveGroup   = true;
	boolean   guiShowPager     = true;
	String    guiExportCSV     = "admin/exportCSVGroup.jsp";
	String    redirect         = ServletUtil.getUrl(request);
	String    target           = "_self";
	boolean   showCheckInsert  = false;
	Set       selectedGroups   = null;
	Set       groupSet         = null;
	int       formElementCount = 0;
	boolean   guiShowAllGroups = false;
	boolean   guiShowAddGroup  = true;
	String    guiMainTitle     = glp("ui.adm.grp-list.title");
	String    redirectRefresh  = redirect;
	String    alertUrl         = "jcore/alert/sendAlert.jsp";
	String    memberListUrl    = "admin/memberList.jsp";
	String    dbmemberListUrl  = "admin/dbmemberList.jsp";
	boolean   guiGroupFilter   = true;
	boolean   guiShowSearchGroup = true;
	Workspace mbrWorkspace   = workspace;
 
  request.setAttribute("boHeaderCSS","sticky-display");
 
%><%@ include file='/admin/doAdminHeader.jspf' %><%
%><%@ include file='/admin/doGroupList.jspf' %><%
%><%@ include file='/admin/doAdminFooter.jspf' %>