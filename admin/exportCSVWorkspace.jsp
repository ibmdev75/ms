<%
  response.setHeader("Content-Disposition", "attachment; filename=workspaces.csv"); 
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!(isAdmin || checkAccess("admin/work/workspace"))) {
  sendForbidden(request, response);
  return;
}
final Set workspaceSet;
if (hasParameter("caddy")) {
  workspaceSet = new TreeSet(Caddy.getCaddy(request).getWorkspaceList());
} else {
  workspaceSet = Workspace.getAllWorkspaceSet(loggedMember);
}
JcmsUtil.exportCSV(workspaceSet, userLang, out);
%>
