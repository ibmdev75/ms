<%@ include file="/jcore/doInitPage.jspf" %><%

  if (!isLogged) {
    sendForbidden(request, response);
    return;
  }

  boolean caddyFilter = getBooleanParameter("pubBrowserCaddyOp", false) || getBooleanParameter("pubBrowserCaddyFilter", false);
  String caddyQueryString = getUntrustedStringParameter("pubBrowserCaddyQueryString", null);

%><%@ include file="/work/doPubBrowserCaddy.jspf" %>
