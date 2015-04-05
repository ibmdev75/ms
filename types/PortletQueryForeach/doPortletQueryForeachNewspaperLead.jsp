<%--
  @Summary: Newspaper template for editorial Publications (with first Lead)
  @Category: Template
  @Author: Sylvain DEVAUX
  @Customizable: True
  @Requestable: False
  @Since: jcms-9.0.1
--%>
<%@ page contentType="text/html; charset=UTF-8" %><%

%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file="/jcore/portal/doPortletParams.jspf" %><%

String delegateJSP = "/types/PortletQueryForeach/doPortletQueryForeachNewspaper.jsp";

request.setAttribute("pqf-newspaper-first-lead", Boolean.TRUE);
%>
<jsp:include page="<%= delegateJSP %>" flush="true" />
<%
request.removeAttribute("pqf-newspaper-first-lead");
%>
