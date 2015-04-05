<%-- This file has been automatically generated. --%>
<%--
  @Summary: AbstractPortal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditAbstractPortalHandler formHandler = (EditAbstractPortalHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.AbstractPortal.class);
%>
<%-- PageTitle ------------------------------------------------------------ --%>
<jalios:field name="pageTitle" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Child ------------------------------------------------------------ --%>
<jalios:field name="child" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- CssFile ------------------------------------------------------------ --%>
<jalios:field name="cssFile" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- PortletImage ------------------------------------------------------------ --%>
<jalios:field name="portletImage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- CacheType ------------------------------------------------------------ --%>
<jalios:field name="cacheType" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- CacheSensibility ------------------------------------------------------------ --%>
<jalios:field name="cacheSensibility" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- InvalidClass ------------------------------------------------------------ --%>
<jalios:field name="invalidClass" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- InvalidTime ------------------------------------------------------------ --%>
<jalios:field name="invalidTime" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- BehaviorCopy ------------------------------------------------------------ --%>
<jalios:field name="behaviorCopy" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- CssId ------------------------------------------------------------ --%>
<jalios:field name="cssId" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- CssClasses ------------------------------------------------------------ --%>
<jalios:field name="cssClasses" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ExactCategory ------------------------------------------------------------ --%>
<jalios:field name="exactCategory" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("AbstractPortal.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- KCpkykB6UPtPh8oMEWQiHQ== --%>