<%--
  @Summary: [Abstract] Basic Portlet Skinable content editor
  @Customizable: True
  @Requestable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
 EditAbstractPortletSkinableHandler formHandler = (EditAbstractPortletSkinableHandler)request.getAttribute("formHandler");
 %><%@ include file='/jcore/portal/doEditCommonPortlet.jspf' %>