<%--
  @Summary: Basic Portal content editor
  @Customizable: True
  @Requestable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
 EditAbstractPortalHandler formHandler = (EditAbstractPortalHandler)request.getAttribute("formHandler");
 %><%@ include file='/jcore/portal/doEditCommonPortlet.jspf' %>