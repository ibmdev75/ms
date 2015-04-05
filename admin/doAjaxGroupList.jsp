<%@page import="com.jalios.jcms.handler.*"%><%@ include file='/jcore/doInitPage.jspf' %><%

  int formElementCount                   = Util.toInt(jcmsContext.getAjaxRequestAttribute("formElementCount"), 0);
  GroupQueryHandler groupQueryHandler    = (GroupQueryHandler)jcmsContext.getAjaxRequestAttribute("groupQueryHandler"); 
  String groupText                       = (String)jcmsContext.getAjaxRequestAttribute("groupText");
  Workspace grpWorkspace                 = (Workspace)jcmsContext.getAjaxRequestAttribute("grpWorkspace");
  String  guiExportCSV                   = Util.getString(jcmsContext.getAjaxRequestAttribute("guiExportCSV"), null);
  boolean guiLastLDAPSync                = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiLastLDAPSync"), true);
  boolean guiRemoveGroup                 = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiRemoveGroup"), true);
  boolean guiShowAllGroups               = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowAllGroups"), false) && grpWorkspace != null;
  boolean guiShowAddGroup                = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowAddGroup"), true);
  boolean guiShowCdate                   = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowCdate"), true);
  boolean guiShowCookie                  = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowCookie"), true);
  boolean guiShowExt                     = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowExt"), true);
  boolean guiShowId                      = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowId"), true);
  boolean guiShowMembers                 = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowMembers"), true);
  boolean guiShowName                    = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowName"), true);
  boolean guiShowAcl                     = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowAcl"), true);
  boolean guiShowOrder                   = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowOrder"), true);
  boolean guiShowPager                   = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowPager"), true);
  boolean guiShowParent                  = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowParent"), true);
  boolean guiShowSearchGroup             = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowSearchGroup"), true);
  boolean guiShowWebdav                  = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowWebdav"), true);
  boolean guiShowWorkspace               = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowWorkspace"), true);
  boolean guiShowVisibility              = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("guiShowVisibility"), true);
  boolean isDetailView                   = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("isDetailView"), true);
  Group ldapGroupBeingSync               = (Group)jcmsContext.getAjaxRequestAttribute("ldapGroupBeingSync");
  String alertUrl                         = (String)jcmsContext.getAjaxRequestAttribute("alertUrl");
  String memberListUrl                   = (String)jcmsContext.getAjaxRequestAttribute("memberListUrl");
  String dbmemberListUrl                 = (String)jcmsContext.getAjaxRequestAttribute("dbmemberListUrl");
  Group parentGroup                      = (Group)jcmsContext.getAjaxRequestAttribute("parentGroup");
  String redirectRefresh                 = (String)jcmsContext.getAjaxRequestAttribute("redirectRefresh");
  Set<Group> selectedGroups              = (Set<Group>)jcmsContext.getAjaxRequestAttribute("selectedGroups");
  boolean showCheckInsert                = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("showCheckInsert"), true);
  boolean showDetailView                 = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("showDetailView"), true);
  boolean showRadioInsert                = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("showRadioInsert"), true);
  String target                          = (String)jcmsContext.getAjaxRequestAttribute("target");

  String redirect = Util.getString(jcmsContext.getAjaxRequestAttribute("redirect"), "admin/groupList.jsp");
  Set<Group> groupSet = (Set<Group>)jcmsContext.getAjaxRequestAttribute("groupSet");

  // Build a list of groups of this page for selection
  ArrayList groupsOnPage = new ArrayList();
  
  String additionalWSTitle = Util.getString((String) jcmsContext.getAjaxRequestAttribute("additionalWSTitle"), "");
  boolean showSyncLDAP = channel.isLdapEnabled() && ldapGroupBeingSync == null && 
                         (checkAccess("admin/users/group") || workspace.isAdmin(loggedMember) || checkAccess("admin-ws/users/group")) && 
                         parentGroup != null && Util.notEmpty(parentGroup.getLdapDN());
