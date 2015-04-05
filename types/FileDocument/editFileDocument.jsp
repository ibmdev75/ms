<%--
  @Summary: FileDocument editor
  @Category: Customized
  @Author: Olivier Dedieu
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

%><jsp:useBean id="extFormHandler" scope="page" class="generated.EditFileDocumentExtensionHandler"><%
  %><jsp:setProperty name="extFormHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="extFormHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="extFormHandler" property="*" /><%
%></jsp:useBean><%

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.EditFileDocumentHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
  %><jsp:setProperty name="formHandler" property="extFormHandler" value="<%= extFormHandler %>"/><%
%></jsp:useBean><%

%><%@ include file='/work/doEditPubHeader.jspf' %>

<% request.setAttribute("formHandler", formHandler); %>
<div class="container-fluid">
  <div class="row FileDocument">
    <jsp:include page="doEditFileDocument.jsp" />
  </div>
</div>

<%@ include file='/work/doEditPubFooter.jspf' %>
