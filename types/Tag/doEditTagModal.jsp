<%-- This file has been automatically generated. --%>
<%--
  @Summary: Tag modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditTagHandler formHandler = (EditTagHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.Tag.class);
%>
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- CouleurFond ------------------------------------------------------------ --%>
<jalios:field name="couleurFond" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- CouleurTexte ------------------------------------------------------------ --%>
<jalios:field name="couleurTexte" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Compteur ------------------------------------------------------------ --%>
<jalios:field name="compteur" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Url ------------------------------------------------------------ --%>
<jalios:field name="url" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 1NiBfByKttqF3UFQi9vdXg== --%>