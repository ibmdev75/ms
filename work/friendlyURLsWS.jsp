<%@ include file='/jcore/doInitPage.jspf' %><%

  if (!checkAccess("admin-ws/reporting/friendly-urls")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.FriendlyURLsHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="workspaceFilter" value="<%= true %>"/><%
%></jsp:useBean><%

  if (!formHandler.validate()){
    return;
  }
  request.setAttribute("adminReportingMenu", "true");

%><%@ include file='/work/doWorkHeader.jspf' %><%
%><%@ include file='/admin/doFriendlyURLs.jspf' %><%
%><%@ include file='/work/doWorkFooter.jspf' %>