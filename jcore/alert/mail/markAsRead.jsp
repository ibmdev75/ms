<%@ include file="/jcore/doInitPage.jspf" %><%--
 --%><%@ page import='com.jalios.jcms.alert.*' %><%--
 --%><%
  Alert alert = getDataParameter("id", Alert.class);
  AlertManager.getInstance().markAsRead(alert, loggedMember);
  if (getBooleanParameter("img", false)) {
    sendRedirect("s.gif");
  }
%>