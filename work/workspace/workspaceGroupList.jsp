<%--
  @Summary: Group editor
  @Category: Admin / Data
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-4.1
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!(workspace.isAdmin(loggedMember) || checkAccess("admin-ws/users/group"))) {
    sendForbidden(request, response);
    return;
  }

  String title = glp("ui.wrkspc-edit.title-updt", workspace.getTitle(userLang), glp("ui.wrkspc-edit.groups"));

	request.setAttribute("title", title); 
	request.setAttribute("adminGroupMenu", "true"); 
	boolean   isDetailView     = getBooleanParameter("detail", false);
	
	boolean   guiShowTree      = channel.getBooleanProperty("hierarchical-ws.workgrouplist.guishowtree", false);
  boolean   showDetailView   = true;
	boolean showRadioInsert    = false;
	Workspace grpWorkspace     = workspace;
	Set       selectedGroups   = null;
	Set       groupSet         = null;
	boolean   guiShowName      = true;
  boolean   guiShowAcl       = true;
	boolean   guiShowParent    = true;
	boolean   guiShowWorkspace = false;
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
	String    guiExportCSV     = "admin/exportCSVGroup.jsp?wsid=" + workspace.getId();
	String    redirect         = ServletUtil.getUrl(request);
	String    target           = "_self";
	boolean   showCheckInsert  = false;
  boolean   guiShowAllGroups = false;
	boolean   guiShowAddGroup  = !workspace.isClosed();
	int       formElementCount = 0;
	String    guiMainTitle     = title;
	String    redirectRefresh  = redirect;
	String    alertUrl         = "jcore/alert/sendAlert.jsp";
	String    memberListUrl    = "work/workspace/workspaceMemberList.jsp";
  String    dbmemberListUrl  = "work/workspace/workspaceDBMemberList.jsp";
	boolean   guiGroupFilter   = false;
	boolean   guiShowSearchGroup = true;
	Workspace mbrWorkspace   = workspace;
  request.setAttribute("boHeaderCSS","sticky-display");
  
%><%@ include file='/work/doWorkHeader.jspf' %><%
%><%@ include file='/admin/doGroupList.jspf' %><%
%><%@ include file='/work/doWorkFooter.jspf' %>