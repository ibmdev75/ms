<%--
  @Summary: Display information about the Mail
  @Category: Admin / Channel
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.mail.*,org.apache.log4j.spi.*" %><%

if (!checkAccess("admin/monitoring/mail-info")) {
  sendForbidden(request, response);
  return;
}

request.setAttribute("mailInfoSubAdminMenu", "true"); 
int counter = 0;

jcmsContext.addCSSHeader("css/jalios/logs.css");
MailManager mailMgr = MailManager.getInstance();
%><%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header"><h1><%= glp("ui.adm.mn.info.mail") %></h1></div>

<div class="row">
  <div class="col-md-6">

    <% /* %>Mail Account Info<% */ %>
    <jalios:panel title="ui.adm.mail-info.status" picture='status'>
      <table class="table-data table-condensed">
        <tr>
          <td><strong><%= glp("ui.com.lbl.enabled") %></strong></td>
          <td colspan="2"><jalios:icon src='<%= channel.isIncomingMailEnabled() ? "accept" : "cross" %>' alt='<%= glp("ui.com.lbl." + (channel.isIncomingMailEnabled() ? "enabled" : "disabled")) %>'/></td>
        </tr>
        <tr>
          <td><strong><%= glp("ui.adm.mail-info.db-count") %></strong></td>
          <td colspan="2"><%= mailMgr.getDBMailMessageCount() %></td>
        </tr>
        <tr>
          <td><strong><%= glp("ui.adm.mail-info.fetch-account") %></strong></td>
          <td>
            <%
              MailAccount lastAccount = mailMgr.getMailFetcher().getLastFetchAccount();
              if (lastAccount != null){
                out.println("<em>");
                out.println(lastAccount.getLabel());
                out.println("</em>");
              }
            %>
          </td>
          <td>
            <jalios:if predicate="<%= Util.notEmpty(lastAccount) %>">
              <jalios:date date="<%= lastAccount.getLastFetchDate() %>"/> <jalios:time date="<%= lastAccount.getLastFetchDate() %>"/>
            </jalios:if>
          </td>
        </tr>
        <tr>
          <td><strong><%= glp("ui.adm.mail-info.pre-suf") %></strong></td>
          <td><%= channel.getProperty("mail.incoming.label") %></td>
          <td><%= channel.getProperty("mail.incoming.suffix") %></td>
        </tr>
        <%
        Map<String, String> patternMap = mailMgr.getMailFetcher().getIncomingMailListener().listAllPatterns();
        %>
        <tr>
          <td rowspan="<%= patternMap.size()+1 %>"><strong><%= glp("ui.adm.mail-info.archive") %></strong></td>
          <td class="listHeader"><strong><%= glp("ui.adm.mail-info.regexp") %></strong></td>
          <td class="listHeader"><strong><%= glp("ui.adm.mail-info.criteria") %></strong></td>
        </tr>

        <jalios:foreach collection="<%= patternMap.entrySet() %>" name="itEntry" type="Map.Entry">
          <tr>
            <td><pre class='pattern'><%= itEntry.getKey() %></pre></td>
            <td><%= itEntry.getValue() %></td>
           </tr>
        </jalios:foreach>
      </table>
    </jalios:panel>

    &nbsp;<% counter = 0; %>
    <%
    MailAppender appender = MailAppender.getLastInstanceCreated();
    List<LoggingEvent> eventList = appender != null ? appender.getLoggedEventList() : null;
    if (Util.notEmpty(eventList)) { %>
      <% /* %>Logs<% */ %>
      <jalios:panel title="ui.adm.mail-info.logs" picture='log-icon'>
        <table class='table-data table-condensed logs' >
		       <tr>
		         <th class='listHeader'><%= glp("ui.adm.logs.log.level") %></th>
		         <th class='listHeader'><%= glp("ui.adm.logs.log.date") %></th>
		         <th class='listHeader'><%= glp("ui.adm.logs.log.time") %></th>
		         <th class='listHeader'><%= glp("ui.adm.logs.log.message") %></th>
		       </tr>
		       <jalios:foreach collection="<%= eventList %>"  name="itEvent" type="LoggingEvent"  counter='logCounter'>
		       <tr>
		         <% 
		           Date eventDate = new Date(itEvent.timeStamp);
		           String[] throwableStrRep = itEvent.getThrowableStrRep();
		         %>
		         <td class='level <%= itEvent.getLevel() %>'><%= glp("ui.adm.logs.level."+itEvent.getLevel()) %></td>
		         <td><jalios:date date="<%= eventDate %>" format='<%= "yyyy/MM/dd" %>' /></td>
		         <td><jalios:time date="<%= eventDate %>" format='<%= "HH:mm:ss" %>' /></td>
		         <td width="100%">
		           <%= itEvent.getMessage() %>
		           <% if (throwableStrRep!= null) {%>
		             <a href="" class="showDetailLink" onclick="Element.addClassName(this.parentNode, 'showDetail');return false;"><jalios:icon src="log-exception"  alt='Exception'/>+</a>
		             <a href="" class="hideDetailLink" onclick="Element.removeClassName(this.parentNode, 'showDetail');return false;"><jalios:icon src="log-exception"  alt='Exception'/>-</a>
		             <div class="eventDetail">
		               <% for (int i = 0; i < throwableStrRep.length; i++) { %><%= throwableStrRep[i] %><% } %>
		             </div>
		           <% } %>
		         </td>
		       </tr>
		       </jalios:foreach>
        </table>
      </jalios:panel>
    <% } %>
      
  </div>
  <div class="col-md-6">
    <% counter = 0; %>
    <jalios:panel title='ui.adm.mail-info.account' picture='email'>
      <% for(MailAccount account : MailManager.getInstance().getMailFetcher().getMailAccountMap().values()){ %>
        <table class='table-data table-condensed br'>
          <tr><th colspan="2"><%= account.getLabel() %></th></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.enable") %></strong></td><td><jalios:icon src='<%= account.isEnabled() ? "accept" : "cross" %>' alt='<%= glp("ui.com.lbl." + (account.isEnabled() ? "enabled" : "disabled")) %>'/></td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.host") %></strong></td><td><%= account.getHost() %></td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.port") %></strong></td><td><%= account.getPort() %></td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.protocol") %></strong></td><td><%= account.getProtocol() %></td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.imapssl") %></strong></td><td><%= account.isImapSSL() %></td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.login") %></strong></td><td><%= account.getLogin() %></td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.mbox") %></strong></td><td><%= account.getMbox() %></td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.expunged") %></strong></td><td><%= account.isExpunged() %></td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.schedule") %></strong></td><td><%= account.getSchedule() %></td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.author") %></strong></td><td><jalios:dataicon data="<%= account.getAuthor() %>" /> <jalios:link data='<%= account.getAuthor() %>' /></td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.workspace") %></strong></td><td><jalios:dataicon data="<%= account.getWorkspace() %>" /> <jalios:link data='<%= account.getWorkspace() %>' /></td></tr>
          <tr><td colspan="2">&nbsp</td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.fetch-date") %></strong></td><td><jalios:date date="<%= account.getLastFetchDate() %>"/> <jalios:time date="<%= account.getLastFetchDate() %>"/></td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.fetch-count") %></strong></td><td><%= account.getLastFetchCount() %></td></tr>
          <tr><td><strong><%= glp("ui.adm.mail-info.db-count") %></strong></td><td><%= account.getDBMailMessageCount() %></td></tr>
        </table>
      <% } %>
    </jalios:panel>
  </div>
</div>

<%@ include file='/admin/doAdminFooter.jspf' %> 