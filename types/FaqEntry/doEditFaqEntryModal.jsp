<%-- This file has been automatically generated. --%>
<%--
  @Summary: FaqEntry modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditFaqEntryHandler formHandler = (EditFaqEntryHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.FaqEntry.class);
%>
<%-- Answer ------------------------------------------------------------ --%>
<jalios:field name="answer" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Faq ------------------------------------------------------------ --%>
<jalios:field name="faq" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Order ------------------------------------------------------------ --%>
<jalios:field name="order" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- efgbTjbg7BKsbKlNX9G0tg== --%>