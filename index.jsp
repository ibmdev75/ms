<%
  // For Improvement JCMS-3078, set FrontOffice status to true
  request.setAttribute("inFO", Boolean.TRUE);

%><%@ include file='/jcore/doInitPage.jspf' %><% 

// SmallDevices (PDA, i-mode)
if (clientBrowser.isSmallDevice()) {
  String redirect = channel.getProperty("small-device.home."+clientBrowser.getBrowserName(), null);
  if (Util.isEmpty(redirect)){
    redirect = channel.getProperty("small-device.home", null);
  }
  if (Util.notEmpty(redirect)) {
    sendRedirect(redirect, request, response);
    return;
  }
}

// Go to the Index Root
Category homeCategory = PortalManager.getHomeCategory();
if (homeCategory != null){
  sendRedirect(JcmsUtil.getDisplayUrl(homeCategory, userLocale), request, response);
  return;
}

// No home category and !isAdmin, force login as Admin
if (!isAdmin){
  sendRedirect("admin/adminLogin.jsp?redirect=index.jsp", request, response);
  return;
}

// Go to properties to add a home category
setWarningMsgSession(glp("msg.no-home-cat"), request);
sendRedirect("admin/adminProperties.jsp", request, response);

%>