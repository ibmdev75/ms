<%@ include file='/jcore/doInitPage.jspf' %>
<%
// jcmsContext.addCSSHeader("css/lib/menu/jquery.multilevelpushmenu.css");
jcmsContext.addCSSHeader("css/jalios/core/jalios-menu-slide.css");
jcmsContext.addJavaScript("js/lib/menu/jquery.multilevelpushmenu.js");
jcmsContext.addJavaScript("js/jalios/core/jalios-menu-slide.js");
%>
<div class='jalios-menu jalios-menu-slide <%= getIncludeString("name", "") %> <%= getIncludeString("css", "") %>'>
  <%= getIncludeBody() %>
</div>