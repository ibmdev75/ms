<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletNavigate content editor
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
<% if(!formHandler.isPartialFieldEdition()) { %>
  <ul class="nav nav-tabs">
    <li class='active'><a href="#PortletNavigate_general_tab" onclick="return false;"><%= formHandler.getTabLabel("general") %></a></li>
    <li><a href="#PortletNavigate_advanced_tab" onclick="return false;"><%= formHandler.getTabLabel("advanced") %></a></li>
    
  </ul>
<% } %>
<div<%= !formHandler.isPartialFieldEdition() ? " class='tab-content jalios-tab-template clearfix'" : "" %>><div id="PortletNavigate_general_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane active'" : "" %>>
<%-- RootCategory ------------------------------------------------------------ --%>
<jalios:field name="rootCategory" formHandler="<%= formHandler %>">
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
 
</div><div id="PortletNavigate_advanced_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- HideWhenNoResults ------------------------------------------------------------ --%>
<jalios:field name="hideWhenNoResults" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- NavigatePortlet ------------------------------------------------------------ --%>
<jalios:field name="navigatePortlet" formHandler="<%= formHandler %>">
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
  itRemoveCat = channel.getCategory("j_3");
  if (itRemoveCat != null){ removedCatSet.add(itRemoveCat);  }
  request.setAttribute("PortletNavigate.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- zMIBXIogqyxieW4KUfw8Wg== --%>