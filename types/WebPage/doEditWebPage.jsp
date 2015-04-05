<%-- This file has been automatically generated. --%>
<%--
  @Summary: WebPage content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditWebPageHandler formHandler = (EditWebPageHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.WebPage.class);
%>
<%-- Url ------------------------------------------------------------ --%>
<jalios:field name="url" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- UrlToShot ------------------------------------------------------------ --%>
<jalios:field name="urlToShot" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("WebPage.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- rFto2h9hvlcuwuJj39Pf7g== --%>