<%
  response.setHeader("Content-Disposition", "attachment; filename=groups.csv"); 
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%@ include file='/jcore/doInitPage.jsp' %><%

Workspace ws =  getWorkspaceParameter("wsid");

boolean authorized = false;

// Export of all group
if (ws == null) {
  authorized = checkAccess("admin/users/group");
}
// Export of workspace group
else {
  authorized = checkAccess("admin/users/group") || ws.isAdmin(loggedMember) ||
      AccessControlManager.getInstance().checkAccess(loggedMember, "admin-ws/users/group", AccessControlUtil.getContext(ws));
}

if (!authorized) {
  sendForbidden(request, response);
  return;
}

final Set<Group> groupSet;
if (hasParameter("caddy")) {
  groupSet = new TreeSet<Group>(Caddy.getCaddy(request).getGroupList());
} else {
  groupSet = (ws == null ? channel.getDataSet(Group.class) : ws.getGroupSet());
} 

TreeSet<Group> filteredGroupSet = new TreeSet<Group>();
if (groupSet != null) {
  for (Group group : groupSet) {
    if (group != null && group.canBeReadBy(loggedMember)) {
      filteredGroupSet.add(group);
    }
  }
}
JcmsUtil.exportCSV(filteredGroupSet, userLang, out);

%>