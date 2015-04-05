<%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%
  String property = getStringParameter("glp", null, HttpUtil.PROPERTYNAME_REGEX);
  if (property == null) {
    return;
  }
  String[] parameters = request.getParameterValues("params"); // SHOULD BE ENCODED ... :/ // JspChecker.VERIFIED_FOR_SECURITY
  out.println("<p class='tip-content'>" + JcmsUtil.glp((String) userLangTL.get(),property,parameters) + "</p>");
%>