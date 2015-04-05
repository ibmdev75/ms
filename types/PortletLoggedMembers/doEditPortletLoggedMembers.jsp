<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletLoggedMembers content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletLoggedMembersHandler formHandler = (EditPortletLoggedMembersHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletLoggedMembers.class);
%>
<%-- LimitPortletAccess ------------------------------------------------------------ --%>
<jalios:field name="limitPortletAccess" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- DisplayNumbers ------------------------------------------------------------ --%>
<jalios:field name="displayNumbers" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- DisplayMembers ------------------------------------------------------------ --%>
<jalios:field name="displayMembers" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- DisplayLinkToMembersProfile ------------------------------------------------------------ --%>
<jalios:field name="displayLinkToMembersProfile" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- MaximumMembers ------------------------------------------------------------ --%>
<jalios:field name="maximumMembers" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletLoggedMembers.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- l1WgI2o7oBRhPHA8xTMpig== --%>