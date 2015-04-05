<%@ include file="/jcore/field/control/doInitControl.jspf" %>
<%
if (Util.notEmpty(fieldValue)) {
  includeLocalObject("fieldValueDisplay", fieldValue);
}
includeLocalObject("hiddenField", true);

includeLocalObject("APPEND_CLEAR_BUTTON", true);
%>
<%@ include file="/jcore/field/control/doText.jspf" %>