%>
<jalios:pager name='glPagerHandler' declare='true' action='init' sort='name' />
<%
  String oldSort = (String)jcmsContext.getAjaxRequestAttribute("sort");
  String oldReverse = (String)jcmsContext.getAjaxRequestAttribute("reverse");
  String newReverse = Boolean.toString(glPagerHandler.isReverse());

  if ( Util.isSameContent(oldSort, glPagerHandler.getSort()) || 
       ( Util.isEmpty(oldSort) && Util.isEmpty(glPagerHandler.getSort()) ) || 
       Util.isSameContent(oldReverse, newReverse)  ) {
    Comparator<? super Group> groupComparator = ComparatorManager.getComparator(Group.class, glPagerHandler.getSort(), glPagerHandler.isReverse());
    groupSet = groupQueryHandler.getResultSet(groupComparator);
    jcmsContext.setAjaxRequestAttribute("groupSet", groupSet);
    jcmsContext.setAjaxRequestAttribute("sort", glPagerHandler.getSort());
    jcmsContext.setAjaxRequestAttribute("reverse", Boolean.toString(glPagerHandler.isReverse()));
  }
%>
<div class="ajax-refresh-div" id='doGroupList'>
<a href="admin/doAjaxGroupList.jsp" class="ajax-refresh-url" style="display:none;"></a>
<jalios:pager name='glPagerHandler' action='compute' size='<%= groupSet.size() %>' />

  <%-- NAVBAR --%>
  <%@ include file="/admin/doGroupListNavbar.jspf" %>

