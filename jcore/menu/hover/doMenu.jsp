<%@ include file='/jcore/doInitPage.jspf' %>
<%
jcmsContext.addCSSHeader("css/jalios/core/jalios-menu-hover.css");
jcmsContext.addJavaScript("js/jalios/core/jalios-menu-hover.js");
%>
<div class='jalios-menu jalios-menu-hover <%= getIncludeString("name", "") %> <%= getIncludeString("css", "") %>'>
  <%= getIncludeBody() %>
</div>