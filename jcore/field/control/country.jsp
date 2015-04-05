<%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
String lblValue = Util.notEmpty(fieldValue) ? glp("country." + fieldValue) : "";
includeLocalObject("fieldValueDisplay", lblValue);

String flag = Util.notEmpty(fieldValue) ? fieldValue + "-flag" : "";
addOption(BasicSettings.CSS, "iso3166chooser " + flag + " " + getOption(BasicSettings.CSS, ""));
%><%
%><%@ include file="/jcore/field/control/doData.jspf" %>