<%@ include file='/jcore/doInitPage.jspf' %><%
 Group ldapGroupBeingSync = com.jalios.jcms.ldap.SyncLdapHandler.getLdapGroupBeingSync(session);
 if (!checkAccess("admin/users/member") || !channel.isLdapEnabled() || ldapGroupBeingSync == null) {
   return;
 }
  boolean ldapGroupSyncDone = Util.toBoolean(session.getAttribute(com.jalios.jcms.ldap.SyncLdapHandler.LDAP_GROUP_SYNC_DONE), false);
%>

<% if (!jcmsContext.isAjaxRequest()) { %>
<div id="ldapSync" class='alert alert-info ajax-refresh-div'>
<% } %>

  <div id="ldapSyncTitle">
  <%
   if (!ldapGroupSyncDone) {
    %><%= glp("ui.adm.grp-list.msg.ldap-sync.title", ldapGroupBeingSync.getName()) %><%
   } else {
    %><%= glp("ui.adm.grp-list.msg.ldap-sync.title-done", ldapGroupBeingSync.getName()) %><%
   }
  %>
  </div>
  
  <div id="ldapSyncInfos">
   <%= com.jalios.jcms.ldap.SyncLdapHandler.getLdapGroupSyncProgressInformation() %>
  </div>
  
<%
 if (!ldapGroupSyncDone) { %>
 <jalios:javascript>
  var refreshLDAPStatus = function() {
    jQuery('#ldapSync').refresh({ 'url' : JcmsJsContext.getBaseUrl()+'/admin/ldapGroupSyncInfo.jsp' });
  };
  refreshLDAPStatus.delay(1);
 </jalios:javascript><%
 } else {
   // When process is over : 
   // -> if this is an ajax request : refresh the page so we can display uptodate groups in the surrounding UI
   // -> if this is a normal request : clear the group sync information
   if (jcmsContext.isAjaxRequest()) {%>
    <jalios:javascript>
     document.location = document.location;
    </jalios:javascript><%
   } else {
     com.jalios.jcms.ldap.SyncLdapHandler.clearLdapGroupBeingSync(session);
   }
 }
%>

<%@ include file='/jcore/doAjaxFooter.jspf' %>
<% if (!jcmsContext.isAjaxRequest()) { %>
</div><p>
<% } %>