<form name='editForm' action="<%= ServletUtil.getResourcePath(request) %>"> 
<table id='groupTable' class="table-data table-condensed">
  <tr>
    <%-- --- HEADER / WIDGET --------------------------- --%>
    <% if (showRadioInsert ) { %>
    <th width='1%' class="nowrap">&nbsp;</th>
    <% } %>
    <% if (showCheckInsert ) { %>
   <th>
      <input type='checkbox' id="selectAllCheckbox" title="<%= glp("ui.adm.grp-list.btn.select-all") %>"
             onclick='checkAll(document.editForm, "groups", this); selectAllGroupsOnPage(this); disableAllCheckbox();' checked /><% formElementCount++; %>
    </th>
    <% } %>
    <%-- --- HEADER / DETAILLED VIEW ICON - CSV EXPORT --------------------------- --%>
   <th width='1%' class="nowrap">
      <% if (showDetailView) { %>
        <% if (isDetailView) { %>
        <a href='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"detail"}, new String[] {"false"}) %>' title="<%= glp("ui.work.pub.txt.s-view") %>"><jalios:icon src='simple-list'/></a>
        <% } else { %>
        <a href='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"detail"}, new String[] {"true"}) %>' title="<%= glp("ui.work.pub.txt.d-view") %>"><jalios:icon src='detailled-list'/></a>
        <% } %>
      <% } %>
    <jalios:caddy action='add' groupQueryString='<%= Util.getString(groupQueryHandler.getQueryString(), "all=true") %>'/>
    <% if (!Util.isEmpty(guiExportCSV)) { %>
     <a href="<%= guiExportCSV %>"><jalios:icon src="csv"  title='<%= glp("ui.com.btn.csv") %>' alt="csv" /></a> 
    <% } %>
    </th>
    <%-- --- HEADER / NAME --------------------------- --%>
    <% if (guiShowName ) { %>
   <th width='100%' nowrap="nowrap">
      <% /* %>Name<% */ %><%= glp("ui.com.lbl.name") %>
      <jalios:pager name='glPagerHandler' action='showSort' sort='name'/>
    </th>
    <% } %>
    <%-- --- HEADER / ACL --------------------------- --%>
    <% if (guiShowAcl) { %>
   <th nowrap="nowrap">
      <% /* %>ACL<% */ %><%= glp("ui.adm.mbr-edit.lbl.acl") %>
      <jalios:pager name='glPagerHandler' action='showSort' sort='acl'/>
    </th>
    <% } %>
    <%-- --- HEADER / PARENT --------------------------- --%>
    <% if (guiShowParent ) { %>
   <th nowrap="nowrap">
      <%= glp("ui.com.lbl.parent-grp") %>
    </th>
    <% } %>
    <%-- --- HEADER / WORKSPACE --------------------------- --%>
    <% if (guiShowWorkspace ) { %>
   <th width='100%' nowrap="nowrap">
      <% /* %>Workspace<% */ %><%= glp("ui.com.lbl.workspace") %>
    </th>
    <% } %>
    <%-- --- HEADER / VISIBILITY --------------------------- --%>
    <% if (guiShowVisibility ) { %>
   <th width='100%' nowrap="nowrap">
      <%= glp("ui.adm.grp-list.lbl.visibility") %>
    </th>
    <% } %>
    <%-- --- HEADER / #MBR --------------------------- --%>
    <% if (guiShowMembers ) { %>
     <th nowrap="nowrap">
        <% /* %>#Members<% */ %><%= glp("ui.adm.grp-list.lbl.mbr-cnt") %>
        <jalios:pager name='glPagerHandler' action='showSort' sort='size'/>
      </th>
     <th nowrap="nowrap">
        <% /* %>#DBMembers<% */ %><%= glp("ui.adm.grp-list.lbl.db-mbr-cnt") %>
      </th>      
    <% } %>
    <%-- --- HEADER / WEBDAV --------------------------- --%>
    <% if (guiShowWebdav ) { %>
   <th nowrap="nowrap">
      <% /* %>Webdav<% */ %><%= glp("ui.com.lbl.webdav") %>
      <jalios:pager name='glPagerHandler' action='showSort' sort='webdav'/>
    </th>
    <% } %>
    <%-- --- HEADER / ORDER --------------------------- --%>
    <% if (guiShowOrder ) { %>
   <th nowrap="nowrap">
      <% /* %>Order<% */ %><%= glp("ui.adm.grp-list.lbl.order") %>
      <jalios:pager name='glPagerHandler' action='showSort' sort='order'/>
    </th>
    <% } %>
    <%-- --- HEADER / COOKIE --------------------------- --%>
    <% if (guiShowCookie ) { %>
     <th nowrap="nowrap">
        <% /* %>Cookie Max-Age<% */ %><%= glp("ui.adm.grp-list.lbl.max-age") %>
      </th>
    <% } %>
    <%-- --- HEADER / CDATE --------------------------- --%>
    <% if (guiShowCdate ) { %>
     <th nowrap="nowrap">
        <% /* %>Created<% */ %><%= glp("ui.com.lbl.cdate") %>
        <jalios:pager name='glPagerHandler' action='showSort' sort='date'/>
      </th>
    <% } %>
    <%-- --- HEADER / EXT --------------------------- --%>
    <% if (guiShowExt ) { %>
     <th nowrap="nowrap">
        <% /* %>Ext.<% */ %><%= glp("ui.adm.grp-list.lbl.ext") %>
      </th>
    <% } %>
    <%-- --- HEADER / LDAP LAST SYNCHRO --------------------------- --%>
    <% if (channel.isLdapEnabled() && guiLastLDAPSync ) { %>
     <th nowrap="nowrap">
        <% /* %> LDAP Sync.<% */ %><%= glp("ui.com.lbl.ldap-sync") %>
        <jalios:pager name='glPagerHandler' action='showSort' sort='lastLdapSync'/>
      </th>
    <% } %>
    <%-- --- HEADER / ID --------------------------- --%>
    <% if (guiShowId ) { %>
     <th nowrap="nowrap">
        <% /* %>ID<% */ %><%= glp("ui.com.lbl.id") %>
        <jalios:pager name='glPagerHandler' action='showSort' sort='id'/>
      </th>
    <% } %>
    <%-- --- HEADER / ACTION --------------------------- --%>
    <th nowrap="nowrap">&nbsp;</th>
  </tr>
  <jalios:foreach name="itGroup" 
                  type="Group"
                  collection="<%= groupSet %>"
                  max="<%=  guiShowPager ? glPagerHandler.getPageSize() : groupSet.size() %>"
                  skip="<%= guiShowPager ? glPagerHandler.getStart() : 0 %>">
  <% groupsOnPage.add(itGroup); %> 
  <tr> 
    <%-- --- HEADER / WIDGET --------------------------- --%>
    <% if (showRadioInsert ) { %>
      <% String label = HttpUtil.encodeForJavaScript(itGroup.getName(userLang)); %>
      <td class="text-right" nowrap="nowrap"><input type="radio" onclick="javascript:insertLink('<%= itGroup.getId() %>', '<%= label %>')" /></td>
    <% } %>
    <% if (showCheckInsert ) { %>
      <td class="text-right" nowrap="nowrap">
        <%
          Set workingSet = new TreeSet(selectedGroups);
          if (selectedGroups.contains(itGroup)) { workingSet.remove(itGroup); }
          else { workingSet.add(itGroup); }
          String newGroupsValue = JcmsUtil.dataListToString(workingSet, ",");
        %>
        <input type="checkbox" name="groups" <%= selectedGroups.contains(itGroup) ? "checked" : "" %>
               onclick="disableAllCheckbox(); document.location='<%= ServletUtil.getAbsUrlWithUpdatedParam(request, "groups", newGroupsValue)%>'"/><% formElementCount++; %>
      </td>
    <% } %>
    <%-- --- GRP / COUNTER --------------------------- --%>
    <td class="text-right" nowrap="nowrap">
      <%= glPagerHandler.getStart() + itCounter.intValue() %>.
      <jalios:edit data='<%= itGroup %>' target='<%= target %>' redirect='<%= redirectRefresh %>'/>
    </td>
    <%-- --- GRP / NAME --------------------------- --%>
    <% if (guiShowName) { %>
      <td nowrap="nowrap">
        <% boolean hasMultipleParent = itGroup.hasMultipleParent(); %>
        <%= itGroup.getIcon(userLang, true) %> 
        <a href="<%= ServletUtil.getResourcePath(request) %>?gid=<%= itGroup.getId() %>" class="ID_<%= itGroup.getId() %> ctxTooltipCard">
          <%= hasMultipleParent ? "<i>" : "" %><%= itGroup.getName(userLang) %><%= hasMultipleParent ? "</i>" : "" %>
        </a>
        <%= itGroup == channel.getDefaultGroup() ? " (" + glp("ui.adm.prop.mbr.def-grp") + ")" : "" %>
        <jalios:checkIntegrity data='<%= itGroup %>' />
        <% if (Util.notEmpty(itGroup.getDescription())) { %>
        <jalios:tooltip><jalios:wiki><%= itGroup.getDescription() %></jalios:wiki></jalios:tooltip>
        <% } %>
      </td>
    <% } %>
    <%-- --- GRP / ACL --------------------------- --%>
    <% if (guiShowAcl) { %>
      <td nowrap="nowrap">
        <% if (itGroup.getAccessControlList() != null) { %>
        <jalios:edit data='<%= itGroup.getAccessControlList() %>'/>
         <% if (isAdmin) { %>
          <a href="admin/accessManager.jsp?id=<%= itGroup.getAccessControlList().getId()%>"><%= itGroup.getAccessControlList().getName() %></a>
         <% } else if (isWSAdmin) { %>
          <a href="work/workAccessAudit.jsp?id=<%= itGroup.getAccessControlList().getId()%>"><%= itGroup.getAccessControlList().getName() %></a>
         <% } else {%>
          <%= itGroup.getAccessControlList().getName() %>
         <% } %>
        <% } %>
      </td>
    <% } %>
    <%-- --- GRP / PARENT --------------------------- --%>
    <% if (guiShowParent) { %>
      <td nowrap="nowrap">
      <% if (Util.notEmpty(itGroup.getParentSet())) { %>
        <ul>
        <jalios:foreach collection='<%= itGroup.getParentSet() %>' name='itParent' type='Group' counter="itParentCounter">
          <li><%= itParent.getIcon(userLang, true) %>  <a href='<%= ServletUtil.getResourcePath(request) %>?gid=<%= itParent.getId() %>' class="ID_<%= itParent.getId() %> ctxTooltipCard"><%= itParent %></a></li>
        </jalios:foreach>
        </ul>
       <% } %>
      </td>
    <% } %>
    <%-- --- GRP / WORKSPACE --------------------------- --%>
    <% if (guiShowWorkspace ) { %>
      <td nowrap="nowrap"><% if (itGroup.getWorkspace() != null ) { %><a href='<%= ServletUtil.getResourcePath(request) %>?groupFilter=<%= itGroup.getWorkspace().getId() %>'><%= itGroup.getWorkspace().getTitle(userLang) %></a><% } %></td>
    <% } %>
    <%-- --- GRP / VISIBILITY --------------------------- --%>
    <% if (guiShowVisibility ) { %>
      <td nowrap="nowrap"><%= glp("ui.adm.grp-list.lbl.visibility." + itGroup.getVisibility()) %></td>
    <% } %>
    <%-- --- GRP / #MBR --------------------------- --%>
    <% if (guiShowMembers ) { %>
      <% 
        int memberCount = itGroup.getMemberSet().size();
        int dbMemberCount = itGroup.getDBMemberCount();
      %>
      <td>
        <% if (!(showCheckInsert || showRadioInsert) && memberCount > 0 ) { %>
        <div class="text-center">
                <a href="<%= memberListUrl %>?gid=<%= itGroup.getId() %>&amp;isAllMemberList=false" title="<%= glp("ui.com.lbl.n-member",memberCount) %>"><%= memberCount %></a>
        </div>
        <% } else { %>
         <div class="text-center"> 
            <%= memberCount %>
        </div>
        <% } %>
      </td>
      <td class="text-center">
        <div class="text-center">
            <a href="admin/dbmemberList.jsp?gid=<%= itGroup.getId() %>&amp;showTree=true" title="<%= glp("ui.com.lbl.n-dbmember",dbMemberCount) %>"><%= dbMemberCount %></a>
        </a>
      </td>
    <% } %>
    <%-- --- GRP / WEBDAV --------------------------- --%>
    <% if (guiShowWebdav ) { %>
      <td class="text-center"><%= itGroup.getWebdavAccess() ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
    <% } %>
    <%-- --- GRP / ORDER --------------------------- --%>
    <% if (guiShowOrder ) { %>
      <td class="text-right"><%= itGroup.getOrder() %></td>
    <% } %>
    <%-- --- GRP / COOKIE --------------------------- --%>
    <% if (guiShowCookie ) { %>
      <td class="text-right" nowrap="nowrap">
        <% if (itGroup.getCookieMaxAge() == 0) { %>
          <% /* %>Default Value<% */ %><%= glp("ui.adm.grp-edit.lbl.max-age.def") %> (<jalios:duration time='<%= 1000L * channel.getIntegerProperty("cookie.max-age", JcmsConstants.COOKIE_MAX_AGE) %>'/>)
        <% } else { %>
          <jalios:duration time='<%= 1000L * itGroup.getCookieMaxAge() %>'/>
        <% } %>
      </td>
    <% } %>
    <%-- --- GRP / CDATE --------------------------- --%>
    <% if (guiShowCdate ) { %>
      <td class="text-right"><jalios:date date='<%= itGroup.getCdate() %>' format='<%= "short" %>'/></td>
    <% } %>
    <%-- --- GRP / EXT --------------------------- --%>
    <% if (guiShowExt ) { %>
      <td class="text-center"><%= itGroup.getExtension() != null ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
    <% } %>
    <%-- --- MBR / LDAP LAST SYNCHRO --------------------------- --%>
    <% if (channel.isLdapEnabled() && guiLastLDAPSync ) { %>
      <td class="text-right"><jalios:date date='<%= itGroup.getLastLdapSynchro() %>' format='<%= "short" %>'/></td>
    <% } %>
    <%-- --- GRP / ID --------------------------- --%>
    <% if (guiShowId ) { %>
      <td><%= itGroup.getId() %></td>
    <% } %>
    <td align='left' nowrap="nowrap">
      <jalios:caddy data='<%= itGroup %>'/>
      <% if (guiRemoveGroup && itGroup.getMemberSet().isEmpty() && itGroup != channel.getDefaultGroup() ) { %>
        <jalios:delete data='<%= itGroup %>' redirect='<%= redirect %>' />
      <% } %>
      <% if (isLogged && workspace.isAdmin(loggedMember) && Util.notEmpty(alertUrl) && itGroup.canReceiveMail(true)) { %>
        <a class="modal" href="<%= alertUrl %>?groups=<%= itGroup.getId() %>" title='<%= glp("alert.send-alert.lbl.title") %>'><jalios:icon src="email-error" /></a>
      <% } %>
      <% if (channel.isLdapEnabled() && ldapGroupBeingSync == null && workspace.isAdmin(loggedMember) && 
             Util.notEmpty(itGroup.getLdapDN())) {
        String syncLdapGroupUrl = HttpUtil.getUrlWithCSRFToken("admin/syncLdap.jsp?opSyncLdapGroup=true&amp;ldapGid=" + itGroup.getId() + "&amp;redirect=" + encodeForURL(ServletUtil.getUrl(request)), request, true); %>
        <a href=<%= syncLdapGroupUrl %>><jalios:icon src='refresh'   title='<%= glp("ui.adm.grp-list.btn.sync-ldap") %>' alt="refresh" /></a>
      <% } %>
    </td>
  </tr>
</jalios:foreach>
</table>
</form>


<% if (guiShowPager ) { %>
  <jalios:pager name='glPagerHandler'/>
<% } %>

<% if (showCheckInsert ) { %>
  <%@ include file="/admin/doSelectedGroupList.jspf" %>
<% } %>
</div> <%-- end of ajax-refresh-div --%>
