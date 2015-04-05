<%@page import="com.jalios.jcms.taglib.settings.SelectorSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.SelectorSettings.SelectorType"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%

// Force to be required to prevent blank value in select tag multivalued, except boolean multivalued to not retrieve a value on all inputs
fieldRequired = !Util.toBoolean(request.getAttribute(FieldTag.FIELD_MULTIVALUED), false);

SelectorType selectorType = getOption(SelectorSettings.SELECTOR_TYPE, SelectorType.RADIO);

if(SelectorSettings.SelectorType.SELECT.equals(selectorType)) {
  %><%@ include file="/jcore/field/control/doSelect.jspf" %><%
} else {
  %><%@ include file="/jcore/field/control/doRadio.jspf" %><%
}
%>