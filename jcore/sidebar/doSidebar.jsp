<%@ include file='/jcore/doInitPage.jspf' %><% 
  if (!channel.getBooleanProperty("channel.sidebar.enabled",true)) {
    return;
  }
  
  if (!isLogged) {
    return;
  }

  Member delegateMember = channel.getCurrentDelegateMember();
%>
<div class="site-sidebar sidebar-component noTooltipCard">
  <a class="btn btn-default btn-xs sidebar-close sidebar-closer " data-jalios-target=".site-sidebar">
    <%= glp("ui.com.btn.close") %>
  </a>   
   
  <div class="sidebar-header media">
    <!-- Avatar -->
    <jalios:memberphoto css="pull-left" showStatus="false" member="<%= loggedMember%>" size="<%= PhotoSize.SMALL %>"	/>
      
    <!-- Link to profile, edit profile, and log-out -->
    <div class="media-body">
      <div class="sidebar-header-member-name">
        <jalios:link data="<%= loggedMember %>"/>
      </div>
    
      <div class="sidebar-header-buttons btn-group">
        <jalios:include target="SIDEBAR_MEMBER_BTN" />
        
        <a class="btn btn-default" href="<%= channel.getProperty("jcms.resource.member-profile") %>" title="<%= glp("ui.com.foot.profile") %>">
          <jalios:icon src="sidebar-profile"/>
        </a>
        <% if (delegateMember == null) { %>
          <jalios:login css="btn btn-default btn-text-success" displayLogout="false" displaySuLogin="true" displaySuLogout="false" loginIcon="sidebar-login" />
          <jalios:login css="btn btn-default btn-text-danger" displayLogin="false" displaySuLogin="false" displaySuLogout="false" logoutIcon="sidebar-logout" />
        <% } else { %>
          <jalios:login css="btn btn-default btn-text-success" displayLogout="false" displaySuLogin="true" displaySuLogout="false" loginIcon="sidebar-login" />
          <jalios:login css="btn btn-default btn-text-danger" displayLogout="false" displaySuLogin="false" displaySuLogout="true" logoutIcon="sidebar-logout" />
        <% } %>
      </div>
    </div>
  </div>
  
   <%-- LOGBACK --%>
  <% 
   if (delegateMember != null) { %>
  <div class="sidebar-reconnect-as alert alert-danger">
  	<div class="reconnect-label"><%= glp("ui.fo.login.txt.menu.logback") %></div>
    <ul class="list-unstyled">
    <% 
      List<Member> suHistoryList = com.jalios.jcms.authentication.handlers.DelegationAuthenticationHandler.getSuHistory(request);
      for (Member suMbr : suHistoryList) {
        String logBackLink = com.jalios.jcms.authentication.handlers.DelegationAuthenticationHandler.getSuLink(suMbr);
        %>
        <li>
         <a href="<%= logBackLink %>">
          <jalios:memberphoto link="<%= false %>" member="<%= suMbr %>" size="<%= PhotoSize.ICON %>"/> 
          <%= encodeForHTML(suMbr.getFullName()) %>
         </a>
        </li>
        <%
      }
    %>
    </ul>
  </div>
  <% } %>
  
  <jalios:include target="SIDEBAR_TOP" />
  
  <%@ include file='/jcore/sidebar/doSidebarMenu.jspf' %>
  
  <jalios:include target="SIDEBAR_BOTTOM" />
</div><!-- .sidebar -->