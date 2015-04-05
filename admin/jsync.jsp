<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jstore.jsync.*" %><%

  if (!checkAccess("admin/operation/jsync")) {
    sendForbidden(request, response);
    return;
  }

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.JSyncManagerHandler"><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

if (!channel.isJSyncEnabled()) {
  sendForbidden(request, response);
  return;
}

request.setAttribute("title", glp("ui.adm.mn.op.jsync")); 
request.setAttribute("jsyncSubAdminMenu", "true");
if (formHandler.validate()) {
  return;
}
JSyncReplica replica = formHandler.getReplica();

%>
<%@ include file='/admin/doAdminHeader.jspf' %>

<%-- ********************************************************************** --%>
<div class="page-header"><h1><%= glp("ui.adm.mn.op.jsync") %></h1></div>

<div class="tab-pane" id="jsyncTab">

  <%-- *** STATUS ************************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.adm.jsync.tab.status") %></h2>
    <table class='layout'>

        <%-- --- REPLICA LIST -------------------------------------------  --%>
        <% if (replica.isLeader()) { %>
        <tr>        
          <td colspan="2">
            <fieldset>
              <h3 class='formLabel'><%= glp("ui.adm.jsync.st.list") %></h3>
              <table id='replicaTable' class='table-data'>
               <tr>
                 <th class="listHeader" scope="col"><%= glp("ui.adm.jsync.st.replica") %></th>
                 <th class="listHeader" scope="col"><%= glp("ui.com.lbl.url") %></th>
                 <th class="listHeader" scope="col"><%= glp("ui.adm.jsync.st.pt") %></th>
                 <th class="listHeader" scope="col"><%= glp("ui.adm.jsync.st.lst-join") %></th>
                 <th class="listHeader" scope="col"><%= glp("ui.adm.jsync.st.lst-upd") %></th>
                 <th class="listHeader" scope="col"><%= glp("ui.adm.jsync.st.lst-ack") %></th>
                 <th class="listHeader" scope="col"><%= glp("ui.adm.jsync.st.ood") %></th>
                 <th class="listHeader" scope="col">&nbsp;</th>
               </tr>
               <jalios:foreach collection='<%= replica.getReplicaMap().values() %>' name='itReplica' type='ReplicaInfo'>
               <tr>
                 <td><jalios:icon src='server'  /> <%= itReplica.getUrid() %></td>
                 <td><%= itReplica.getUrl() %></td>
                 <td><%= itReplica.getProgressTable() %></td>
                 <td align='right'><jalios:time date='<%= itReplica.getJoinDate() %>' format='<%= "short" %>'/> <jalios:date date='<%= itReplica.getJoinDate() %>' format='<%= "short" %>'/></td>
                 <td align='right'><jalios:time date='<%= itReplica.getLastUpdateDate() %>' format='<%= "short" %>'/> <jalios:date date='<%= itReplica.getLastUpdateDate() %>' format='<%= "short" %>'/></td>
                 <td align='right'><jalios:time date='<%= itReplica.getLastAckDate() %>' format='<%= "short" %>'/> <jalios:date date='<%= itReplica.getLastAckDate() %>' format='<%= "short" %>'/></td>
                 <td align='center'><%= itReplica.isOutOfDate(replica.getProgressTable()) ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
                 <td>
                   <a href='admin/jsync.jsp?opRemoveReplica=true&amp;urid=<%= itReplica.getUrid() %>' class="modal confirm">
                   <jalios:icon src="trash-empty" title='<%= glp("ui.com.alt.remove") %>'/>
                   </a>
                 </td>
               </tr>
               </jalios:foreach>
              </table>
           </fieldset>    
        </td> 
      </tr>
      <% } %>
      
      <%-- --- PREVIOUS REPLICA LIST -------------------------------------------  --%>
      <% Set previousReplica = channel.getJSyncPreviousReplicaManager().getPreviousReplica(); %>        
      <% if (Util.notEmpty(previousReplica)) { %>
      <tr>
        <td colspan="2"> 
          <fieldset>
           <legend class='formLabel'><%= glp("ui.adm.jsync.st.previous-replica") %></legend>
           <table id='previousReplicaTable' class="table-data table-condensed">
             <thead>
               <th>&nbsp;</th>
               <th class="listHeader" scope="col" width="100%"><%= glp("ui.adm.jsync.st.replica") %></th>
               <th>&nbsp;</th>
             </thead>
           <jalios:foreach collection='<%= previousReplica %>' name='itPreviousReplica' type='String' counter="itCounterReplica">
             <tr>
               <td class="text-right"><%= itCounterReplica.intValue() %>.</td>
               <td><%= itPreviousReplica %></td>
               <td>
                 <form action='admin/jsync.jsp' method="post">
                   <input type="hidden" name="replicaUrl" value="<%= ServletUtil.encodeURL(itPreviousReplica) %>" /> 
                   <input class='btn btn-default' type='submit' name='opSuggestJoin' value='<%= glp("ui.adm.jsync.st.suggest-join") %>' /> 
                 </form>
               </td>
             </tr>
           </jalios:foreach>
           </table>
          <% if (Util.getSize(previousReplica) > 1) { %>
          <form action='admin/jsync.jsp' method="pos">
            <input class='btn btn-default' type='submit' name='opGlobalSuggestJoin' value='<%= glp("ui.adm.jsync.st.btn.global-suggest-join") %>' /> 
          </form>
          <% } %>
          </fieldset>
      </td>
    </tr> 
    <% } %>

      <tr>
        <%-- --- INFO -------------------------------------------  --%>
        <td class='vTop'>
            <h3 class='formLabel'><%= glp("ui.adm.jsync.st.info") %></h3>
            <table class='table-data auto'>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.jsync.st.r-st") %></th>
                <td class='formInfo'><jalios:icon src='<%= "replica-" + formHandler.getReplicaStatus() %>' /> <%= glp("ui.adm.jsync.r-st." + formHandler.getReplicaStatus()) %></td>
              </tr>
              <% if (replica.isJoined()) { %>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.jsync.st.l-urid") %></th>
                <td class='formInfo'><%= replica.getLeader().getUrid() %></td>
              </tr>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.jsync.st.need-upd") %></th>
                <td class='formInfo'><%= replica.needForUpdate() %></td>
              </tr>
              <% } %>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.jsync.st.pt") %></th>
                <td class='formInfo'><%= replica.getProgressTable() %></td>
              </tr>
            </table>
        </td>
        <%-- --- CONFIGURATION -------------------------------------------  --%>
        <td class='vTop'>
            <h3 class='formLabel'><%= glp("ui.adm.jsync.st.configuration") %> <a href='admin/adminProperties.jsp' target='_blank'><jalios:icon src='edit'  /></a></h3>
              <table class='table-data auto'>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.jsync.st.r-url") %></th>
                <td class='formInfo'><%= channel.getJSyncReplicaUrl() %></td>
              </tr>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.jsync.st.r-urid") %></th>
                <td class='formInfo'><%= channel.getUrid() %> </td>
              </tr>
              <% if (Util.notEmpty(formHandler.getLeaderUrl())) { %>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.jsync.st.l-url") %></th>
                <td class='formInfo'><%= formHandler.getLeaderUrl() %></td>
              </tr>
              <% } %>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.prop.jsync.sync-files") %></th>
                <td class='formInfo'>
                  <%= glp(replica.getSyncFiles() ? "ui.com.lbl.yes" : "ui.com.lbl.no") %></a>
                </td>
              </tr>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.prop.jsync.update-mode") %></th>
                <td class='formInfo'>
                  <%= glp("ui.adm.prop.jsync.update-" + channel.getProperty("jsync.update-mode")) %>
                </td>
              </tr>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.prop.jsync.stab-delay") %></th>
                <td class='formInfo'>
                  
                  <jalios:duration time="<%= channel.getJSyncStabDelay() %>" />
                  
                </td>
              </tr>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.prop.jsync.max-delay") %></th>
                <td class='formInfo'>
                  <%= channel.getIntegerProperty("jsync.max-delay", 10) %>
                </td>
              </tr>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.prop.jsync.max-op") %></th>
                <td class='formInfo'>
                  <%= channel.getIntegerProperty("jsync.max-op", 5000) %>
                </td>
              </tr>
              <tr>
                <th class='formLabel' scope="row"><%= glp("ui.adm.prop.jsync.ip") %></th>
                <td class='formInfo'>
                  <%= channel.getProperty("jsync.ip", "") %>
                </td>
              </tr>
              <tr>
                <th class='formLabel' scope="row"><% /* %>Startup Join<% */ %><%= glp("ui.adm.prop.jsync.startup-join") %></th>
                <td class='formInfo'>
                  <% long startUpJoin = channel.getIntegerProperty("jsync.startup-join", 0) * 1000; 
                  if (startUpJoin == 0) { %>
                  <%= glp("ui.com.lbl.no") %>
                  <% } else { %>
                  <jalios:duration time="<%= startUpJoin %>" />
                  <% } %>
                </td>
             </tr>
              <tr>
                <th class='formLabel' scope="row"><% /* %>Can be joined<% */ %><%= glp("ui.adm.prop.jsync.can-be-joined") %></th>
                <td class='formInfo'>
                  <%= channel.getBooleanProperty("jsync.can-be-joined", false) ? glp("ui.com.lbl.yes") : glp("ui.com.lbl.no") %>
                </td>
             </tr>
              <tr>
                <th class='formLabel' scope="row"><% /* %>Prevent Cyclic Leadership<% */ %><%= glp("ui.adm.prop.jsync.can-leader-join") %></th>
                <td class='formInfo'>
                  <%= channel.getBooleanProperty("jsync.can-leader-join", false) ? glp("ui.com.lbl.yes") : glp("ui.com.lbl.no") %>
                </td>
             </tr>
              <tr>
                <th class='formLabel' scope="row"><% /* %>Explicit replica list<% */ %><%= glp("ui.adm.prop.jsync.explicit-replica-list") %></th>
                <td class='formInfo'>
                  <%= channel.getProperty("jsync.explicit-replica-list", "") %>
                </td>
             </tr>
              <tr>
                <th class='formLabel' scope="row"><% /* %>Replica Startup Join<% */ %><%= glp("ui.adm.prop.jsync.replica-startup-join") %></th>
                <td class='formInfo'>
                  <% long replicaStartUpJoin = channel.getIntegerProperty("jsync.replica-startup-join", 0) * 1000; 
                  if (replicaStartUpJoin == 0) { %>
                  <%= glp("ui.com.lbl.no") %>
                  <% } else { %>
                  <jalios:duration time="<%= replicaStartUpJoin %>" />
                  <% } %>
                </td>
             </tr>
            </table>
        </td>
      </tr>
      
    </table>
  </div>

