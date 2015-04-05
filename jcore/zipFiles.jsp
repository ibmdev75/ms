<%@ page import="com.jalios.jcms.*, com.jalios.util.*, com.jalios.io.*, com.jalios.jstore.*, java.io.*, java.util.*" %><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.ZipFilesHandler"><%
 %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
 %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
 %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

  formHandler.validate();

%>