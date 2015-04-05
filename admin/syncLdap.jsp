<%--
  @Summary: Synchronize LDAP account
  @Category: Admin / Channel
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-4.0
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.ldap.SyncLdapHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

  formHandler.validate();

%>