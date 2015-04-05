<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletSelection modal content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletSelectionHandler formHandler = (EditPortletSelectionHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletSelection.class);
%>
<%-- ShowDisplayHeaderFooter ------------------------------------------------------------ --%>
<jalios:field name="showDisplayHeaderFooter" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
</div><div id="PortletSelection_super_tab" class="clearfix separator">
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractCollection/doEditAbstractCollectionModal.jsp" />
</div>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- MVrDa2bKEMvBV/AuC1lULA== --%>