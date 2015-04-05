<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>    
<% if (checkAccess("admin/users/admin-mail")) { %>
  <a class="modal publish-menu-send-alert list-group-item publish-menu-item" href="jcore/alert/sendAlert.jsp" onclick="return false;"><jalios:icon css="topbar-icon" src="email-error"  /> <%= glp("alert.send-alert.lbl.title") %></a>
<% } %>   