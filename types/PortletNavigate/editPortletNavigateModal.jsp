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
  %><jsp:setProperty name="extFormHandler" property="noRedirect" value="true" /><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
%><% request.setAttribute("formHandler", formHandler); %><%
%><% if (formHandler.validate()) {
  request.setAttribute("modal.redirect", formHandler.getPublication().getDisplayUrl(userLocale)); %><%
%><%@ include file="/jcore/modal/modalRedirect.jspf" %><% return; } %><%
%><% formHandler.prepare(); %>
<jalios:modal formHandler="<%= formHandler %>" url="types/PortletNavigate/editPortletNavigateModal.jsp">
<div class="row PortletNavigate">
	<%-- Title ------------------------------------------------------------ --%>
	<% if (formHandler.isFieldEdition("title")) { %>
	
    <% TypeEntry titleTE = channel.getTypeEntry(formHandler.getPublicationClass()); %>
    <jalios:field name="title" formHandler="<%= formHandler %>">
      <jalios:control /> 
    </jalios:field>
	<% } %>
	<jalios:include jsp="types/PortletNavigate/doEditPortletNavigateModal.jsp" />
</div>
</jalios:modal>
<% 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  itRemoveCat = channel.getCategory("j_3");
  if (itRemoveCat != null){	removedCatSet.add(itRemoveCat);  }
  request.setAttribute("removedCatSet", removedCatSet);
%>
  <%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- ywcmKlFYuSr0RuCddvFROQ== --%>