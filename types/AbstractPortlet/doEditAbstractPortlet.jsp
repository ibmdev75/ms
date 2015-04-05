<%--
  @Summary: [Abstract] Basic Portlet content editor
  @Customizable: True
  @Requestable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
 EditAbstractPortletHandler formHandler = (EditAbstractPortletHandler)request.getAttribute("formHandler");
 %><%@ include file='/jcore/portal/doEditCommonPortlet.jspf' %>