<%-- This file was automatically generated. --%><%
%><%--
  @Summary: GlossaryEntry editor
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditGlossaryEntryHandler'><%
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
<jalios:modal formHandler="<%= formHandler %>" url="types/GlossaryEntry/editGlossaryEntryModal.jsp">
<div class="row GlossaryEntry">
	<%-- Title ------------------------------------------------------------ --%>
	<% if (formHandler.isFieldEdition("title")) { %>
	
    <% TypeEntry titleTE = channel.getTypeEntry(formHandler.getPublicationClass()); %>
    <jalios:field name="title" formHandler="<%= formHandler %>">
      <jalios:control /> 
    </jalios:field>
	<% } %>
	<jalios:include jsp="types/GlossaryEntry/doEditGlossaryEntryModal.jsp" />
</div>
</jalios:modal>
<% 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("removedCatSet", removedCatSet);
%>
  <%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- Tr6dW3O65HELZbnOSi8HhQ== --%>