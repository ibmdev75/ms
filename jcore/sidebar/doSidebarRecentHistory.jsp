<%@ include file='/jcore/doInitPage.jspf' %><% 
%><%@ page import="com.jalios.jcms.recenthistory.*" %>
<div class="ajax-refresh-div">
  <% if (!jcmsContext.isAjaxRequest()) { %>
  <a class="sidebar-menu-item list-group-item ajax-refresh" href="jcore/sidebar/doSidebarRecentHistory.jsp">
    <jalios:icon src="sidebar-recent-history" /> <%= glp("ui.recenthistory.title") %>
    <span class="pull-right">
      <jalios:icon src="accordion-collapse"/>
    </span>
  </a>  
  <% } else { %>
  <a class="sidebar-menu-item list-group-item dropup"  data-jalios-action="toggle:hide toggle:dropup" data-jalios-target=".recent-history|this">
    <jalios:icon src="sidebar-recent-history" /> <%= glp("ui.recenthistory.title") %>
    <span class="pull-right">
      <jalios:icon src="accordion-collapse"/>
    </span>
  </a>  
  <div class="recent-history">
    <%  Collection recentMemberPubCollection = RecentHistoryManager.getInstance().getPubRecentHistory(loggedMember,null,5); %> 
    <jalios:foreach collection='<%= recentMemberPubCollection %>' type='Publication' name='itPub' skip="0" max='5'>
      <jalios:link data="<%= itPub %>" css="list-group-item sidebar-menu-item-sub"><jalios:dataicon data="<%= itPub %>"/> <%= itPub.getTitle(userLang) %></jalios:link>
    </jalios:foreach>
  </div>    
  <% } %>
</div>
