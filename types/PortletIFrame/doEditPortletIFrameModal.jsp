<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletIFrame modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletIFrameHandler formHandler = (EditPortletIFrameHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletIFrame.class);
%>
<%-- Source ------------------------------------------------------------ --%>
<jalios:field name="source" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- FrameWidth ------------------------------------------------------------ --%>
<jalios:field name="frameWidth" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- FrameHeight ------------------------------------------------------------ --%>
<jalios:field name="frameHeight" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletIFrame_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinableModal.jsp" />
</div>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- 7j3iGNcRKoWURN5aeV8ebg== --%>