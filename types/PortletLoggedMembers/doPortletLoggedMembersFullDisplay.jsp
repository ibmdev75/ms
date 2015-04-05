<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %> 
<%
  PortletLoggedMembers box = (PortletLoggedMembers) portlet;

if (box.getLimitPortletAccess()) {  // Do not display portlet to non workspace's members
  boolean belongsToWorskpace = isLogged && loggedMember.belongsToWorkspace(portal.getWorkspace());
  if (!belongsToWorskpace) {
    request.setAttribute("ShowPortalElement",Boolean.FALSE);
    return;
  }
}

Set loggedMemberSet;
if (!isLogged) {
  // if no user is not logged in, then display all user
  loggedMemberSet = JcmsSessionTracker.getLoggedMemberSet();
}
else {
  // members of current workspace
  if ("currentWorkspace".equals(box.getDisplayMembers())) {
    loggedMemberSet = new TreeSet();
    
    Set tmpSet = JcmsSessionTracker.getLoggedMemberSet();
    Workspace portalWorkspace = portal.getWorkspace();
    
    loggedMemberSet = Util.interSet(tmpSet,portalWorkspace.getMemberSet());
  }
  // members in same workspace as loggedMember
  else if ("loggedMemberWorkspace".equals(box.getDisplayMembers())){
    loggedMemberSet = new TreeSet();
    
    Set tmpSet = JcmsSessionTracker.getLoggedMemberSet();
    for (Iterator itMbr = tmpSet.iterator(); itMbr.hasNext(); ) {
      Member curMbr = (Member) itMbr.next();
      Set wkInterSet = Util.interSet(Workspace.getAllWorkspaceSet(loggedMember), Workspace.getAllWorkspaceSet(curMbr));
      if (wkInterSet.size() != 0) {
        loggedMemberSet.add(curMbr);
      }
    } 
  
  }
  // All members (default behavior)
  else { // if ("all".equals(box.getDisplayMembers()))
    loggedMemberSet = JcmsSessionTracker.getLoggedMemberSet();
  }
}

int maxMembers = box.getMaximumMembers();
if (Util.notEmpty(PortalManager.receiveAction(request, portlet, "displayAll"))) {
  maxMembers = -1;
}

%>
  <jalios:if predicate="<%= box.getDisplayNumbers() %>">
    <%-- *** Detailed numbers of connected user ******************************************* --%>
    <%
     int mbrNbr = loggedMemberSet.size();
     int guestNbr = channel.isAuthenticationRequired() ? 0 : JcmsSessionTracker.getUnauthenticatedNonRobotCount();
     int robotNbr = !isAdmin ? 0 : JcmsSessionTracker.getUnauthenticatedRobotCount();
     String mbrNbrStr = glp("ui.logged-mbrs.nbr-mbr", mbrNbr);
     String guestNbrStr = glp("ui.logged-mbrs.nbr-guest", guestNbr);
     String robotNbrStr = glp("ui.logged-mbrs.nbr-robot", robotNbr);
     ArrayList propParams = new ArrayList();
     if (mbrNbr != 0) { propParams.add(mbrNbrStr); }
     if (guestNbr != 0) { propParams.add(guestNbrStr); }
     if (robotNbr != 0) { propParams.add(robotNbrStr); }
     int usedProp = (mbrNbr != 0 ? 1 : 0) + (guestNbr != 0 ? 1 : 0) + (robotNbr != 0 ? 1 : 0);
     for (int i = usedProp; i < 3; i++) { propParams.add(null); }
    %>
   <p>
    <%= glp("ui.logged-mbrs.nbr-" + usedProp, 
                     new Integer(mbrNbr + guestNbr + robotNbr),
                     propParams.get(0), propParams.get(1), propParams.get(2)) %>
   </p>
  </jalios:if>

  <%-- *** Registered member list ******************************************* --%>
  <jalios:if predicate='<%= Util.notEmpty(loggedMemberSet) && !"none".equals(box.getDisplayMembers()) %>'>
	  <ul class="item-box">
	  <jalios:foreach collection="<%= loggedMemberSet %>" type="Member" name="itMbr" max='<%= maxMembers %>'>
	    <li class="items">
	    <jalios:memberphoto member="<%= itMbr %>" size="<%= PhotoSize.ICON %>"/>
      &nbsp;
      <jalios:if predicate="<%= box.getDisplayLinkToMembersProfile() %>"><a class="ctxTooltipCard ID_<%= itMbr.getId() %>" href="<jalios:url data='<%= itMbr %>'/>" <jalios:if predicate='<%= isAdmin %>'>title='<%= glp("ui.logged-mbrs.sessions", JcmsSessionTracker.getMemberSessionCount(itMbr)) %>'</jalios:if>></jalios:if>
        <%= itMbr.getFullName() %> 
      <jalios:if predicate="<%= box.getDisplayLinkToMembersProfile() %>"></a></jalios:if>
      </li>
	  </jalios:foreach>
	  <jalios:if predicate="<%= maxMembers != -1 && box.getMaximumMembers() < loggedMemberSet.size() %>">
	    <li>&nbsp;<a href="<%= PortalManager.sendAction(request, portlet, "displayAll", "true") %>" class="ajax-refresh"><%=glp("ui.com.txt.more")%></a></li>
	  </jalios:if>
	  </ul>
  </jalios:if>
