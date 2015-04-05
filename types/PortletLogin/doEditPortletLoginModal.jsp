<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletLogin modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletLoginHandler formHandler = (EditPortletLoginHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletLogin.class);
%>
<%-- Introduction ------------------------------------------------------------ --%>
<jalios:field name="introduction" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- LoginText ------------------------------------------------------------ --%>
<jalios:field name="loginText" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- PasswordText ------------------------------------------------------------ --%>
<jalios:field name="passwordText" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- ButtonText ------------------------------------------------------------ --%>
<jalios:field name="buttonText" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- DisplayPortal ------------------------------------------------------------ --%>
<jalios:field name="displayPortal" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletLogin_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinableModal.jsp" />
</div>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- Tnl49VsnKdu/E4BBBrXqVQ== --%>