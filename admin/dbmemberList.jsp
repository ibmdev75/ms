<%--
  @Summary: Display the DB member list
  @Category: Admin / Data
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-3.0.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!checkAccess("admin/users/dbmember")) {
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

request.setAttribute("title", glp("ui.adm.dbmbr-list.title")); 
request.setAttribute("dbmemberSubAdminMenu", "true"); 
request.setAttribute("boHeaderCSS","sticky-display");

%><%@ include file='/admin/doAdminHeader.jspf' %><%

boolean isAllMemberList  = false;
boolean isDBMemberList   = true;
boolean isDetailView     = getBooleanParameter("detail", false);
boolean guiShowTree      = channel.getBooleanProperty("hierarchical-ws.admindbmemberlist.guishowtree", false);
boolean showDetailView   = true;
boolean showRadioInsert  = false;
boolean showCheckInsert  = false;
boolean guiShowName      = true;
boolean guiShowPhoto     = isDetailView;
boolean guiShowPub       = false;
boolean guiPubFilter     = false;
boolean guiShowGroups    = true;
boolean guiShowSubGroups = isDetailView;
boolean guiShowWorkspace = false;
boolean guiShowReadCat   = false;
boolean guiShowLogin     = isDetailView;
boolean guiShowRights    = false;
boolean guiShowWebdav    = false;
boolean guiShowEmail     = isDetailView;
boolean guiShowLang      = channel.isMultilingual();
boolean guiShowSession   = true;
boolean guiShowCreated   = true;
boolean guiShowLastLogin = isDetailView;
boolean guiShowExt       = false;
boolean guiLastLDAPSync  = isDetailView;
boolean guiShowId        = isDetailView;
boolean guiRemoveMember  = true;
boolean guiShowPager     = true;
boolean guiShowSearch    = true;
boolean guiShowSU        = true;
boolean guiShowSyncLDAP  = true;
boolean guiShowDisable   = true;
boolean guiShowChPwd     = true;
boolean guiShowAddMember = true;
boolean guiShowImportCsv = MemberImportManager.isEnabled() && checkAccess(MembersCsvImportHandler.ADMIN_USERS_MEMBER_ACL);
boolean guiRefineGroups  = true;
boolean guiUnGroupMember = true;
boolean guiShowNameLink  = true;
StringBuilder guiExportCSVBuilder = new StringBuilder();
{
  Group group = memberHandler.getAvailableSelectedGroup();
  String text = getUntrustedStringParameter("text", "");
  guiExportCSVBuilder.append("admin/exportCSVDBMember.jsp");
  if (group != null || Util.notEmpty(text)) {
    guiExportCSVBuilder.append("?");
    if (group != null) {
      guiExportCSVBuilder.append("gid=");
      guiExportCSVBuilder.append(group.getId());
      if (Util.notEmpty(text)) {
        guiExportCSVBuilder.append("&amp;");
      }
    }
    if (Util.notEmpty(text)) {
     guiExportCSVBuilder.append("text=");
     guiExportCSVBuilder.append(text);
    }
  }
}
String  guiExportCSV     = guiExportCSVBuilder.toString();
Set     selectedMembers  = new TreeSet();
String  redirect         = ServletUtil.getUrl(request);
Workspace mbrWorkspace   = null;
String  target           = "_self";
String  redirectRefresh  = redirect;

%><%@ include file='/work/doInsertLinkParams.jspf' %><%
%><%@ include file='/admin/doMemberList.jspf' %><%
%><%@ include file='/admin/doAdminFooter.jspf' %>