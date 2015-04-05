<%
response.setHeader("Content-Disposition", "attachment; filename=dbmembers.csv");
// inform doInitPage to set the proper content type
request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%@ include file='/jcore/doInitPage.jspf' %><%

Group grp = getGroupParameter("gid");

if (!checkAccess("admin/users/dbmember")) {
  sendForbidden(request, response);
  return;
}

final List<String> dbMemberIdSet;
if (hasParameter("caddy")) {
  dbMemberIdSet = Caddy.getCaddy(request).getDBMemberList();
} else {
  %><jsp:useBean id="memberQueryHandler" scope="page" class="com.jalios.jcms.handler.DBMemberQueryHandler"><%
   %><jsp:setProperty name="memberQueryHandler" property="request" value="<%= request %>"/><%
   %><jsp:setProperty name="memberQueryHandler" property="*" /><%
  %></jsp:useBean><%
  dbMemberIdSet = memberQueryHandler.getIdResultList();
} 
 
DBMember.exportCSV(dbMemberIdSet, userLang, out);
%>
