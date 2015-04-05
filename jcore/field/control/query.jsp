<%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
if (Util.notEmpty(fieldValue)) {
  com.jalios.jcms.handler.QueryHandler qh = new com.jalios.jcms.handler.QueryHandler(fieldValue, request);
  includeLocalObject("fieldValueDisplay", qh.getDescription());
}
includeLocalObject("hiddenField", true);

includeLocalObject("APPEND_CLEAR_BUTTON", true);
%><%
%><%@ include file="/jcore/field/control/doText.jspf" %>
