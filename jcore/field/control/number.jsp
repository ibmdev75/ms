<%@page import="com.jalios.jcms.taglib.settings.impl.NumberSettings"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
Class<? extends Number> numberType = getOption(NumberSettings.TYPE, int.class);
String currentCss = getOption(BasicSettings.CSS, "");
currentCss = "numeric " + numberType.getSimpleName() + (Util.notEmpty(currentCss) ? " " + currentCss : "");
addOption(BasicSettings.CSS, currentCss);

// addOption(BasicSettings.HTML_ATTRIBUTES, "data-jalios-validation='{\"required\": \"true\", \"number\": \"true\"}' " + getOption(BasicSettings.HTML_ATTRIBUTES, ""));
addOption(BasicSettings.HTML_ATTRIBUTES, "data-jalios-validation='number' " + getOption(BasicSettings.HTML_ATTRIBUTES, ""));
%><%
%><%@ include file="/jcore/field/control/doText.jspf" %>