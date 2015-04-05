<%@ include file="/jcore/doInitPage.jspf" %>

<% 
if (Util.toBoolean(request.getSession().getAttribute("channel.dev-tools.targets"), false)) {
  request.getSession().setAttribute("channel.dev-tools.targets", Boolean.FALSE);
} else {
  request.getSession().setAttribute("channel.dev-tools.targets", Boolean.TRUE);
}
sendRedirect(getUntrustedStringParameter("redirect", "admin/admin.jsp"), request, response);
  
%>