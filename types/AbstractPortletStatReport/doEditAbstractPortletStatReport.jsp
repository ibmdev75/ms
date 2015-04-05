<%-- This file has been automatically generated. --%>
<%--
  @Summary: AbstractPortletStatReport content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditAbstractPortletStatReportHandler formHandler = (EditAbstractPortletStatReportHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.AbstractPortletStatReport.class);
%>
<%-- ScheduleDate ------------------------------------------------------------ --%>
<jalios:field name="scheduleDate" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- StartingDate ------------------------------------------------------------ --%>
<jalios:field name="startingDate" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- EndingDate ------------------------------------------------------------ --%>
<jalios:field name="endingDate" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Schedule ------------------------------------------------------------ --%>
<jalios:field name="schedule" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractCollection/doEditAbstractCollection.jsp" />
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("AbstractPortletStatReport.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 6yOTcbv3lmUptCVUibUDag== --%>