<%@ include file="/jcore/doInitPage.jspf" %><%--  
--%><%@page import="com.jalios.jcms.analytics.*"%><%--  
--%><%@ page import="com.jalios.jcms.handler.AllMemberQueryHandler" %><%--  
--%><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%--  
--%><%

  PortletSearch portletSearch = getDataParameter("portletId", PortletSearch.class);
  
  if (portletSearch == null) {
    return;
  }
  
  request.setAttribute("jcms.live-search",true);
  boolean isTopBarSearch = getBooleanParameter("topbarSearch",false);
  
%><jalios:include target="LIVE_SEARCH_INIT" /><%
	
  String searchFilter = getUntrustedStringParameter("searchFilter","all");
  boolean portletSearchMembers = Util.arrayContains(portletSearch.getSearchIn(), "searchInMembers");
  String autocompleteText = getUntrustedStringParameter("autocomplete", "");
  
  //Search remove links (Only return member or publication items)
  boolean displayAll = searchFilter.equals("all");
  boolean displayPublication = displayAll || searchFilter.equals("pub");
  boolean displayMember = displayAll || searchFilter.equals("mbr");
  
  String memberRemoveLinkParams = "portletId=" + portletSearch.getId() + "&searchFilter=pub&autocomplete=" + autocompleteText; 
  String pubRemoveLinkParams = "portletId=" + portletSearch.getId() + "&searchFilter=mbr&autocomplete=" + autocompleteText; 
  boolean displayRemoveLink = portletSearchMembers && displayAll;

  List<String> midList = null;
	
	boolean refineWorkspace = false;  
	
	//Build query.jsp params 
	String queryParams = "";
	if (Util.notEmpty(portletSearch.getSearchIn())) {
		for (int i = 0;i < Util.getSize(portletSearch.getSearchIn());i++) {
			queryParams += "&amp;" + portletSearch.getSearchIn()[i] + "=true";
		}
	}
	
	if (Util.notEmpty(portletSearch.getSearchWith())) {
		queryParams += "&amp;searchWith=" + portletSearch.getSearchWith();
	}
	
	if (Util.notEmpty(portletSearch.getRefineQueries())) {
		queryParams += "&amp;refineQueries=" + portletSearch.getRefineQueries();
	  if (portletSearch.getRefineQueries().equals("CurrentWS")) {
	     refineWorkspace = true;
	     PortalInterface portal = jcmsContext.getPortal();
	     if (portal != null) {
	       queryParams += "&amp;portal=" + portal.getId();
       }
	  }
  }   
    
	//Member search  
	if (portletSearchMembers && (displayAll || displayMember)) {
	  AllMemberQueryHandler mqh = new AllMemberQueryHandler();
	  mqh.setRequest(request);
	  mqh.setText(autocompleteText);
	  mqh.setSort("relevance");
	  mqh.setLoggedMember(loggedMember);
	  midList = mqh.getIdResultList();
	}

	//Publication Search
	QueryHandler qh = portletSearch != null ? new QueryHandler(portletSearch.getQuery()) : new QueryHandler();
	qh.setRequest(request);
	qh.setText(autocompleteText);
	qh.setSearchedFields(new String[]{ com.jalios.jcms.search.LucenePublicationSearchEngine.TITLE_FIELD });
	qh.setLoggedMember(loggedMember);
	qh.setWorkspace(refineWorkspace ? workspace : null);
	qh.setCheckPstatus(true);
	qh.setSort("relevance");
	if (portletSearch == null) {
	  qh.setTypes(new String[]{"Content","UserContent"});
	}
	Set<Publication> pubSet = !displayPublication ? null : qh.getResultSet().getAsSortedSet(); 

	//Reset searched fields for query.jsp link
	qh.setSearchedFields(new String[]{});
    
	boolean hasResults = Util.notEmpty(pubSet) || Util.notEmpty(midList) || Util.toBoolean("jcms.live-search.hasResults",false);
	
	displayRemoveLink = Util.notEmpty(pubSet) && Util.notEmpty(midList);

	    //Clean 
	request.removeAttribute("jcms.live-search");
  
  String queryUrl;
  
  if (inFO) {
    queryUrl = ResourceHelper.getQuery() + "?" + qh.getQueryString() + queryParams;
  } else {
    queryUrl = ResourceHelper.getQueryWork() + "?" + qh.getQueryString() + queryParams;
    if (getBooleanParameter("workspaceFilter",true)) {  
      queryUrl = queryUrl + "&amp;ws=" + workspace.getId();
    }
  }
