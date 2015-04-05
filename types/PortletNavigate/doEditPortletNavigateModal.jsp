<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletNavigate modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletNavigateHandler formHandler = (EditPortletNavigateHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletNavigate.class);
%>
<ul class="nav nav-tabs">
<li class='active'><a href="#PortletNavigate_general_tab" onclick="return false;"><%= formHandler.getTabLabel("general") %></a></li>
<li ><a href="#PortletNavigate_advanced_tab" onclick="return false;"><%= formHandler.getTabLabel("advanced") %></a></li>
</ul>
<div class="tab-content jalios-tab-template clearfix"><div id="PortletNavigate_general_tab" class='tab-pane active'>
<%-- RootCategory ------------------------------------------------------------ --%>
<jalios:field name="cidsRootCategory" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- RefineCategory ------------------------------------------------------------ --%>
<jalios:field name="refineCategory" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Levels ------------------------------------------------------------ --%>
<jalios:field name="levels" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletNavigate_advanced_tab" class='tab-pane '>
<%-- HideWhenNoResults ------------------------------------------------------------ --%>
<jalios:field name="hideWhenNoResults" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- NavigatePortlet ------------------------------------------------------------ --%>
<jalios:field name="navigatePortlet" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div>
</div><div id="PortletNavigate_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinableModal.jsp" />
</div>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- H4D3cnfypSOdZApkehXU+g== --%>