<%@ include file='/jcore/doInitPage.jspf' %>
<%
  boolean isSpan = getBooleanParameter("span",false);
  if (isSpan){ 
    out.println("&nbsp;");  return;
  }
  
  Data data  = getDataParameter("pid");
  if (data == null){ return; }
  
  // Set the Portlet
  request.setAttribute("displayPortlet", data);

  String cssClass = getUntrustedStringParameter("class", null);
  String cssStyle = getUntrustedStringParameter("style", null);
  
  cssClass = cssClass != null ? "class=\""+encodeForHTMLAttribute(cssClass)+"\""   : "";
  cssStyle = cssStyle != null ? "style=\""+encodeForHTMLAttribute(cssStyle)+"\""   : "";
%>
<div <%= cssClass %> <%= cssStyle %>>
<jsp:include page="/jcore/portal/ajaxPortal.jsp" flush="true" />
</div>