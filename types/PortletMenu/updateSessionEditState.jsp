<%@ include file="/jcore/doInitPage.jspf" %><%
  boolean editState = getBooleanParameter("editState",true);
  jcmsContext.setShowEditIcon(editState);
%>