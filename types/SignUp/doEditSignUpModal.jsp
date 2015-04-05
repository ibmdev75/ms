<%-- This file has been automatically generated. --%>
<%--
  @Summary: SignUp modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditSignUpHandler formHandler = (EditSignUpHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.SignUp.class);
%>
<%-- Name ------------------------------------------------------------ --%>
<jalios:field name="name" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- FirstName ------------------------------------------------------------ --%>
<jalios:field name="firstName" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Email ------------------------------------------------------------ --%>
<jalios:field name="email" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Salutation ------------------------------------------------------------ --%>
<jalios:field name="salutation" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- JobTitle ------------------------------------------------------------ --%>
<jalios:field name="jobTitle" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- FavoriteLogin ------------------------------------------------------------ --%>
<jalios:field name="favoriteLogin" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Message ------------------------------------------------------------ --%>
<jalios:field name="message" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- PACub0+NXaI9w89Oqm9Piw== --%>