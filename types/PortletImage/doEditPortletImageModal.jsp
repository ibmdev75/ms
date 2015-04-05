<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletImage modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletImageHandler formHandler = (EditPortletImageHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletImage.class);
%>
<ul class="nav nav-tabs">
<li class='active'><a href="#PortletImage_portlet_tab" onclick="return false;"><%= formHandler.getTabLabel("portlet") %></a></li>
<li ><a href="#PortletImage_advanced_tab" onclick="return false;"><%= formHandler.getTabLabel("advanced") %></a></li>
</ul>
<div class="tab-content jalios-tab-template clearfix"><div id="PortletImage_portlet_tab" class='tab-pane active'>
<%-- Image ------------------------------------------------------------ --%>
<jalios:field name="image" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Link ------------------------------------------------------------ --%>
<jalios:field name="link" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Alt ------------------------------------------------------------ --%>
<jalios:field name="alt" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletImage_advanced_tab" class='tab-pane '>
<%-- TargetWindow ------------------------------------------------------------ --%>
<jalios:field name="targetWindow" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ImgWidth ------------------------------------------------------------ --%>
<jalios:field name="imgWidth" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ImgHeight ------------------------------------------------------------ --%>
<jalios:field name="imgHeight" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div>
</div><div id="PortletImage_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinableModal.jsp" />
</div>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- lsTTx91d6VREbKThDA6bag== --%>