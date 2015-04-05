<%--
  @Summary: page used to disable/enable data write
  @Category: Admin
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5
--%><%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file='/jcore/doInitPage.jspf' %><%

  if (!isAdmin) {
    sendForbidden(request, response);
    return;
  }
  
  // Decode params
  String msg = getUntrustedStringParameter("value", glp("ui.adm.data-write.default-msg"));
  boolean disable = getBooleanParameter("disable", true);
  
  // Disable/Enable
  channel.handleDataWriteState(disable, msg, true);

  // Redirect to admin page
  sendRedirect("admin/admin.jsp", request, response);
%>