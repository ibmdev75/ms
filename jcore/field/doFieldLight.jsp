<%@ include file='/jcore/doInitPage.jspf' %><%

Map<String, String[]> valueMap = (Map<String, String[]>) getIncludeObject("values",null);
Map<String, String[]> bodyMap = (Map<String, String[]>) getIncludeObject("bodies",null);

boolean isTab = Util.toBoolean(getIncludeString("isTab", null), false);  
boolean isMulti = Util.toBoolean(getIncludeString("isMulti", null), false);
boolean isRequired = Util.toBoolean(getIncludeString("isRequired", null), false);
boolean isDisabled = Util.toBoolean(getIncludeString("isDisabled", null), false);
boolean isKeyword = Util.toBoolean(getIncludeString("isKeyword", null), false);

String errorMessage = getIncludeString("errorMessage", null);

String fieldId = getIncludeString("fieldId", null);

String css = getIncludeString("css", "") + (isRequired ? " required" : "") + (isDisabled ? " disabled" : "") + (isKeyword  ? " keyword"  : "");

// Language
for (Map.Entry<String, String[]> itEntry : bodyMap.entrySet()) {
  String   lang   = itEntry.getKey();
  String[] bodies = itEntry.getValue();

  if (Util.notEmpty(bodies)) {
    int length = isMulti ?  bodies.length : 1;
    boolean isList = length > 1;
    String tag   = isList ? "li" : "div";
    String clazz = isList ? "" : lang;
    
    // List
    for (int i = 0 ; i < length ; i++) {
      String tabId  = isTab ? "id='tab_" + fieldId + "_" + lang + "_" + i + "'" : "";
	  %><<%= tag %> <%= tabId %> class="widget widget-light input-group tab-pane jalios-input-group <%= css %>">
        <% if(Util.notEmpty(errorMessage)) { %><jalios:message level="<%= MessageLevel.WARN %>" msg="<%= errorMessage %>" /> <% } %>
	    <% if (isKeyword) { %><div class="jalios-input-keyword"><%= bodies[i] %></div>
        <% } else { %><%= bodies[i] %><% } %>
	    </<%= tag %>><%
    }
  }
}
%>