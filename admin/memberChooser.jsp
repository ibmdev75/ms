<%@ include file='/jcore/doInitPage.jspf' %>
<%
  if (!isLogged) {
    sendForbidden(request, response);
    return;
  }
  
  request.setAttribute("title",glp("ui.work.mbr-ch.list"));
  request.setAttribute("zone","InternalUI");
%>
<jsp:useBean id="memberHandler" scope="page" class="com.jalios.jcms.handler.MemberListHandler">
  <jsp:setProperty name="memberHandler" property="request"  value="<%= request %>"/>
  <jsp:setProperty name="memberHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="memberHandler" property="*" />
</jsp:useBean>
<% 
  if (memberHandler.validate()) {
    return;
  }
  // Options specific to member chooser
  boolean jstoreMembers = getBooleanParameter("jstore",true);
  boolean jcmsdbMembers = getBooleanParameter("jcmsdb",true);

  boolean isAllMemberList    = (jstoreMembers && jcmsdbMembers) || (!jstoreMembers && !jcmsdbMembers);
  boolean isDBMemberList     = !jstoreMembers && jcmsdbMembers;
  boolean guiShowTree        = channel.getBooleanProperty("hierarchical-ws.adminmemberchooser.guishowtree", false);
  boolean isDetailView       = false;
  boolean showDetailView     = false;
	boolean showRadioInsert    = true;
	boolean showCheckInsert    = false;
	boolean guiShowName        = true;
	boolean guiShowPhoto       = isDetailView;
	boolean guiShowPub         = false;
	boolean guiPubFilter       = getBooleanParameter("filterWK",false);
	boolean guiShowGroups      = true;
	boolean guiShowSubGroups   = isDetailView;
	boolean guiShowWorkspace   = isDetailView;
  boolean guiShowReadCat     = false;
	boolean guiShowLogin       = false;
	boolean guiShowRights      = false;
	boolean guiShowWebdav      = false;
	boolean guiShowEmail       = false;
	boolean guiShowLang        = false;
	boolean guiShowSession     = false;
	boolean guiShowCreated     = false;
	boolean guiShowLastLogin   = false;
	boolean guiShowExt         = false;
	boolean guiLastLDAPSync    = false;
	boolean guiShowId          = false;
	boolean guiRemoveMember    = false;
	boolean guiShowPager       = true;
	boolean guiShowSearch      = true;
	boolean guiShowSU          = false;
	boolean guiShowSyncLDAP    = false;
	boolean guiShowDisable     = false;
	boolean guiShowChPwd       = false;
	boolean guiShowAddMember   = false;
	boolean guiShowImportCsv   = false;
	boolean guiRefineGroups    = true;
	boolean guiUnGroupMember   = false;
	boolean guiShowNameLink    = false;
	String  guiExportCSV       = null;
	Set     selectedMembers    = new TreeSet();
	String  redirect           = ServletUtil.getUrl(request);
	Workspace mbrWorkspace     = null;
	String  target             = "_blank";
	String  redirectRefresh    = ServletUtil.getUrlWithUpdatedParam(request,"refreshAndClose","true");
%>

<%@ include file='/jcore/doEmptyHeader.jspf' %>
  <%@ include file='/work/doInsertLinkParams.jspf' %>
  <%@ include file='/work/doInsertLinkPopup.jspf' %>
  <div id='mainDiv' style='border-bottom: 1px solid #000000;'>
  <%@ include file='/admin/doMemberList.jspf' %>
  </div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