<%-- *** LOGS ************************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.adm.jsync.tab.log") %></h2>

    <% List logList = formHandler.getLogList(); %>    
    <div class='navbar navbar-default <%= Util.notEmpty(logList) ? "navbar-table-header" : "" %>'>
      <form action='admin/jsync.jsp' name='logForm' method="post" class="navbar-form">
        <div class="navbar-left">
        <span class="navbar-label"><%= glp("ui.adm.jsync.log.since") %></span>
        <jalios:field name="logDuration" value="<%= formHandler.getLogDuration() %>" resource="field-vertical">
          <jalios:control settings="<%= new DurationSettings().resolution(DurationSettings.Resolution.HOUR) %>" />
        </jalios:field>
        </div>
        <div class="navbar-right">
          <button class='btn btn-primary' type='submit' name='opRefreshLog' value='true'><%= glp("ui.com.btn.refresh") %></button>
        </div>
      </form>    
    </div>
    
    <%-- No logs --%>
    <% if (Util.isEmpty(logList)) { %>
    <jalios:message msg="ui.adm.jsync.log.nolog" title="" dismissable=""/>
    
    <%-- Logs table --%>
    <% } else { %>
    <table id='logTable' class='table-data'>
      <tr>
        <th class="fit nowrap">&nbsp;</th>
        <th class="fit nowrap"><%= glp("ui.com.lbl.date") %></th>
        <th class="fit nowrap"><%= glp("ui.com.lbl.urid") %></th>
        <th class="fit nowrap"><%= glp("ui.com.lbl.type") %></th>
        <th class="fit nowrap"><%= glp("ui.adm.jsync.log.action") %></th>
        <th class="fit nowrap"><%= glp("ui.com.lbl.status") %></th>
        <th class="fit nowrap"><%= glp("ui.work.report.lbl.duration") %></th>
        <th><%= glp("ui.adm.jsync.log.extra") %></th>
      </tr>
      <%
      boolean isLeader = channel.getJSyncReplica().isLeader();
      String myUrid = channel.getUrid();
      String leaderUrid = "";
      if (isLeader) {
        leaderUrid = myUrid;
      } else {
        ReplicaInfo leader = channel.getJSyncReplica().getLeader();
        if (leader != null) {
          leaderUrid = leader.getUrid();
        }
      }
      %>
      <jalios:pager name="pager" declare="true" action="init" size="<%= logList.size() %>"/>
      <jalios:foreach collection='<%= logList %>' 
                      name='itElt' 
                      type='org.jdom.Element'
                      max="<%= pager.getPageSize() %>"
                      skip="<%= pager.getStart() %>">
      <% 
      Date date = new Date(Util.toLong(itElt.getAttributeValue("date"), 0)); 
      String type = itElt.getAttributeValue("type");
      String action = itElt.getAttributeValue("action");
      String typeIcon = (type.equals("in") ? "images/jalios/icons/arrowleft.gif" : (type.equals("out") ? "images/jalios/icons/arrowright.gif" : "s.gif"));
      String urid = itElt.getAttributeValue("urid");
      String uridIcon = null;
      if (leaderUrid.equals(urid)) {
        uridIcon = "replica-leader";
      } 
      if (myUrid.equals(urid)) {
        uridIcon = "replica-member";        
      } 
      else {
        uridIcon = "replica-lone";
      }
      
      int sc = JSyncUtil.cleanStatusCode(Util.toInt(itElt.getAttributeValue("sc"), 0));
      long duration = Util.toLong(itElt.getAttributeValue("duration"), 0);
      int nbOps = Util.toInt(itElt.getAttributeValue("nbOps"), -1);
      int nbFiles = Util.toInt(itElt.getAttributeValue("nbFiles"), -1);
      boolean merge = Util.toBoolean(itElt.getAttributeValue("merge"), false);
      boolean partial = Util.toBoolean(itElt.getAttributeValue("partial"), false);
      int nbUU = Util.toInt(itElt.getAttributeValue("nbUU"), 0);
      int nbUD = Util.toInt(itElt.getAttributeValue("nbUD"), 0);
      int nbDU = Util.toInt(itElt.getAttributeValue("nbDU"), 0);
      int nbDD = Util.toInt(itElt.getAttributeValue("nbDD"), 0);
      int nbConflict = nbUU + nbUD + nbDU + nbDD;
      boolean isError = sc != JSyncConstants.SC_OK;
      %> 
      <% String trClass = type.equals("in") ? "listJsyncLogIn" : ( type.equals("out") ? "listJsyncLogOut" : "listJsyncLogInternal"); %>
      <tr class="<%= trClass %>">
        <td class="fit nowrap text-right"><%= itCounter %></td>
        <td class="fit nowrap text-right"><jalios:date date='<%= date %>' format='<%= "short" %>'/> <jalios:time date='<%= date %>' format='<%= "short" %>'/></td>
        <td class="fit nowrap"><jalios:icon src='<%= uridIcon %>' /><code><%= urid %></code></td>
        <td class="text-center"><jalios:icon src='<%= typeIcon %>' /></td>
        <td class="fit nowrap"><%= action %></td>
        <td class="fit nowrap <%= isError ? "listJsyncLogError" : ""%>"><span class="label <%= sc == 0 ? "label-info" : (sc == JSyncConstants.SC_OK ? "label-success" : "label-warning") %>"><%= sc %> - <%= replica.getStatusLabel(sc, userLocale) %></span></td>
        <td class="fit nowrap text-right">
           <% if (duration > 0) {%>
             <% if (duration < 1000) { duration = 1000; } %>
             <jalios:duration time='<%= duration %>'/>
          <% } %>
        </td>
        <td>
          <ul>
          <% if (nbOps > 0) {%><li><%= glp("ui.adm.jsync.log.ops", nbOps) %><% } %>
          <% if (nbFiles > 0) {%><li><%= glp("ui.adm.jsync.log.files", nbFiles) %><% } %>
          <% if (merge) {%><li><%= glp("ui.adm.jsync.log.merge") %><% } %>
          <% if (partial) {%><li><%= glp("ui.adm.jsync.log.partial") %><% } %>
          <% if (nbConflict > 0) {%><li><%= glp("ui.adm.jsync.log.conf", nbConflict) %> (<%= nbUU %> UU, <%= nbUD %> UD, <%= nbDU %> DU, <%= nbDD %> DD)<% } %>
          </ul>
        </td>
      </tr>
      </jalios:foreach>
    </table>
    <jalios:pager name="pager"/>
    <% } %>
  </div>
</div>

<%-- *** BUTTONS ************************************************** --%>
<form action='admin/jsync.jsp' method="post">
  <% if (replica.isJoined()) { %>
  <input class='btn btn-default' type='submit' name='opUpdateLeader' value='<%= glp("ui.adm.jsync.btn.upd-leader") %>' /> 
  <input class='btn btn-default' type='submit' name='opDisjoin' value='<%= glp("ui.adm.jsync.btn.disjoin") %>' />
  <% } else if (Util.notEmpty(formHandler.getLeaderUrl())) {%>
  <input class='btn btn-primary' type='submit' name='opJoin' value='<%= glp("ui.adm.jsync.btn.join") %>' />
  <% } %>
  <% if (replica.isLeader()) { %>
  <input class='btn btn-default' type='submit' name='opUpdateGroup' value='<%= glp("ui.adm.jsync.btn.upd-grp") %>' />
  <% } %>
</form>


<jalios:javascript>
  setSelectedTab("jsyncTab", <%= formHandler.getOpenTab() %>);
</jalios:javascript>

<p>&nbsp;</p>
<%@ include file='/admin/doAdminFooter.jspf' %>

