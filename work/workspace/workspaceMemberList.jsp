<%--
  @Summary: Display the member list
  @Category: Admin / Data
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-4.1.0
--%><%

%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!checkAccess("admin-ws/users/member")) {
  sendForbidden(request, response);
  return;
}

%><jsp:useBean id="memberHandler" scope="page" class="com.jalios.jcms.handler.MemberListHandler"><%
  %><jsp:setProperty name="memberHandler" property="request"  value="<%= request %>"/><%
  %><jsp:setProperty name="memberHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="memberHandler" property="*" /><%
%></jsp:useBean><%

if (memberHandler.validate()) {
  return;
}
request.setAttribute("title", glp("ui.adm.mbr-list.title"));
request.setAttribute("adminMemberMenu", "true");
request.setAttribute("boHeaderCSS","sticky-display");

%><%@ include file='/work/doWorkHeader.jspf' %><%

boolean isDetailView = getBooleanParameter("detail", false);

boolean isAllMemberList    = false;
boolean isDBMemberList   = false;
boolean guiShowTree      = channel.getBooleanProperty("hierarchical-ws.workmemberlist.guishowtree", false);
boolean showDetailView   = true;
boolean showRadioInsert  = false;
boolean showCheckInsert  = false;
boolean guiShowName      = true;
boolean guiShowPhoto     = isDetailView;
boolean guiShowPub       = isDetailView;
boolean guiPubFilter     = true;
boolean guiShowGroups    = true;
boolean guiShowSubGroups = isDetailView;
boolean guiShowWorkspace = false;
boolean guiShowReadCat   = isDetailView && AudienceRights.getInstance().isEnabled();
boolean guiShowLogin     = isDetailView;
boolean guiShowRights    = isDetailView;
boolean guiShowWebdav    = channel.isWebdavEnabled();
boolean guiShowEmail     = isDetailView;
boolean guiShowLang      = true;
boolean guiShowSession   = isDetailView;
boolean guiShowCreated   = isDetailView;
boolean guiShowLastLogin = isDetailView;
boolean guiShowExt       = isDetailView;
boolean guiLastLDAPSync  = isDetailView && isAdmin;
boolean guiShowId        = isDetailView;
boolean guiRemoveMember  = true;
boolean guiShowPager     = true;
boolean guiShowSearch    = true;
boolean guiShowSU        = isAdmin;
boolean guiShowSyncLDAP  = isAdmin;
boolean guiShowDisable   = isAdmin || checkAccess("admin-ws/member-edit");
boolean guiShowChPwd     = isAdmin || checkAccess("admin-ws/member-edit");
boolean guiShowAddMember = isAdmin || checkAccess("admin-ws/member-edit");
boolean guiShowImportCsv = false;
boolean guiRefineGroups  = true;
boolean guiUnGroupMember = true;
boolean guiShowNameLink  = true;
StringBuilder guiExportCSVBuilder = new StringBuilder();
{
  String text = getUntrustedStringParameter("text", "");
  guiExportCSVBuilder.append("admin/exportCSVMember.jsp?wsid=");
  guiExportCSVBuilder.append(workspace.getId());

  Group group = memberHandler.getAvailableSelectedGroup();
  if (group != null) {
    guiExportCSVBuilder.append("&amp;gid=");
    guiExportCSVBuilder.append(group.getId());
  }
  if (Util.notEmpty(text)) {
    guiExportCSVBuilder.append("&amp;text=");
    guiExportCSVBuilder.append(text);
  }
}
String  guiExportCSV     = guiExportCSVBuilder.toString();
Set     selectedMembers  = new TreeSet();
String  redirect         = ServletUtil.getUrl(request);
Workspace mbrWorkspace   = workspace;
String  target           = "_self";
String  redirectRefresh  = redirect;

if (!hasParameter("gid")) {
  setInfoMsg(glp("ui.adm.mbr-list.info"), request);
}
%>
<%@ include file='/work/doInsertLinkParams.jspf' %>
<%@ include file='/admin/doMemberList.jspf' %>
<%@ include file='/work/doWorkFooter.jspf' %>