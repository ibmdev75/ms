<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletQueryForeach modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletQueryForeachHandler formHandler = (EditPortletQueryForeachHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletQueryForeach.class);
%>
<ul class="nav nav-tabs">
<li class='active'><a href="#PortletQueryForeach_query_tab" onclick="return false;"><%= formHandler.getTabLabel("query") %></a></li>
<li ><a href="#PortletQueryForeach_sort_tab" onclick="return false;"><%= formHandler.getTabLabel("sort") %></a></li>
<li ><a href="#PortletQueryForeach_foreach_tab" onclick="return false;"><%= formHandler.getTabLabel("foreach") %></a></li>
<li ><a href="#PortletQueryForeach_pager_tab" onclick="return false;"><%= formHandler.getTabLabel("pager") %></a></li>
<li ><a href="#PortletQueryForeach_advanced_tab" onclick="return false;"><%= formHandler.getTabLabel("advanced") %></a></li>
</ul>
<div class="tab-content jalios-tab-template clearfix"><div id="PortletQueryForeach_query_tab" class='tab-pane active'>
<%-- SearchInDB ------------------------------------------------------------ --%>
<jalios:field name="searchInDB" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Queries ------------------------------------------------------------ --%>
<jalios:field name="queries" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- RefineQueries ------------------------------------------------------------ --%>
<jalios:field name="refineQueries" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- RefineWithContextualCategories ------------------------------------------------------------ --%>
<jalios:field name="refineWithContextualCategories" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletQueryForeach_sort_tab" class='tab-pane '>
<%-- OrderBy ------------------------------------------------------------ --%>
<jalios:field name="orderBy" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ReverseOrder ------------------------------------------------------------ --%>
<jalios:field name="reverseOrder" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletQueryForeach_foreach_tab" class='tab-pane '>
<%-- MaxResults ------------------------------------------------------------ --%>
<jalios:field name="maxResults" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- SkipFirstResults ------------------------------------------------------------ --%>
<jalios:field name="skipFirstResults" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletQueryForeach_pager_tab" class='tab-pane '>
<%-- ShowPager ------------------------------------------------------------ --%>
<jalios:field name="showPager" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- PagerLabel ------------------------------------------------------------ --%>
<jalios:field name="pagerLabel" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- PageSizes ------------------------------------------------------------ --%>
<jalios:field name="pageSizes" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- PagerAllLimit ------------------------------------------------------------ --%>
<jalios:field name="pagerAllLimit" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletQueryForeach_advanced_tab" class='tab-pane '>
<%-- HideWhenNoResults ------------------------------------------------------------ --%>
<jalios:field name="hideWhenNoResults" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- FirstPublications ------------------------------------------------------------ --%>
<jalios:field name="firstPublications" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ShowInCurrentPortal ------------------------------------------------------------ --%>
<jalios:field name="showInCurrentPortal" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ContextCategory ------------------------------------------------------------ --%>
<jalios:field name="contextCategory" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div>
</div><div id="PortletQueryForeach_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinableModal.jsp" />
</div>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- bGmUnnTuwBfsRrFrKGuuIA== --%>