<%-- This file has been automatically generated. --%>
<%--
  @Summary: AbstractPortletStat modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditAbstractPortletStatHandler formHandler = (EditAbstractPortletStatHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.AbstractPortletStat.class);
%>
<%-- TabGroup ------------------------------------------------------------ --%>
<jalios:field name="tabGroup" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- DisplayTimeChart ------------------------------------------------------------ --%>
<jalios:field name="displayTimeChart" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- DisplayWeekChart ------------------------------------------------------------ --%>
<jalios:field name="displayWeekChart" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- DisplayAverage ------------------------------------------------------------ --%>
<jalios:field name="displayAverage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- RegExpFilter ------------------------------------------------------------ --%>
<jalios:field name="regExpFilter" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- TopTen ------------------------------------------------------------ --%>
<jalios:field name="topTen" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- FilteredArea ------------------------------------------------------------ --%>
<jalios:field name="filteredArea" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="AbstractPortletStat_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinableModal.jsp" />
</div>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- tmJ6+dNqUR/Q7fwh3ISdSw== --%>