<%@ include file="/jcore/doInitPage.jspf" %>
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
jcmsContext.addJavaScript("js/jalios/core/jalios-collapse.js");

String collapseClass = getToggledClass(channel.getProperty("icon.accordion-collapse"));
String expandClass = getToggledClass(channel.getProperty("icon.accordion-expand"));

String id = getIncludeString("id", null);
%>
<div<%= Util.notEmpty(id) ? " id='" + id + "'" : "" %> class="jalios-accordion panel-group <%= getIncludeString("css", "") %>" data-jalios-collapse-toggle="<%= collapseClass %> <%= expandClass %>">
  <%= getIncludeBody() %>
</div>