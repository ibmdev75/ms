<%
  response.setHeader("Content-Disposition", "attachment; filename=results.csv"); 
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id="queryHandler" scope="page" class="com.jalios.jcms.handler.QueryHandler"><%
%><jsp:setProperty name="queryHandler" property="request"  value="<%= request %>"/><%
%><jsp:setProperty name="queryHandler" property="response" value="<%= response %>"/><%
%><jsp:setProperty name="queryHandler" property="*" /><%
%><jsp:setProperty name="queryHandler" property="checkPstatus" value="false"/><%
%><jsp:setProperty name="queryHandler" property="pagerAll" value="true"/><%
%></jsp:useBean><%
 
if (!isLogged || !(isAdmin || loggedMember.isWorker(workspace) || request.getAttribute("authorized") == Boolean.TRUE)) {
  sendForbidden(request, response);
  return;
}

JcmsUtil.exportCSV(queryHandler.getResultSet().getAsSortedSet(), userLang, out);
%>
