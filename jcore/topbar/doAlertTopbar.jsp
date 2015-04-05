<%@ include file="/jcore/doInitPage.jspf" %><%--  
--%><%@ page import="com.jalios.jcms.alert.*" %><%--
 --%><% 
if (isLogged) {
	AlertManager alertMgr = AlertManager.getInstance();
	int count = alertMgr.getUnreadAlertCount(loggedMember); 
	Alert.Level level = null;
	if (count > 0) {
	  level = alertMgr.getMaxUnreadAlertLevel(loggedMember); 
	}
  int oldAlertCount = Util.toInt(jcmsContext.getAjaxRequestAttribute("jcms.alert.alertcount.ajax"),count);
  jcmsContext.setAjaxRequestAttribute("jcms.alert.alertcount.ajax",count);
	boolean hasNewAlerts = count > oldAlertCount;
  
  String animateCss = hasNewAlerts ? "topbar-alert-animate animated bounce " : "";
  
  boolean twoDigits = count > 9 && count < 100 ? true : false;
  boolean threeDigits = count > 99;
%>
<% if (!jcmsContext.isAjaxRequest()){ %>
<div class="ajax-refresh-div ajax-live ajax-waiting-0.6 topbar-item" data-jalios-ajax-refresh-url="jcore/topbar/doAlertTopbar.jsp">
<% } %> 
  <div class="topbar-alert topbar-item">
  <a class="modal" href="jcore/alert/alertList.jsp" onclick="return false;" title="<%= glp("alert.list.lbl.title") %>">
    <jalios:icon src="topbar-alert"/>
    <% if (count > 0) { %><span class="<%= animateCss %><%= twoDigits ? "two-digits " : "" %><%= threeDigits ? "three-digits " : "" %>alert-badge<%= level == null ? "" : " alert-level-" + level.getKey() %>"><%= count > 99 ? "99+" : count %></span><% } %>
  </a>
  </div>
<% if (!jcmsContext.isAjaxRequest()){ %>
</div>
<% } %>
<% } %>
