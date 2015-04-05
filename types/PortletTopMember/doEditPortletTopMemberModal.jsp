<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletTopMember modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletTopMemberHandler formHandler = (EditPortletTopMemberHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletTopMember.class);
%>
<%-- TitleText ------------------------------------------------------------ --%>
<jalios:field name="titleText" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- MaxResults ------------------------------------------------------------ --%>
<jalios:field name="maxResults" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletTopMember_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinableModal.jsp" />
</div>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- N2Z5C0MnI47B5bbvyOtYoA== --%>