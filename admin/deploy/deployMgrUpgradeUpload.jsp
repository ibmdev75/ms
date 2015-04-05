<%@ page import="com.jalios.io.*" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id="uploadHandler" scope="page" class="com.jalios.jcms.handler.DeployManagerUpgradeUploadHandler"> 
  <jsp:setProperty name="uploadHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="uploadHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name='uploadHandler' property='*' />
</jsp:useBean>
<% uploadHandler.validate(); %>
