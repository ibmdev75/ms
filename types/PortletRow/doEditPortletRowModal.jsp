<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletRow modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletRowHandler formHandler = (EditPortletRowHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletRow.class);
%>
<ul class="nav nav-tabs">
<li ><a href="#PortletRow_width_tab" onclick="return false;"><%= formHandler.getTabLabel("width") %></a></li>
<li ><a href="#PortletRow_align_horizontal_tab" onclick="return false;"><%= formHandler.getTabLabel("align_horizontal") %></a></li>
<li ><a href="#PortletRow_align_vertical_tab" onclick="return false;"><%= formHandler.getTabLabel("align_vertical") %></a></li>
<li ><a href="#PortletRow_background_color_tab" onclick="return false;"><%= formHandler.getTabLabel("background_color") %></a></li>
<li ><a href="#PortletRow_background_image_tab" onclick="return false;"><%= formHandler.getTabLabel("background_image") %></a></li>
<li ><a href="#PortletRow_background_repeat__tab" onclick="return false;"><%= formHandler.getTabLabel("background_repeat_") %></a></li>
</ul>
<%-- RowSpacing ------------------------------------------------------------ --%>
<jalios:field name="rowSpacing" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<div class="tab-content jalios-tab-template clearfix"><div id="PortletRow_width_tab" class='tab-pane '>
<%-- CellWidth ------------------------------------------------------------ --%>
<jalios:field name="cellWidth" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletRow_align_horizontal_tab" class='tab-pane '>
<%-- AlignHorizontal ------------------------------------------------------------ --%>
<jalios:field name="alignHorizontal" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletRow_align_vertical_tab" class='tab-pane '>
<%-- AlignVertical ------------------------------------------------------------ --%>
<jalios:field name="alignVertical" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletRow_background_color_tab" class='tab-pane '>
<%-- BackgroundColor ------------------------------------------------------------ --%>
<jalios:field name="backgroundColor" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletRow_background_image_tab" class='tab-pane '>
<%-- BackgroundImage ------------------------------------------------------------ --%>
<jalios:field name="backgroundImage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletRow_background_repeat__tab" class='tab-pane '>
<%-- BackgroundRepeat ------------------------------------------------------------ --%>
<jalios:field name="backgroundRepeat" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div>
</div><div id="PortletRow_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractCollection/doEditAbstractCollectionModal.jsp" />
</div>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- kBYdmGsK5qg/1PUf6Mb+UQ== --%>