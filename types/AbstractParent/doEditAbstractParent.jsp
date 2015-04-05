<%--
  @Summary: Basic Parent content editor
  @Customizable: True
  @Requestable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
 EditAbstractParentHandler formHandler = (EditAbstractParentHandler)request.getAttribute("formHandler"); 
 %><%@ include file='/jcore/portal/doEditCommonPortlet.jspf' %>