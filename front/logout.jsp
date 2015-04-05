<%--
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Summary: Logout process page
  @Category: Authentication
--%><%@ include file='/jcore/doInitPage.jspf' %><%

%><%@page import="com.jalios.jcms.authentication.AuthenticationManager"%><%
%><%@page import="com.jalios.jcms.authentication.handlers.DelegationAuthenticationHandler"%><%

  // Logout
  AuthenticationManager authMgr = channel.getAuthMgr();
  if (authMgr != null) {
    authMgr.logout(request, response, userLocale, loggedMember);
  }
  
%>