<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletFeed modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletFeedHandler formHandler = (EditPortletFeedHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletFeed.class);
%>
<%-- Formats ------------------------------------------------------------ --%>
<jalios:field name="formats" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Copyright ------------------------------------------------------------ --%>
<jalios:field name="copyright" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- UseAuthKey ------------------------------------------------------------ --%>
<jalios:field name="useAuthKey" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletFeed_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/PortletQueryForeach/doEditPortletQueryForeachModal.jsp" />
</div>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- IuSbKIFMmZTTqUuv/yTB5w== --%>