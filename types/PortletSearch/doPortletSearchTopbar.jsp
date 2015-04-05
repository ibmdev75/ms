<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% 
	PortletSearch box = (PortletSearch) portlet;  
  String topBarSearchParam = Util.toBoolean(request.getAttribute("jcms.live-search.topbar"),false) ? "&amp;topbarSearch=true" : "";
  boolean isInstantSearch = box.getInstantSearch();
%>
<!-- Search zone -->
<div class="topbar-search-wrapper topbar-item">
  <div class="search-container">
    <!-- form tag for chrome  http://stackoverflow.com/a/15917221/1877464 -->
    <form autocomplete="off" action="<%= inFO ? ResourceHelper.getQuery() : ResourceHelper.getQueryWork() %>">
      <% if (isInstantSearch) { %>
        <input type="text"  name="text" data-jalios-ajax-refresh-url="/jcore/autocomplete/acsearch.jsp?portletId=<%= box.getId() %><%= topBarSearchParam %>" class="topbar-search-query typeahead" placeholder="<%= glp("ui.com.placeholder.search") %>" />
      <% } else { %>
        <input type="text"  name="text" class="topbar-search-query" placeholder="<%= glp("ui.com.placeholder.search") %>"  />
      <% } %>		       
      <jalios:icon css="search-icon" src="topbar-search"/>
	    <%@ include file='doQueryHandler.jsp' %>
      <%= formHandler.getHiddenParams() %>	  
      <% if (!inFO && getBooleanParameter("workspaceFilter",true)) { %>
      <input type="hidden" name="ws" value="<%= workspace.getId() %>" />
      <% } %>     
    </form>     
  </div>
</div>