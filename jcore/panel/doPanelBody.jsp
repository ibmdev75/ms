<%@ include file='/jcore/doInitPage.jspf' %>
<%
String css = getIncludeString("css", null);
css = Util.notEmpty(css) ? " " + css : "";

String style = getIncludeString("style", null);
style = Util.notEmpty(style) ? " style=\"" + style + "\"" : "";
%>
<div class="panel-body responsive<%= css %>"<%= style %>>
  <%= getIncludeBody() %>
</div>