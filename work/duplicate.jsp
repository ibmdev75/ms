<%--
  @Summary: Duplicate a publication
  @Category: Work Area / Data
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-3.0
--%><%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file='/jcore/doInitPage.jspf' %><% 

//---------------------------------------------------------------
// CHECK PARAMETERS
//---------------------------------------------------------------

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

if (JcmsUtil.checkDataWriteDisabled(request, response, "work/doWorkMsg.jsp", userLang)) {
  return;
}
Publication pub = getPublicationParameter("id");
if (pub == null) {
  sendForbidden(request, response);
  return;
}

boolean isPopupEdition = getBooleanParameter("popupEdition", false);

//---------------------------------------------------------------
// DUPLICATE
//---------------------------------------------------------------

Publication copy = null;
String action = getAlphaNumParameter("action", null);

// Copy or Work Copy?
if ("work".equals(action)){
  copy = pub.createWorkCopy(loggedMember);
} else {
  copy = pub.createCopy(loggedMember);
}

// Check operation success
if (copy == null){
  // canCreate[Work]Copy returned false, redirect to sendForbidden
  if (Util.isEmpty(request.getSession().getAttribute(JcmsConstants.WARNING_MSG))) {
    sendForbidden(request, response);
    return;
  }
  // integrity error, redirect to error page 
  if (isPopupEdition) {
    sendRedirect("front/displayMessageBox.jsp", request, response);
  } else {
    sendRedirect("work/", request, response);
  }
  return;
}


// Redirect
String redirect = ServletUtil.getBaseUrl(request) + "edit.jsp?id=" + copy.getId();
if (isPopupEdition) {
  redirect += "&popupEdition=true";
}
boolean redirectOnClosePopup = getBooleanParameter("redirectOnClosePopup", false);
if (redirectOnClosePopup) {
  redirect += "&redirectOnClosePopup=true";
}
boolean redirectToCopyPreview = getBooleanParameter("redirectToCopyPreview", false);
if (redirectToCopyPreview) {
  String editFormRedirect = ServletUtil.getBaseUrl(request) + JcmsUtil.getDisplayUrl(copy, userLocale, "&preview=true", false);
  redirect += "&redirect=" + ServletUtil.encodeURL(editFormRedirect);
} else {
  String editFormRedirect = getValidHttpUrl("redirect");
  if (Util.notEmpty(editFormRedirect)) {
    redirect += "&redirect=" + ServletUtil.encodeURL(editFormRedirect);
  }
}


sendRedirect(redirect, request, response);
%>
