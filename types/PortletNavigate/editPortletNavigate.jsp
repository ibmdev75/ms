<%-- This file was automatically generated. --%><%
%><%--
  @Summary: PortletNavigate editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditPortletNavigateHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
%><% request.setAttribute("formHandler", formHandler); %><%
%><%@ include file='/work/doEditPubHeader.jspf' %>
<div class="container-fluid">
  <div class="row PortletNavigate">
    <jalios:include jsp="types/PortletNavigate/doEditPortletNavigate.jsp" />
  </div>
</div>
<% 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  itRemoveCat = channel.getCategory("j_3");
  if (itRemoveCat != null){	removedCatSet.add(itRemoveCat);  }
  request.setAttribute("removedCatSet", removedCatSet);
  %>
  
<%@ include file='/work/doEditPubFooter.jspf' %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- ZgRE8ARAP8Xq1En6jUVfcQ== --%>