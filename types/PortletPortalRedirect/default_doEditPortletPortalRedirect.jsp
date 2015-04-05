<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletPortalRedirect content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletPortalRedirectHandler formHandler = (EditPortletPortalRedirectHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletPortalRedirect.class);
%>
<% if(!formHandler.isPartialFieldEdition()) { %>
  <ul class="nav nav-tabs">
    <li class='active'><a href="#PortletPortalRedirect_redirection_tab" onclick="return false;"><%= formHandler.getTabLabel("redirection") %></a></li>
    <li><a href="#PortletPortalRedirect_categories_tab" onclick="return false;"><%= formHandler.getTabLabel("categories") %></a></li>
    
  </ul>
<% } %>
<div<%= !formHandler.isPartialFieldEdition() ? " class='tab-content jalios-tab-template clearfix'" : "" %>><div id="PortletPortalRedirect_redirection_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane active'" : "" %>>
<%-- Status ------------------------------------------------------------ --%>
<jalios:field name="status" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Content ------------------------------------------------------------ --%>
<jalios:field name="content" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- RedirectForm ------------------------------------------------------------ --%>
<jalios:field name="redirectForm" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Url ------------------------------------------------------------ --%>
<jalios:field name="url" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- RedirectPortlet ------------------------------------------------------------ --%>
<jalios:field name="redirectPortlet" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Category ------------------------------------------------------------ --%>
<jalios:field name="category" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- DispPortal ------------------------------------------------------------ --%>
<jalios:field name="dispPortal" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div>
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- PortletImage ------------------------------------------------------------ --%>
<jalios:field name="portletImage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- CacheType ------------------------------------------------------------ --%>
<jalios:field name="cacheType" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- CacheSensibility ------------------------------------------------------------ --%>
<jalios:field name="cacheSensibility" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- InvalidClass ------------------------------------------------------------ --%>
<jalios:field name="invalidClass" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- InvalidTime ------------------------------------------------------------ --%>
<jalios:field name="invalidTime" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- BehaviorCopy ------------------------------------------------------------ --%>
<jalios:field name="behaviorCopy" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- CssId ------------------------------------------------------------ --%>
<jalios:field name="cssId" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- CssClasses ------------------------------------------------------------ --%>
<jalios:field name="cssClasses" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<div<%= !formHandler.isPartialFieldEdition() ? " class='tab-content jalios-tab-template clearfix'" : "" %>><div id="PortletPortalRedirect_categories_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- NavCategories ------------------------------------------------------------ --%>
<jalios:field name="navCategories" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div>
<%-- ExactCategory ------------------------------------------------------------ --%>
<jalios:field name="exactCategory" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><%-- End 'tab-content' --%>
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  itRemoveCat = channel.getCategory("j_3");
  if (itRemoveCat != null){ removedCatSet.add(itRemoveCat);  }
  request.setAttribute("PortletPortalRedirect.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- LPbqgMVl9imauROYTiOiZQ== --%>