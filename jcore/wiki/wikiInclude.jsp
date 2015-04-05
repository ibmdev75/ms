<%@ include file='/jcore/doInitPage.jspf' %><%

  Publication pub  = getPublicationParameter("pub");
  if (pub == null || !pub.canBeReadBy(loggedMember)) {
    return;
  }
  
  boolean isSpan = getBooleanParameter("span",false);
  if (isSpan){ 
%><jalios:link data="<%= pub %>" /><%
    return;
  }

  String cssClass = getUntrustedStringParameter("class", null);
  String cssStyle = getUntrustedStringParameter("style", null);
  
  cssClass = cssClass != null ? "class=\""+encodeForHTMLAttribute(cssClass)+"\""   : "";
  cssStyle = cssStyle != null ? "style=\""+encodeForHTMLAttribute(cssStyle)+"\""   : "";
%>
<div <%= cssClass %> <%= cssStyle %>><jalios:include pub="<%= pub %>" usage="wiki"/></div>
<div class="ajax-lazy-load"><%@ include file='/jcore/doAjaxFooter.jspf' %></div>