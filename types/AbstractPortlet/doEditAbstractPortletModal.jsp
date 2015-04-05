<%-- This file has been automatically generated. --%>
<%--
  @Summary: AbstractPortlet modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditAbstractPortletHandler formHandler = (EditAbstractPortletHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.AbstractPortlet.class);
%>
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
<%-- DisplayCSS ------------------------------------------------------------ --%>
<jalios:field name="displayCSS" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Width ------------------------------------------------------------ --%>
<jalios:field name="width" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- InsetLeft ------------------------------------------------------------ --%>
<jalios:field name="insetLeft" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- InsetRight ------------------------------------------------------------ --%>
<jalios:field name="insetRight" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- InsetTop ------------------------------------------------------------ --%>
<jalios:field name="insetTop" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- InsetBottom ------------------------------------------------------------ --%>
<jalios:field name="insetBottom" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- CellPadding ------------------------------------------------------------ --%>
<jalios:field name="cellPadding" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- AlignH ------------------------------------------------------------ --%>
<jalios:field name="alignH" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- AlignV ------------------------------------------------------------ --%>
<jalios:field name="alignV" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- AlignTable ------------------------------------------------------------ --%>
<jalios:field name="alignTable" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Border ------------------------------------------------------------ --%>
<jalios:field name="border" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- BorderColor ------------------------------------------------------------ --%>
<jalios:field name="borderColor" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- BackColor ------------------------------------------------------------ --%>
<jalios:field name="backColor" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- BackImage ------------------------------------------------------------ --%>
<jalios:field name="backImage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- BehaviorCopy ------------------------------------------------------------ --%>
<jalios:field name="behaviorCopy" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- OriginalPortlet ------------------------------------------------------------ --%>
<jalios:field name="originalPortlet" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Condition ------------------------------------------------------------ --%>
<jalios:field name="condition" formHandler="<%= formHandler %>">
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
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- pd4rtIWWqPDWoZqCO85QhA== --%>