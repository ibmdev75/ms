<%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  if (!isLogged) {
    return;
  }

  String topbarLocationAttribute = Util.getString(request.getAttribute("jcms.topbar.topbar-location"), "");
  String topbarLocationParameter = getUntrustedStringParameter("topbarLocation","");
  
  boolean isSiteTopbar = topbarLocationParameter.equals("site") || topbarLocationAttribute.equals("site");
  boolean isWorkTopbar = topbarLocationParameter.equals("work") || topbarLocationAttribute.equals("work");
  boolean isAdminTopbar = topbarLocationParameter.equals("admin") || topbarLocationAttribute.equals("admin");

  String queryString = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
 
  SortedSet<Workspace> workspaceSet = new TreeSet(Workspace.getNameComparator(userLang));
  
  boolean withPortal = !isWorkTopbar && !isAdminTopbar;
  boolean showModel = isWorkTopbar || isAdminTopbar;

  if (Util.isEmpty(queryString)) {
    workspaceSet.addAll(TopbarUtil.getMemberInitialWorkspaceSet(loggedMember, userLang, withPortal, showModel));
  } else {
    workspaceSet.addAll(TopbarUtil.getMemberSearchedWorkspaceSet(loggedMember, userLang, queryString, withPortal, showModel));
  }
  
  //Allow the set to be modified by a target
  request.setAttribute("topbar.workspace.list.set",workspaceSet);
  %><jalios:include target="TOPBAR_WORKSPACE_FILTER"/><%
  workspaceSet = (SortedSet<Workspace>) request.getAttribute("topbar.workspace.list.set");
  
  boolean allowWkspFilter = Util.toBoolean(request.getAttribute("allowWkspFilter"),true) || Util.toBoolean(jcmsContext.getAjaxRequestAttribute("allowWkspFilter"),true);
  boolean wkspcFilter = getBooleanParameter("workspaceFilter",true) || Util.toBoolean(jcmsContext.getAjaxRequestAttribute("workspaceFilter"),false);  
  
  jcmsContext.setAjaxRequestAttribute("allowWkspFilter", allowWkspFilter);
  jcmsContext.setAjaxRequestAttribute("workspaceFilter", wkspcFilter);

%>
<div class="typeahead-menu noTooltipCard ajax-refresh-div topbar-ws-list" id="topbar-typeahead-menu" <% if (!jcmsContext.isAjaxRequest()) { %>style="display:none"<% } %>>
  <ul class="list-group nobr">
<%
  if (Util.isEmpty(workspaceSet) && Util.notEmpty(queryString)) { %>
  <li class="list-group-item list-group-item-info">
    <%= glp("ui.topbar.workspace.no-result") %>
  </li>
  <%  
  } else {
%>
  <% if (isWorkTopbar && allowWkspFilter && wkspcFilter) { %>
  <%-- Display all workspace link --%>
  <li class="list-group-item clickable">
    <a href='<%= ServletUtil.getUrlWithUpdatedParam(request , "workspaceFilter" , ""+!wkspcFilter) %>'>
      <jalios:icon src="topbar-work-all-ws" title='<%= wkspcFilter ? glp("ui.work.mn.allworkspace") : glp("ui.work.mn.alt.filter",workspace.getTitle(userLang)) %>' />
      <%= glp("ui.work.mn.allworkspace") %>
    </a>
  </li>
  <% } %>
  <jalios:foreach collection="<%= workspaceSet %>" name="itWorkspace" type="Workspace">
    <% 
      request.setAttribute("jcms.topbar.workspace-list.workspace",itWorkspace);
      PortalElement itPortal = (PortalElement) itWorkspace.getHomePortal();
      Data dataIcon = itPortal == null ? itWorkspace : itPortal;
    %>
    <% if ((isWorkTopbar || isAdminTopbar) && itPortal != null) { %>
    <%-- Work or admin on a workspace with a portal --%>
    <li class="list-group-item list-group-item-extended">
      <jalios:include target="TOPBAR_WORKSPACE_LIST_LINK_PREFIX"/>
      <a class="typeahead-link" href="work/pubBrowser.jsp?ws=<%= itWorkspace.getId() %>" >
        <jalios:include target="TOPBAR_WORKSPACE_LINK_PREFIX"/>
        <jalios:dataicon data="<%= dataIcon %>" css="topbar-icon" title="" /> <%= encodeForHTML(itWorkspace.getDataName(userLang)) %>
        <jalios:include target="TOPBAR_WORKSPACE_LINK_SUFFIX"/>
      </a>
      <% if (isLogged && loggedMember.isWorker(itWorkspace)){ %>          
      <jalios:link css="typeahead-link list-group-item-action" data="<%= itWorkspace %>">
        <jalios:icon src="topbar-home"/>
      </jalios:link>  
      <% } %>
      <jalios:include target="TOPBAR_WORKSPACE_LIST_LINK_SUFFIX"/>
    </li> 
    <% } else if (isWorkTopbar || isAdminTopbar) { %>
    <%-- Work or admin on a workspace without a portal --%>
    <li class="list-group-item clickable">
      <jalios:include target="TOPBAR_WORKSPACE_LIST_LINK_PREFIX"/>
      <a class="typeahead-link list-group-item-action" href="work/pubBrowser.jsp?ws=<%= itWorkspace.getId() %>" >
        <jalios:include target="TOPBAR_WORKSPACE_LINK_PREFIX"/>
        <jalios:dataicon data="<%= dataIcon %>" css="topbar-icon" /> <%= encodeForHTML(itWorkspace.getDataName(userLang)) %>
        <jalios:include target="TOPBAR_WORKSPACE_LINK_SUFFIX"/>
      </a>    
      <jalios:include target="TOPBAR_WORKSPACE_LIST_LINK_SUFFIX"/>
    </li>
    <% } else { %>
      <%-- Front office workspace display --%>
      <li class="list-group-item clickable broker" data-jalios-action="link" data-jalios-url="<%= itWorkspace.getDisplayUrl(userLocale) %>">
        <jalios:include target="TOPBAR_WORKSPACE_LIST_LINK_PREFIX"/>
        <jalios:link data="<%= itWorkspace %>">
          <jalios:include target="TOPBAR_WORKSPACE_LINK_PREFIX"/>
          <jalios:dataicon data="<%= dataIcon %>" css="topbar-icon" /> <%= encodeForHTML(itWorkspace.getDataName(userLang)) %>
          <jalios:include target="TOPBAR_WORKSPACE_LINK_SUFFIX"/>
        </jalios:link>
        <jalios:include target="TOPBAR_WORKSPACE_LIST_LINK_SUFFIX"/>
      </li>
    <% } %>     
    <% request.removeAttribute("jcms.topbar.workspace-list.workspace"); %>
  </jalios:foreach>
<% } %>
  </ul>
</div>      