<%@page import="com.jalios.jcms.taglib.settings.ControlSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.SelectorSettings"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
Object[] langValues = (Object[]) getOption(SelectorSettings.ENUM_VALUES, null); 

if(langValues != null) {
  List<String> labels = new ArrayList<String>();
  for (int i = 0; i < langValues.length; i++) { 
    String value = langValues[i].toString();
    String label = glp("lang." + value);
    %><jalios:buffer name="labelwithLanguage"><jalios:lang lang="<%= value %>" /> <%= label %></jalios:buffer><%
    labels.add(labelwithLanguage);
  }
  addOption(SelectorSettings.ENUM_LABELS, labels.toArray(new String[] {}));
}
%><%
%><%@ include file="/jcore/field/control/doEnumerate.jspf" %>
