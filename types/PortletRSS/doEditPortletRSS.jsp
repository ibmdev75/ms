<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletRSS content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletRSSHandler formHandler = (EditPortletRSSHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletRSS.class);
%>
<%-- Source ------------------------------------------------------------ --%>
<jalios:field name="source" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<% if(!formHandler.isPartialFieldEdition()) { %>
  <ul class="nav nav-tabs">
    <li class='active'><a href="#PortletRSS_display_tab" onclick="return false;"><%= formHandler.getTabLabel("display") %></a></li>
    <li><a href="#PortletRSS_update_tab" onclick="return false;"><%= formHandler.getTabLabel("update") %></a></li>
    <li><a href="#PortletRSS_items_tab" onclick="return false;"><%= formHandler.getTabLabel("items") %></a></li>
    
  </ul>
<% } %>
<div<%= !formHandler.isPartialFieldEdition() ? " class='tab-content jalios-tab-template clearfix'" : "" %>><div id="PortletRSS_display_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane active'" : "" %>>
<%-- ShowTitle ------------------------------------------------------------ --%>
<jalios:field name="showTitle" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowDescription ------------------------------------------------------------ --%>
<jalios:field name="showDescription" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowImage ------------------------------------------------------------ --%>
<jalios:field name="showImage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowWebMastersEmail ------------------------------------------------------------ --%>
<jalios:field name="showWebMastersEmail" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowItemsDescription ------------------------------------------------------------ --%>
<jalios:field name="showItemsDescription" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- OpenLinksInNewWindow ------------------------------------------------------------ --%>
<jalios:field name="openLinksInNewWindow" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- TrackingEnabled ------------------------------------------------------------ --%>
<jalios:field name="trackingEnabled" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="PortletRSS_update_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- Refresh ------------------------------------------------------------ --%>
<jalios:field name="refresh" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="PortletRSS_items_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- MaxItems ------------------------------------------------------------ --%>
<jalios:field name="maxItems" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- SkipFirstItems ------------------------------------------------------------ --%>
<jalios:field name="skipFirstItems" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div>
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
 
</div><%-- End 'tab-content' --%>
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletRSS.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- tRquPPitUfrXS97rEodvaw== --%>