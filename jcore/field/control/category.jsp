<%@page import="com.jalios.jcms.taglib.settings.SelectorSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.SelectorSettings.SelectorType"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.CategorySettings"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
boolean categoryTree = getOption(CategorySettings.TREE, false);
if(categoryTree) {
  %><%@ include file="/jcore/field/control/doCategoryTree.jspf" %><%
} else {
  SelectorType catSelectorType = getOption(SelectorSettings.SELECTOR_TYPE, SelectorType.CHOOSER);
  addOption(SelectorSettings.SELECTOR_TYPE, catSelectorType);
  /*
  if(SelectorType.CHOOSER.equals(catSelectorType)) {
    boolean liveCreation = getOption(CategorySettings.LIVE_CREATION, true);
    if(!liveCreation) {
      addOption(BasicSettings.CSS, "acadd_false " + getOption(BasicSettings.CSS,""));
    }
  }
  */
  %><%@ include file="/jcore/field/control/doEnumerate.jspf" %><%
}
%>