<%
  boolean isInPortletSelection = com.jalios.util.Util.toBoolean(request.getAttribute("isInPortletSelection"), false);
  if (isInPortletSelection) {
   %><jsp:include page='doPortletSearchFullDisplay.jsp' /><%
  } else {
   %><jsp:include page='doPortletLightSearchFullDisplay.jsp' /><%
  }
%>