<%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  if (!isLogged) {
    return;
  }

  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  int    skip         = getIntParameter("skip", 0);

  Set<Workspace> tmp = new HashSet<Workspace>(Workspace.getAllWorkspaceSet(loggedMember));     
  Set<Workspace> workspaceSet = new TreeSet(Workspace.getNameComparator(userLang));

  autocomplete = autocomplete.replaceAll("\\(","\\\\(").replaceAll("\\)","\\\\)");
  DataSelector selector = new Workspace.TitleSelector(autocomplete, userLang);
  DataSelector modelSelector = new ReverseDataSelector(new Workspace.ModelWorkspaceSelector());
  
  for (Workspace itWorkspace : tmp) {
    if (!loggedMember.isWorker(itWorkspace)){
      continue;
    }
    if (!modelSelector.isSelected(itWorkspace)) { 
      continue;
    }
    
    if (Util.notEmpty(autocomplete) && !selector.isSelected(itWorkspace)){ 
      continue; 
    }
    workspaceSet.add(itWorkspace);
  }       

  int proposedResults = channel.getIntegerProperty("autocomplete.proposedresults.workspace", 
                        channel.getIntegerProperty("autocomplete.proposedresults", 
                        10));
  
  // Allow the set to be modified by a target
  request.setAttribute("ACResultCollection",workspaceSet);
  request.setAttribute("ACSelector", selector);
  request.setAttribute("ACProposedResult", new Integer(proposedResults));
  %><jalios:include target="AC_WORKSPACE_QUERY"/><jalios:include target="AC_WORKSPACE"/><%
  workspaceSet = (Set<Workspace>) request.getAttribute("ACResultCollection");
  
  boolean wkspcFilter = getBooleanParameter("workspaceFilter",true) || Util.toBoolean(jcmsContext.getAjaxRequestAttribute("workspaceFilter"),false);   
  jcmsContext.setAjaxRequestAttribute("workspaceFilter", wkspcFilter);

  int more = skip + proposedResults;
  
%><ul class="dropdown-menu"><%
  if (Util.isEmpty(workspaceSet) && Util.notEmpty(autocomplete)) { %>
  <li class="info results">
    <a href="#"><%= glp("ui.topbar.workspace.no-result") %></a>
  </li>  
  <%  
  } else {    
%>
  <% if (skip > 0) { %> 
  <li class="ajax-refresh previous">
    <a href="jcore/autocomplete/acworkspaceQuery.jsp?skip=<%= skip - proposedResults %>&amp;autocomplete=<%= encodeForURL(autocomplete) %>">
      <%= glp("ui.com.lbl.prev-result") %>
    </a>
  </li>
  <% } else { %>
  <li>
    <a href='<%= ServletUtil.getUrlWithUpdatedParam(request , "workspaceFilter" , ""+!wkspcFilter) %>'>
      <jalios:icon src="topbar-work-all-ws" title='<%= wkspcFilter ? glp("ui.work.mn.allworkspace") : glp("ui.work.mn.alt.filter",workspace.getTitle(userLang)) %>' />
      <%= glp("ui.work.mn.allworkspace") %>
    </a>
  </li>
  <% } %>
  
<%
  int i = proposedResults; boolean match = false; boolean first = true;
  Iterator it = null;
  for(it = workspaceSet.iterator(); it.hasNext() && i > 0; ){
    Workspace itWorkspace = (Workspace) it.next();
    if (skip > 0){ skip--; continue; }
    match = true;
    Data space = itWorkspace.isCollaborativeSpace() ? (Data) Util.getFirst(itWorkspace.getPublicationSet(channel.getClass("generated.CollaborativeSpace"))) : itWorkspace; 

%>
   <li <%= first ? "class='active'" : "" %>>
    <a href="<%= ServletUtil.getUrlWithUpdatedParams(request , new String[] { "ws", "workspaceFilter", "autocomplete"} , new String[] { itWorkspace.getId(), "true", null}) %>">
      <jalios:dataicon data="<%= space %>" /> <%= encodeForHTML(space.getDataName(userLang)) %>
    </a>
   </li><%
    i--; first = false; 
  }
%>

  <%  if (!match) { %> 
  <li class='nomatch'>
    <a href='#'><%= glp("ui.com.lbl.no-result") %></a></li>
  </li>
  <% } else if (i == 0 && it.hasNext()) { %>
  <li class='ajax-refresh next'>
    <a href="jcore/autocomplete/acworkspaceQuery.jsp?skip=<%= more %>&amp;autocomplete=<%= encodeForURL(autocomplete) %>">
      <%= glp("ui.com.lbl.next-result") %>
    </a>
  </li>
  <% } %>
   
<% } %>
</ul>      