<%@ page import="com.jalios.jcms.tools.JCMSAppender,org.apache.log4j.spi.LoggingEvent" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
// Authorization
if (!isAdmin && !checkAccess("admin/monitoring/logs")) {
  if (jcmsContext.isInFrontOffice()) {
    request.setAttribute("ShowPortalElement", Boolean.FALSE);
    return;
  } else {
    jcmsContext.sendForbidden();
    return;
  }
}
// Do the conditions to display it are met
JCMSAppender jcmsAppender = JCMSAppender.getLastInstanceCreated();
if (jcmsContext.isInFrontOffice()) { 
	if (jcmsAppender == null || Util.isEmpty(jcmsAppender.getLoggedEventList(Level.WARN))) {
	    request.setAttribute("ShowPortalElement", Boolean.FALSE);
	    return;
	}
}
%>
 <jalios:panel title="ui.adm.mn.warnlogs">
   <%-- No JCMSAppender defined in log4j --%>
   <% if (jcmsAppender == null) { %>
    <p class="logList"><%= glp("ui.adm.logs.appender-not-defined") %></p>
    
   <%-- JCMSAppender correctly defined in log4j --%>
   <% } else { 
    List eventList = jcmsAppender.getLoggedEventList(Level.WARN);
    if (Util.isEmpty(eventList)) {
      if (jcmsContext.isInFrontOffice()) {
        request.setAttribute("ShowPortalElement", Boolean.FALSE);
        return;
      }
   %>
   <p class="noLogs">          
     <jalios:icon  src="tick" alt="ok" />
     <%= glp("ui.adm.logs.no-warning-logs") %>
   </p>
   <% } else { /* if eventList is NOT Empty*/ %>
     <div class="list-group admin-warning-logs list-group-collapsible sticky">
     <% int listGroupItemCount = 0; %>
     <jalios:foreach collection="<%= eventList %>"  counter='logCounter'
                     name="event" type="LoggingEvent"
                     max="<%= 5 %>" >
      <%
          Date eventDate = new Date(event.timeStamp);
          String logMessage = event.getRenderedMessage();
          String logCss = "";
          String dateCss = "";
          String eventLevel = event.getLevel().toString();
          if (eventLevel.equals("INFO") || eventLevel.equals("DEBUG")) {
	          logCss = "list-group-item-info";
            dateCss = "label label-info";
          } else if (eventLevel.equals("ERROR") || eventLevel.equals("FATAL")) {
	          logCss = "list-group-item-danger";
            dateCss = "label label-danger";
          } else {
	          logCss = "list-group-item-warning";
            dateCss = "label label-warning";
	        }
	        
      %>
       <a class="list-group-item list-group-item<%= listGroupItemCount %> list-group-item-collapsed <%= logCss %> <%= event.getLevel() %>" data-jalios-action="toggle:list-group-item-collapsed" data-jalios-target=".admin-warning-logs .list-group-item<%= listGroupItemCount %>" title="<%= encodeForHTMLAttribute(logMessage) %>">
         <span class="<%= dateCss  %>"><% if (DateUtil.isToday(eventDate)) { %><jalios:time format="short" date="<%= eventDate %>" /><% } else { %><jalios:date format="dd/MM" date="<%= eventDate %>" /><% } %></span>
        <jalios:icon  src='<%= "log-" + event.getLevel().toString().toLowerCase() %>' title='<%= glp("ui.adm.logs.level."+event.getLevel()) %>' />
        <%= encodeForHTML(logMessage) %>
       </a>
       <% listGroupItemCount++; %>
     </jalios:foreach> 
     </div>
   <%  } } %>
     <jalios:include target="ADMIN_WARN_LOGS" targetContext="bloc" />
     <jalios:buffer name="PANEL_HEADING_BTN">
       <small><a href="admin/logs.jsp?level=warn"><%= glp("ui.com.lbl.show-all") %></a></small>
     </jalios:buffer>
  </jalios:panel>
