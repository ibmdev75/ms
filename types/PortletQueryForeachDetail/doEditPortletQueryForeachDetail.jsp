<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletQueryForeachDetail content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletQueryForeachDetailHandler formHandler = (EditPortletQueryForeachDetailHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletQueryForeachDetail.class);
%>
<% if(!formHandler.isPartialFieldEdition()) { %>
  <ul class="nav nav-tabs">
    <li class='active'><a href="#PortletQueryForeachDetail_common_tab" onclick="return false;"><%= formHandler.getTabLabel("common") %></a></li>
    <li><a href="#PortletQueryForeachDetail_technical_tab" onclick="return false;"><%= formHandler.getTabLabel("technical") %></a></li>
    
  </ul>
<% } %>
<div<%= !formHandler.isPartialFieldEdition() ? " class='tab-content jalios-tab-template clearfix'" : "" %>><div id="PortletQueryForeachDetail_common_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane active'" : "" %>>
<%-- ShowTitle ------------------------------------------------------------ --%>
<jalios:field name="showTitle" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowAbstract ------------------------------------------------------------ --%>
<jalios:field name="showAbstract" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowAuthor ------------------------------------------------------------ --%>
<jalios:field name="showAuthor" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowCategories ------------------------------------------------------------ --%>
<jalios:field name="showCategories" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowDate ------------------------------------------------------------ --%>
<jalios:field name="showDate" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="PortletQueryForeachDetail_technical_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- ShowStatus ------------------------------------------------------------ --%>
<jalios:field name="showStatus" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowType ------------------------------------------------------------ --%>
<jalios:field name="showType" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowRights ------------------------------------------------------------ --%>
<jalios:field name="showRights" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- ShowId ------------------------------------------------------------ --%>
<jalios:field name="showId" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div>
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/PortletQueryForeach/doEditPortletQueryForeach.jsp" />
 
</div><%-- End 'tab-content' --%>
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletQueryForeachDetail.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- k3u2p7dQJqG8QpLBYkKmUg== --%>