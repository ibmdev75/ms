<%--
  @Summary: Display last log4j LoggedEvent logged in the site if the corresponding appender
            was defined in the log4j.xml
  @Category: Admin / Channel
  @Author: Oliver Jaquemet
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5
--%>
<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.tools.JCMSAppender" %><%
%><%@ page import="org.apache.log4j.spi.LoggingEvent" %><%
%><%@ page import="com.jalios.jcms.servlet.BinaryFileServlet" %><%

  if (!checkAccess("admin/monitoring/logs")) {
    sendForbidden(request, response);
    return;
  }

  jcmsContext.addCSSHeader("css/jalios/logs.css");
  jcmsContext.addCSSHeader("css/fff-sprite.css");
  request.setAttribute("eventLogsSubAdminMenu", "true");

%><%@ include file='/admin/doAdminHeader.jspf' %>
<div class="page-header"><h1><%= glp("ui.adm.logs.title") %></h1></div>
<% JCMSAppender jcmsAppender = JCMSAppender.getLastInstanceCreated(); %>

<%-- No JCMSAppender defined in log4j --%>
<% if (jcmsAppender == null) { %>
 <p class="noAppenderDefined"><%= glp("ui.adm.logs.appender-not-defined") %></p>

<%-- JCMSAppender correctly defined in log4j --%>
<% } else { %> 
<%
 Level level = Level.toLevel(getAlphaNumParameter("level", null), null);
 List eventList = jcmsAppender.getLoggedEventList(level);
%>

<div class="navbar navbar-default navbar-table-header" role="navigation">
  <div class="container-fluid">
  <div class="navbar-form navbar-right">
    <% File jcmsLogFile = new File(channel.getDataPath("logs/jcms.log")); %>
    <% if (jcmsLogFile.exists()) { %>
    <a href="admin/logsDownload.jsp?zip=true" class="btn btn-default" title="<%= glp("ui.adm.logs.download") %> - <%= encodeForHTMLAttribute(Util.formatFileSize(jcmsLogFile.length(), userLocale, false)) %>"><jalios:icon src="download"  /></a>
    <% } %>
  </div>
	<div class="navbar-form navbar-left">
  <select class='form-control logs' onchange="document.location='<%= contextPath %>/'+this.value">
    <option <% if (level == null) { %> selected="selected" <% } %> 
            value='<%= ServletUtil.getUrlWithUpdatedParams(request,
                          new String[] {"level"}, new String[]{null}) %>'>
      <%= glp("ui.adm.logs.filter.all") %>
    </option>
    <option class="level INFO" style="background-position: 2px 0px;" <% if (level != null && level.equals(Level.INFO)) { %> selected="selected" <% } %> 
            value='<%= ServletUtil.getUrlWithUpdatedParams(request,
                          new String[] {"level"}, new String[]{"info"}) %>'>
      <%= glp("ui.adm.logs.filter.info") %>
    </option>
    <option class="level WARN" style="background-position: 2px 0px;" <% if (level != null && level.equals(Level.WARN)) { %> selected="selected" <% } %> 
            value='<%= ServletUtil.getUrlWithUpdatedParams(request,
                                     new String[] {"level"}, new String[]{"warn"}) %>'>
      <%= glp("ui.adm.logs.filter.warn") %>
    </option>
    <option class="level ERROR" style="background-position: 2px 0px;" <% if (level != null && level.equals(Level.ERROR)) { %> selected="selected" <% } %> 
            value='<%= ServletUtil.getUrlWithUpdatedParams(request,
                                     new String[] {"level"}, new String[]{"error"}) %>'>
      <%= glp("ui.adm.logs.filter.error") %>
    </option>
    <option class="level FATAL" style="background-position: 2px 0px;" <% if (level != null && level.equals(Level.FATAL)) { %> selected="selected" <% } %> 
            value='<%= ServletUtil.getUrlWithUpdatedParams(request,
                                     new String[] {"level"}, new String[]{"fatal"}) %>'>
      <%= glp("ui.adm.logs.filter.fatal") %>
    </option>
  </select>
  </div>
  </div>
  </div>
 <jalios:pager name='logsPagerHandler' declare='true'
               action='init' size='<%= eventList.size() %>' />
  <table class='table-data table-condensed logs'>
   <tr>
     <th><%= glp("ui.adm.logs.log.level") %></th>
     <th><%= glp("ui.adm.logs.log.date") %></th>
     <th><%= glp("ui.adm.logs.log.time") %></th>
     <th><%= glp("ui.adm.logs.log.message") %></th>
     <th><%= glp("ui.adm.logs.log.logger-short-name") %></th>
   </tr>
  <jalios:foreach collection="<%= eventList %>"  counter='logCounter'
                  name="event" type="LoggingEvent"
                  max="<%= logsPagerHandler.getPageSize() %>"
                  skip="<%= logsPagerHandler.getStart() %>">
   <tr> 
   <%
       Date eventDate = new Date(event.timeStamp);
       String loggerName = event.getLoggerName();
       String shortLoggerName = loggerName;
       int lastDot = event.getLoggerName().lastIndexOf(".");
       if (lastDot != -1) {
         shortLoggerName = loggerName.substring(lastDot+1);
       }
       String[] throwableStrRep = event.getThrowableStrRep();
       String refineURL = ServletUtil.getUrlWithUpdatedParams(request,
                                     new String[] {"level"}, new String[]{event.getLevel().toString().toLowerCase()});
   %>
     <td class="level <%= event.getLevel() %>"><a href="<%= refineURL %>"><%= glp("ui.adm.logs.level."+event.getLevel()) %></a></td>
     <td><jalios:date date="<%= eventDate %>" format='<%= "yyyy/MM/dd" %>' /></td>
     <td><jalios:time date="<%= eventDate %>" format='<%= "HH:mm:ss" %>' /></td>
     <td width="100%">
      <%= encodeForHTML(event.getRenderedMessage()) %>
      <% if (throwableStrRep!= null) {%>
        <a href="" class="showDetailLink" onclick="Element.addClassName(this.parentNode, 'showDetail');return false;"><jalios:icon src="log-exception"  alt='Exception'/>+</a>
        <a href="" class="hideDetailLink" onclick="Element.removeClassName(this.parentNode, 'showDetail');return false;"><jalios:icon src="log-exception"  alt='Exception'/>-</a>
        <div class="eventDetail">
          <% for (int i = 0; i < throwableStrRep.length; i++) { %>
            <%= encodeForHTML(throwableStrRep[i]) %>
          <% } %>
        </div>
      <% } %>
     </td>
     <td><%= shortLoggerName %></td>
   </tr>
  </jalios:foreach> 
  </table>
  <jalios:pager name="logsPagerHandler"/>
<% } // jcmsAppender != null %>

<%@ include file='/admin/doAdminFooter.jspf' %> 