%>
<div data-jalios-ajax-refresh-url="jcore/autocomplete/acsearch.jsp" class="typeahead-menu noTooltipCard typeahead-search ajax-refresh-div<%= isTopBarSearch ? " typeahead-search-topbar" : ""%>">
  <ul class="list-group nobr"<%= hasResults ? "" : " style=\"display:none;\"" %>>
    <jalios:include target="LIVE_SEARCH_TOP" targetContext="LI" />
    
    <li class="list-group-item clickable typeahead-search-full">
      <a href="<%= queryUrl %>" ><jalios:icon src="topbar-search-more"/> <%= glp("ui.work.search.topbar.complete-search") %></a>
    </li>
    
    <jalios:include target="LIVE_SEARCH_TOP_2" targetContext="LI" />
    
    <% if (Util.notEmpty(midList) || Util.notEmpty(pubSet)) { %>
    
      <% if (((displayAll || displayMember) &&  Util.notEmpty(midList))) { %>
      <li class="list-group-item clickable typeahead-layout typeahead-search-mbr"><% if (displayRemoveLink) { %><a href="#" onclick="return false;" class="pull-right typeahead-search-remove typeahead-ajax-refresh" data-jalios-typeahead-options-params="<%= memberRemoveLinkParams %>"><jalios:icon src="topbar-search-remove"/></a><% } %><%= glp("ui.com.lbl.members") %></li>
      <jalios:foreach collection="<%= midList %>" name="itMemberId" type="String" max="<%= Util.getSize(pubSet) > 4 ? 5 : 10 - Util.getSize(pubSet) %>">
        <% 
          Member itMember = channel.getMember(itMemberId);
          if (itMember != null) {
            String organization = Util.getString(itMember.getOrganization(),"");
            String jobTitle = Util.getString(itMember.getJobTitle(),"");
        %>
        <li class="list-group-item clickable media typeahead-result-mbr">
          <jalios:memberphoto member="<%= itMember %>" link="false" css="pull-left" size="<%= PhotoSize.TINY %>"/>
			    <div class="media-body">
  			    <div class="media-heading typeahead-result-mbr-name">
              <jalios:link data="<%= itMember %>" css="media" title="<%= itMember.getDataName(userLang) %>">
              <%= encodeForHTML(itMember.getFullName()) %>
              </jalios:link>
            </div>
				    <span class="info"><%= organization %><%= Util.notEmpty(jobTitle) ? " &middot; " : "" %><%= jobTitle %></span>
            <% if (Util.notEmpty(itMember.getPhone()) || Util.notEmpty(itMember.getMobile())) { %>
              <br/>
              <span class="info">
                <% if (Util.notEmpty(itMember.getMobile())) { %><jalios:icon src="phone" /> <jalios:phone number="<%= itMember.getMobile() %>" region="<%= itMember.getCountry() %>" /> &middot;<% } %></span>
                <% if (Util.notEmpty(itMember.getPhone())) { %><jalios:icon src="telephone"/> <jalios:phone number="<%= itMember.getPhone() %>" region="<%= itMember.getCountry() %>" /><% } %>
            <% } %>
          </div>
        </li> 
      <% } %>
      </jalios:foreach>
      <% } %>
      
      <jalios:include target="LIVE_SEARCH_MIDDLE" targetContext="LI" />
      
      <% if ((displayAll || displayPublication) && Util.notEmpty(pubSet)) { %>
        <% if (portletSearchMembers) { %>
        <li class="list-group-item clickable typeahead-layout typeahead-search-pub" ><% if (displayRemoveLink) { %><a href="#" onclick="return false;" class="pull-right typeahead-search-remove typeahead-ajax-refresh" data-jalios-typeahead-options-params="<%= pubRemoveLinkParams %>"><jalios:icon src="topbar-search-remove"/></a><% } %><%= glp("ui.com.lbl.publications") %></li>
        <% } %>
        <jalios:foreach collection="<%= pubSet %>" name="itPublication" type="Publication" max="<%= Util.getSize(midList) > 4 ? 5 : 10 - Util.getSize(midList) %>">
          <li class="list-group-item clickable typeahead-result-pub">
            <jalios:link data="<%= itPublication %>" title="<%= itPublication.getDataName(userLang) %>" ><jalios:dataicon data="<%= itPublication %>"/> <%= itPublication.getDataName(userLang) %></jalios:link>
          </li> 
        </jalios:foreach>      
      <% } %>
    <% } %>  
    <jalios:include target="LIVE_SEARCH_BOTTOM" targetContext="LI" />
  </ul>
</div><%

EventData eventData = new EventData(AnalyticsManager.AC_SEARCH,loggedMember, null, null, request); 
Map<String, String> contextMap = AnalyticsManager.generateAccessContextMap(request, eventData);
String statQueryString = qh.getQueryString();
//log an event data 
 if(statQueryString != null){
   contextMap.put(AnalyticsManager.QUERYSTRING,statQueryString);
 }
 AnalyticsManager.processQueries(contextMap);
 eventData.getContext().putAll(contextMap);
 AnalyticsManager.appendEventData(eventData, request);

%>