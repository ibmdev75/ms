<%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%
  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  String scUsage = "query";
%>
<ul class="dropdown-menu"><%@ include file="/jcore/autocomplete/doShortCode.jspf" %></ul>