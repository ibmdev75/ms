<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletMenu content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletMenuHandler formHandler = (EditPortletMenuHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletMenu.class);
%>
<%-- Items ------------------------------------------------------------ --%>
<jalios:field name="items" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ItemSeparaor ------------------------------------------------------------ --%>
<jalios:field name="itemSeparaor" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortlet/doEditAbstractPortlet.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletMenu.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- jLi7G6Pn0i6JhRerD9VRMA== --%>