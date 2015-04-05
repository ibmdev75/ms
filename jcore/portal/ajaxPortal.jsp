<%@ include file='/jcore/doInitPage.jspf' %><%
%><jalios:include target="AJAX_PORTAL" targetContext="empty"/><%
  
  displayPortlet = (PortalElement) request.getAttribute("displayPortlet");
  if (displayPortlet == null) {
    displayPortlet = getDataParameter("portletId", PortalElement.class);
  }
  
  String usage = getStringParameter("usage", null, HttpUtil.TEMPLATEUSAGE_REGEX);
  if(usage != null){
    jcmsContext.setTemplateUsage(usage);
  }

  request.setAttribute("storeBufferForContainer", Boolean.TRUE);
  
%><%@ include file='/jcore/portal/doIncludePortlet.jspf' %><%

  Object storeBufferForContainer = request.getAttribute("storeBufferForContainer");
  if (storeBufferForContainer == Boolean.TRUE){ 
    jcmsContext.sendForbidden();
    return;
  }
  
  String redirect = (String) request.getAttribute("redirect");
  if (Util.notEmpty(redirect)){
    sendRedirect(redirect, request, response);
    return;
  }
  
  out.println(Util.getString(storeBufferForContainer, ""));

%><div class="ajax-lazy-load"><%@ include file='/jcore/doAjaxFooter.jspf' %></div>