<%@ include file='/jcore/doInitPage.jspf' %>
<%!
String getToggledClass(String propValue) {
  String styleClass = propValue;
  
  if(styleClass == null) {
    return "";
  }

  int idx = styleClass.lastIndexOf(':');
  if(idx >= 0) { // Remove [type]: (eg. glyph:)
    styleClass = styleClass.substring(idx + 1);
    idx = styleClass.lastIndexOf(' ');
    if(idx >= 0) { // Get the last class to ignore 'glyphicon', 'halflings' ...
      styleClass = styleClass.substring(idx + 1);
    }
  }

  return styleClass;
}
%>
<%
jcmsContext.addCSSHeader("css/jalios/core/jalios-menu-vertical.css");
jcmsContext.addJavaScript("js/jalios/core/jalios-menu-vertical.js");

String collapseClass = getToggledClass(channel.getProperty("icon.accordion-collapse"));
String expandClass = getToggledClass(channel.getProperty("icon.accordion-expand"));
%>
<div id="<%= getIncludeString("id", "") %>" class='jalios-menu jalios-menu-vertical <%= getIncludeString("name", "") %> <%= getIncludeString("css", "") %>' data-jalios-collapse-toggle="<%= collapseClass %> <%= expandClass %>">
  <div class="list-group panel">
    <%= getIncludeBody() %>
  </div>
</div>
