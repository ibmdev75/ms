<%--
  @Summary: [Abstract] Basic Collection content editor
  @Customizable: True
  @Requestable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
 EditAbstractCollectionHandler formHandler = (EditAbstractCollectionHandler)request.getAttribute("formHandler"); 
%><%@ include file='/jcore/portal/doEditCommonPortlet.jspf' %>