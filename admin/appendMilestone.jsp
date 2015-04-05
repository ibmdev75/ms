<%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!isAdmin) {
  sendForbidden(request, response);
  return;
}
channel.appendMilestone(getUntrustedStringParameter("text", ""));
sendRedirect("admin/storeInfo.jsp", request, response);

%>