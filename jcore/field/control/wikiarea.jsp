<%@page import="com.jalios.jcms.taglib.settings.impl.WikiAreaSettings"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%!
String printWikiToolbar(JcmsJspContext ctxt) {
  
  if (Util.toBoolean(ctxt.getAjaxRequestAttribute(WikiToolbar.ENABLED), false)) {
    return "";
  }
  ctxt.setAjaxRequestAttribute(WikiToolbar.ENABLED, "true");
  
  if (!ctxt.isAjaxRequest() || Util.toBoolean(ctxt.getRequest().getAttribute(WikiToolbar.PRINTWIKITB), false)) {
    return "";
  }
  ctxt.getRequest().setAttribute(WikiToolbar.PRINTWIKITB, "true");
  
  WikiToolbar wt = new WikiToolbar(ctxt);
  return wt.printWikiToolbar();
}
%><%

String disabledMentionCss = Util.toBoolean(getOption(WikiAreaSettings.MENTION, false), false) ? "mention-disabled " : "";
addOption(BasicSettings.CSS, disabledMentionCss + "wikiarea " + getOption(BasicSettings.CSS, ""));
includeLocalObject("TEXTAREA_APPEND", !fieldDisabled ? printWikiToolbar(jcmsContext) : null);

%><%@ include file="/jcore/field/control/doTextArea.jspf" %>