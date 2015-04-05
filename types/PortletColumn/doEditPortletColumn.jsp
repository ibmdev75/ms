<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletColumn content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletColumnHandler formHandler = (EditPortletColumnHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletColumn.class);
%>
<%-- ColSpacing ------------------------------------------------------------ --%>
<jalios:field name="colSpacing" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<% if(!formHandler.isPartialFieldEdition()) { %>
  <ul class="nav nav-tabs">
    <li class='active'><a href="#PortletColumn_align_horizontal_tab" onclick="return false;"><%= formHandler.getTabLabel("align_horizontal") %></a></li>
    <li><a href="#PortletColumn_align_vertical_tab" onclick="return false;"><%= formHandler.getTabLabel("align_vertical") %></a></li>
    <li><a href="#PortletColumn_background_color_tab" onclick="return false;"><%= formHandler.getTabLabel("background_color") %></a></li>
    <li><a href="#PortletColumn_background_image_tab" onclick="return false;"><%= formHandler.getTabLabel("background_image") %></a></li>
    <li><a href="#PortletColumn_background_repeat_tab" onclick="return false;"><%= formHandler.getTabLabel("background_repeat") %></a></li>
    
  </ul>
<% } %>
<div<%= !formHandler.isPartialFieldEdition() ? " class='tab-content jalios-tab-template clearfix'" : "" %>><div id="PortletColumn_align_horizontal_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane active'" : "" %>>
<%-- AlignHorizontal ------------------------------------------------------------ --%>
<jalios:field name="alignHorizontal" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="PortletColumn_align_vertical_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- AlignVertical ------------------------------------------------------------ --%>
<jalios:field name="alignVertical" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="PortletColumn_background_color_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- BackgroundColor ------------------------------------------------------------ --%>
<jalios:field name="backgroundColor" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="PortletColumn_background_image_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- BackgroundImage ------------------------------------------------------------ --%>
<jalios:field name="backgroundImage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="PortletColumn_background_repeat_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- BackgroundRepeat ------------------------------------------------------------ --%>
<jalios:field name="backgroundRepeat" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div>
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractCollection/doEditAbstractCollection.jsp" />
 
</div><%-- End 'tab-content' --%>
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletColumn.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- rroabFzWKVJHCi0AB8lytg== --%>