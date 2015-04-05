<%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
jcmsContext.addJavaScript("js/lib/bootstrap-colorpicker.js");
addOption(BasicSettings.HTML_ATTRIBUTES, "data-jalios-action=\"chooser:color\" " + getOption(BasicSettings.HTML_ATTRIBUTES, ""));
addOption(AbstractChooserSettings.CHOOSER_NAME, "color");

// Prevent to display the picker when the tabs has been changed
addOption(BasicSettings.CSS, "no-focus " + getOption(BasicSettings.CSS, ""));

includeLocalObject("APPEND_CLEAR_BUTTON", true);
%>
<span class="input-group-addon color-preview" style="background-color: <%= encodeForHTMLAttribute(fieldValue) %>"></span>
<%@ include file="/jcore/field/control/doText.jspf" %>