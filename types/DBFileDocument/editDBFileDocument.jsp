<%--
  @Summary: FileDocument editor
  @Category: Customized
  @Author: Olivier Dedieu
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.EditDBFileDocumentHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

%><%@ include file='/work/doEditPubHeader.jspf' %>


<% request.setAttribute("formHandler", formHandler); %>
<div class="row DBFileDocument">
<jsp:include page="doEditDBFileDocument.jsp" />
</div>


<%@ include file='/work/doEditPubFooter.jspf' %>
