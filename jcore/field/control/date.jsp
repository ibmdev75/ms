<%@page import="com.jalios.jcms.taglib.settings.impl.DateSettings"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
addOption(BasicSettings.HTML_ATTRIBUTES, "data-jalios-action=\"chooser:date\" data-jalios-event=\"click\" " + getOption(BasicSettings.HTML_ATTRIBUTES, ""));
addOption(AbstractChooserSettings.CHOOSER_NAME, "date");

if (!"en".equals(userLang)) {
  String jsLang = channel.getProperty("datepicker.languagekey-mapping." + userLang, userLang);
  jcmsContext.addJavaScript("js/lib/datetimepicker/locales/bootstrap-datetimepicker." + jsLang + ".js");
}

boolean displayTime = getOption(DateSettings.DISPLAY_TIME, false);

// Set CSS for datetime
if (displayTime) {
  // Store the CSS to add on the field container
  String css = getIncludeString(FieldTag.FIELD_CONTROL_CSS, "");
  setIncludeString(FieldTag.FIELD_CONTROL_CSS, (Util.notEmpty(css) ? css + " " : "") + "jalios-date-time");
}

// 'broker': trigger the 'click' event
// 'no-focus': prevent to display the picker when the tabs has been changed
addOption(BasicSettings.CSS, "broker no-focus " + getOption(BasicSettings.CSS, ""));

// Compute Date
if (Util.notEmpty(fieldValue)) {
  SimpleDateFormat sdf = channel.getDateFormat(userLang);
  if (displayTime) {
    sdf = channel.getDateTimeFormat(userLang);
  }
  fieldValue = sdf.format(new Date(Util.toLong(fieldValue, 0)));
}

includeLocalObject("APPEND_CLEAR_BUTTON", true);
%><%
%><%@ include file="/jcore/field/control/doText.jspf" %>