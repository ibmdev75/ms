<%@page import="com.jalios.jcms.handler.MemberQueryHandler"%><%
response.setHeader("Content-Disposition", "attachment; filename=members.csv");
// inform doInitPage to set the proper content type
request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

Workspace ws = getWorkspaceParameter("wsid");
Group grp = getGroupParameter("gid");
Workspace groupWS = grp != null ? grp.getWorkspace() : null;

boolean authorized = false;

// Export of all members
if (ws == null && grp == null) {
  authorized = checkAccess("admin/users/member");
}
// Export of all members in a global group
else if (grp != null && groupWS == null) {
  authorized = checkAccess("admin/users/member");  
}
// Export of all members in a workspace group
// Check group's workspace ACL access using workspace of group specified in parameter (not the current workspace !)
else if (grp != null && groupWS != null) {
  Map<String, Object> aclContext = AccessControlUtil.getContext(groupWS);
  authorized = checkAccess("admin/users/member") ||
      AccessControlManager.getInstance().checkAccess(loggedMember, "admin-ws/users/member/", aclContext) ||
      AccessControlManager.getInstance().checkAccess(loggedMember, "admin-ws/users/member", aclContext);
}
// Export of all members in a workspace
// Check workspace member ACL access using workspace in parameter (not the current workspace !)
else if (ws != null) {
  Map<String, Object> aclContext = AccessControlUtil.getContext(ws);
  authorized = checkAccess("admin/users/member") ||
      AccessControlManager.getInstance().checkAccess(loggedMember, "admin-ws/users/member/", aclContext) ||
      AccessControlManager.getInstance().checkAccess(loggedMember, "admin-ws/users/member", aclContext);
}

if (!authorized) {
  sendForbidden(request, response);
  return;
}

final Set memberSet;
if (hasParameter("caddy")) {
  memberSet = new TreeSet(Caddy.getCaddy(request).getMemberList());
} else {
  %><jsp:useBean id="memberQueryHandler" scope="page" class="com.jalios.jcms.handler.MemberQueryHandler"><%
    %><jsp:setProperty name="memberQueryHandler" property="request" value="<%= request %>"/><%
    %><jsp:setProperty name="memberQueryHandler" property="*" /><%
  %></jsp:useBean><%
  if (ws != null) {
    memberQueryHandler.setWorkspace(ws);
  }
  if (grp != null) {
    memberQueryHandler.setGid(grp.getId());
  }
  memberSet = memberQueryHandler.getResultSet();
}
 
JcmsUtil.exportCSV(memberSet, userLang, out);
%>
