<%--
  @Summary: page used to restart channel
  @Category: Admin/Channel
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%><%

 request.setAttribute("CheckCSRF", Boolean.TRUE);
 request.setAttribute("restart", Boolean.TRUE);

%><%@ include file='/front/notAvailable.jsp' %>