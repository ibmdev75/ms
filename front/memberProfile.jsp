<%--
  @Summary: Member profile 
  @Category: Work Area / Member
  @Deprecated: False
  @Customizable: False
  @Requestable: True
--%><%
%><%@ page import="com.jalios.jcms.authentication.handlers.DelegationAuthenticationHandler" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% 
  boolean hasMemberEditionAcl = checkAccess("admin/users/member") || checkAccess("admin/users/dbmember") || checkAccess("admin-ws/member-edit");
  boolean hasMemberViewAcl = checkAccess("admin/users/member") || checkAccess("admin-ws/users/member");
  Member member = loggedMember;

  if (!isLogged) { 
    sendForbidden(request, response);
    return;
  }

  Member paramMember = getMemberParameter("id");
  if (paramMember != null) {
    boolean paramMemberBelongsToCurrentWS = paramMember.belongsToWorkspace(workspace);
    boolean canViewMember = 
       isAdmin || // Admin always ok
       checkAccess("admin/users/member") || // Member admin through ACL always OK
       (checkAccess("admin/users/dbmember") && paramMember instanceof DBMember) || // DBMember admin through ACL OK for DBMEmber -- JCMS-3410
       (workspace.isAdmin(loggedMember) && paramMemberBelongsToCurrentWS) || // Workspace admin ok for member of their workspace
       (checkAccess("admin-ws/member-edit") && paramMemberBelongsToCurrentWS) || // WS Member editor ACL, ok for member of their workspace
       (checkAccess("admin-ws/users/member") && paramMemberBelongsToCurrentWS); // WS Member viewer ACL, ok for member of their workspace
    if (!canViewMember) {
      sendForbidden(request, response);
      return;
    }
    member = paramMember;
  }
  
  request.setAttribute("title", glp("ui.work.prof.title", member.getFullName())); 
  request.setAttribute("profileWAMenu", "true");
  request.setAttribute("allowWkspFilter", "false");
  request.setAttribute("member", member);
  boolean emptyHeader = getBooleanParameter("emptyheader", false);
  boolean showRights = isAdmin || hasMemberEditionAcl || Util.notEmpty(loggedMember.getAdministratedWorkspaceSet());
  boolean isLdapAccount = member != null && member.isLdapAccount() && channel.isLdapEnabled();
  boolean isDBAccount = member instanceof DBMember;
  boolean isAccount = member.isAccount();
  boolean isMemberAccount = isAccount && !isDBAccount;
  
  if (emptyHeader) { 
    %><%@ include file='/jcore/doEmptyHeader.jspf' %><%
    %><div class="WorkArea front-memberProfile"><%
  } else { 
    %><%@ include file='/work/doWorkHeader.jspf' %><%
  }
%>
<h1 class="boTitle icon iconMember <% if (isDBAccount) { %>DBMember<% } %>"><% /* %>Profile of ...<% */ %><%= glp("ui.work.prof.title", member.getFullName()) %></h1>
<%@ include file='/jcore/doMessageBox.jspf' %>
<script>
function logout() {
  <% if (emptyHeader) { %>
  opener.location="<%= contextPath %>/<%= ResourceHelper.getLogout() %>"; 
  close();
  <% } else { %>
  location="<%= contextPath %>/<%= ResourceHelper.getLogout() %>"; 
  <% } %>

}
</script>
<jalios:buffer name="buttonsBuffer">
<form class="br">
  <% if ((isAdmin || hasMemberEditionAcl) && !emptyHeader) { %>
  <input <%= channel.isDataWriteEnabled() ? "class='btn btn-primary'" :"disabled='disabled' class='btn btn-default'" %> type='button' value='<%= glp("ui.work.prof.btn.edit-mbr") %>' onclick='javascript:location="<%= contextPath %>/admin/editMember.jsp?id=<%= member.getId() %>&amp;redirect=<%= encodeForURL(ServletUtil.getUrl(request))%>"' />
   <% 
    final String memberListJSP;
    if (isAdmin) {
      memberListJSP = isDBAccount ? "admin/dbmemberList.jsp" : "admin/memberList.jsp";
    } else {
      memberListJSP = isDBAccount ? null : "work/workspace/workspaceMemberList.js";
    }
    if (memberListJSP != null) {
   %>
   <input class='btn btn-default' type='button' value='<%= glp("ui.adm.mbr-list.title") %>' onclick='javascript:location="<%= contextPath %>/<%= memberListJSP %>";' />
   <% } %>
  <% if (isAdmin && isAccount) { %>  
  <button class='btn btn-default' type="button" onclick='javascript:void(document.location="<%= contextPath %>/<%= DelegationAuthenticationHandler.getSuLink(member) %>")'
          <% if (DelegationAuthenticationHandler.getInstance().isExcludedFromDelegation(member)) { %>disabled="disabled" title="<%= encodeForHTMLAttribute(glp("msg.login.delegation-not-authorized"))%>"<% } %>><jalios:icon src='login'  alt="login" /> <%= glp("ui.adm.mbr-list.login.hlp") %></button>
  <% } %>
  <% } %>
  <% if (JcmsUtil.isSameId(member, loggedMember)) { %>
  <input <%= channel.isDataWriteEnabled() ? "class='btn btn-primary'" :"disabled='disabled' class='btn btn-default'" %> class='btn btn-default ' type='button' value='<%= glp("ui.work.prof.btn.edit-prof") %>' onclick='javascript:location="<%= contextPath %>/front/editProfile.jsp?emptyheader=<%= emptyHeader %>";' />
  <input class='btn btn-default' type='button' value='<%= glp("ui.com.foot.logout") %>' onclick='javascript:logout();' />
  <% } %>
  <% if (emptyHeader) { %>
  <input class='btn btn-default' type='button' value='<%= glp("ui.com.btn.close") %>' onclick='javascript:window.close();' />
  <% } %>
</form>
</jalios:buffer>
<%= buttonsBuffer %>

  <%
    boolean tabPubReadCat = AudienceRights.getInstance().isEnabled() && isMemberAccount && showRights;
    boolean tabPubRight   = isMemberAccount && showRights;
    boolean tabCatUse     = isMemberAccount && showRights;
    boolean tabCatEdit    = isMemberAccount && showRights;
    boolean tabNotif      = channel.isNotificationEnabled() && isMemberAccount;
    boolean tabAdv        = showRights;
  %>
  <ul class="nav nav-tabs br">
                <li class="active"><a href="#memberProfile_gen" onclick="return false;"><%= glp("ui.com.tab.general") %></a></li>
    <% if (tabPubReadCat)  { %><li><a href="#memberProfile_pubread" onclick="return false;"><%= glp("ui.adm.mbr-edit.pub-read-r.title") %></a></li><% } %>
    <% if (tabPubRight)    { %><li><a href="#memberProfile_pubright" onclick="return false;"><%= glp("ui.adm.grp-edit.tab.pub-r") %></a></li><% } %>
    <% if (tabCatUse)      { %><li><a href="#memberProfile_catuse" onclick="return false;"><%= glp("ui.adm.grp-edit.tab.cat-use-r") %></a></li><% } %>
    <% if (tabCatEdit)     { %><li><a href="#memberProfile_catedit" onclick="return false;"><%= glp("ui.adm.grp-edit.tab.cat-ed-r") %></a></li><% } %>
    <% if (tabNotif)       { %><li><a href="#memberProfile_notif" onclick="return false;"><%= glp("ui.fo.notification.notification") %></a></li><% } %>
    <% if (tabAdv)         { %><li><a href="#memberProfile_adv" onclick="return false;"><%= glp("ui.work.form.tab.adv") %></a></li><% } %>
  </ul>
  
<div class="tab-content responsive" id="memberProfile-tab">
  
  <%-- *** GENERAL ******************************************* --%>
  <div class="tab-pane fade  in active" id="memberProfile_gen">
  
  <div class='row'>
    <div class='col-md-6'>
    
          <fieldset>
          <legend class='formLabel'><jalios:icon src='ldap'  alt="ldap" /> <%= glp("ui.adm.mbr-edit.fs.info") %> <% if (isLdapAccount) { %> (LDAP)<%}%></legend>
          
          <dl class="dl-horizontal">
          
              <dt><%= glp("ui.adm.mbr-edit.lbl.salut") %></dt>
              <dd><%= encodeForHTML(member.getLangSalutation(userLang)) %></dd>
                  
              <dt><%= glp("ui.adm.mbr-edit.lbl.name") %></dt>
              <dd><%= encodeForHTML(member.getName()) %></dd>
                  
              <dt><%= glp("ui.adm.mbr-edit.lbl.f-name") %></dt>
              <dd><%= encodeForHTML(member.getFirstName()) %></dd>
                  
              <dt><%= glp("ui.adm.mbr-edit.lbl.organization") %></dt>
              <dd><%= encodeForHTML(member.getOrganization()) %></dd>
                  
              <dt><%= glp("ui.adm.mbr-edit.lbl.department") %></dt>
              <dd><%= encodeForHTML(member.getDepartment()) %></dd>
                  
              <dt><%= glp("ui.adm.mbr-edit.lbl.job") %></dt>
              <dd><%= encodeForHTML(member.getJobTitle()) %></dd>
                  
              <dt><%= glp("ui.adm.mbr-edit.lbl.mail") %></dt>
              <dd><%= encodeForHTML(member.getEmail()) %></dd>
                  
              <dt><%= glp("ui.adm.mbr-edit.lbl.phone") %></dt>
              <dd><jalios:phone number="<%= member.getPhone() %>" region="<%= member.getCountry() %>"/></dd>
                      
              <dt><%= glp("ui.adm.mbr-edit.lbl.mobile") %></dt>
              <dd><jalios:phone number="<%= member.getMobile() %>" region="<%= member.getCountry() %>"/></dd>
                  
              <dt><%= glp("ui.adm.mbr-edit.lbl.street") %></dt>
              <dd><%= encodeForHTML(member.getStreet()) %></dd>
                  
              <dt><%= glp("ui.adm.mbr-edit.lbl.postalCode") %></dt>
              <dd><%= encodeForHTML(member.getPostalCode()) %></dd>
              
              <dt><%= glp("ui.adm.mbr-edit.lbl.poBox") %></dt>
              <dd><%= encodeForHTML(member.getPoBox()) %></dd>
              
              <dt><%= glp("ui.adm.mbr-edit.lbl.locality") %></dt>
              <dd><%= encodeForHTML(member.getLocality()) %></dd>
              
              <dt><%= glp("ui.adm.mbr-edit.lbl.region") %></dt>
              <dd><%= encodeForHTML(member.getRegion()) %></dd>
                  
              <% if (channel.getBooleanProperty("member.edit.show-address", true)) { %> 
              <dt><%= glp("ui.adm.mbr-edit.lbl.addr") %></dt>
              <dd><%= encodeForHTML(member.getAddress()) %></dd>
              <% } %>
              
              <dt><%= glp("ui.com.lbl.country") %></dt>
              <dd>
                <jalios:country country='<%= member.getCountry() %>'/> <%= glp("country." + member.getCountry()) %>
              </dd>
    
              <% if (!isDBAccount) { %>
                <dt><%= glp("ui.adm.mbr-edit.lbl.info") %></dt>
                <dd>
                  <jalios:wiki data="<%= member %>" field="info"><%= encodeForHTML(member.getInfo()) %></jalios:wiki>
                </dd>                
              <% } %>

              <%-- PHOTO ------------------------------------------------------------ --%> 
              <% if (member.hasPhoto()) { %>
                <dt><%= glp("ui.adm.mbr-edit.lbl.photo") %></dt>
                <dd>
                  <jalios:memberphoto size="<%= PhotoSize.SMALL %>" link="false" member="<%= member %>"/>        
                </dd>                
              <% } %>
              
          </dl>
              
          </fieldset>
          
          <%-- *** PLUGIN ********************************************* --%>
          <jalios:include target="MEMBER_PROFILE_MAINTAB" />
        
    </div>
  
    <div class='col-md-6'>
    
          <% if (isAccount) { %>
          <fieldset>
            <legend class='formLabel'>
              <jalios:icon src='login'  alt="login" />
              <%= glp("ui.adm.mbr-edit.fs.account") %>
            </legend>
            
            <dl class="dl-horizontal">
            
              <dt><%= glp("ui.adm.mbr-edit.lbl.login") %></dt>
              <dd><%= encodeForHTML(member.getLogin()) %></dd>

              <dt><%= glp("ui.adm.mbr-edit.lbl.incoming") %></dt>
              <dd>
                  <% String incommingAddress = com.jalios.jcms.mail.MailManager.getIncomingAddress("jcms",member,null); %>
                  <a href="mailto:<%= encodeForHTMLAttribute(incommingAddress) %>"><%= encodeForHTML(incommingAddress) %></a>                  
                  <jalios:tooltip property='ui.adm.mbr-edit.lbl.incoming.h' /> 
              </dd>
            
            </dl>
            
          </fieldset>
          <% } %>
          
          <% if (isAccount) { %>          
          <fieldset>
            <legend class='formLabel'><%= glp("ui.adm.mbr-edit.fs.options") %></legend>
            
            <dl class="dl-horizontal">
            
              <% if (!isDBAccount && isAdmin) { %>
              <dt><%= glp("ui.adm.mbr-edit.lbl.admin") %></dt>
              <dd>
                  <jalios:icon src="member-admin"  alt="admin" />          
                  <%= member.isAdmin() ? glp("ui.com.lbl.yes") : glp("ui.com.lbl.no") %>
              </dd>
              <% } %>
              
              <dt><%= glp("ui.adm.mbr-edit.lbl.mail-vis") %></dt>
              <dd>
                  <jalios:icon src="mail"  alt="email" />          
                  <%= member.isEmailVisible() ? glp("ui.com.lbl.yes") : glp("ui.com.lbl.no")%>
              </dd>
              
              <% if (channel.isWebdavEnabled() && !isDBAccount) { %>
              <dt><%= glp("ui.com.lbl.webdav-access") %></dt>
              <dd>
                  <jalios:icon src="webdav-folder"  alt="webdav" />          
                  <%= member.hasWebdavAccess() ? glp("ui.com.lbl.yes") : glp("ui.com.lbl.no")%>
              </dd>
              <% } %>
              
              <% if (channel.isMultilingual()) { %>
                <dt><%= glp("ui.com.lbl.language") %></dt>
                <dd>
                    <jalios:lang lang='<%= member.getLanguage() %>'/> <%= glp("lang." + member.getLanguage())%>
                </dd>
              <% } %>
              
            </dl>
              
          </fieldset>
          <% } %>
          
          <% if (isMemberAccount && isAdmin) { %>
          <fieldset>
          <legend class='formLabel'><%= glp("ui.adm.mbr-edit.delegation") %></legend>
          
            <%-- Delegates (member allowed to connect into this member) --%>
            <div class='formInfo'>
            <% if (Util.notEmpty(member.getDelegateMemberSet())) { %>
              <%= glp("ui.adm.mbr-edit.del.delegates", loggedMember == member ? 0 : 1) %>
              <ul>
               <jalios:foreach collection="<%= member.getDelegateMemberSet() %>" name="itMember" type="Member" counter="dmCounter">
 	              <li style='list-style-image: URL(<%= itMember.getIcon() %>);'>
                <%= itMember.getDataName(userLang) %> <jalios:edit data='<%= itMember %>'/></li>
               </jalios:foreach>
              </ul>
            <% } else { %>
              <%= glp("ui.adm.mbr-edit.del.no-delegates", loggedMember == member ? 0 : 1) %>
            <% } %>
            </div>
            
            <%-- Delegation Holder (to which this member can connect) --%>
            <div class='formInfo'>
            <% if (Util.notEmpty(member.getDelegationHolderSet())) { %>
              <%= glp("ui.adm.mbr-edit.del.holder", loggedMember == member ? 0 : 1) %>
              <ul>
               <jalios:foreach collection="<%= member.getDelegationHolderSet() %>" name="itMember" type="Member" counter="dmCounter">
 	              <li style='list-style-image: URL(<%= itMember.getIcon() %>);'>
                <%= itMember.getDataName(userLang) %> <jalios:edit data='<%= itMember %>'/></li>
               </jalios:foreach>
              </ul>
            <% } else { %>
              <%= glp("ui.adm.mbr-edit.del.no-holder", loggedMember == member ? 0 : 1) %>
            <% } %>
            </div>
          </fieldset>
          <% } // !isDBAccount %>

          <jalios:if predicate="<%= !isDBAccount && isAdmin %>">
          <fieldset>
          <legend class='formLabel'><%= glp("ui.work.form.adv.tech-info") %></legend>
          
            <dl class="dl-horizontal">
            
              <dt><%= glp("ui.com.lbl.workspaces") %></dt> 
              <dd>
                 <% Set workspaceSet = member.getWorkspaceSet(); %>
                 <ul class="item-list">
                  <jalios:foreach collection="<%= workspaceSet %>" name="itWorkspace" type="Workspace" counter="wCounter">
                   <li><%= member.getHtmlIcon(itWorkspace, userLang) %>
                     <jalios:icon src="work" /> <%= itWorkspace.getTitle(userLang) %>
                     (<jalios:foreach collection="<%= itWorkspace.getGroupSet() %>" name="itGroup" type="Group" counter="wsgCounter">
                      <% if (member.belongsToGroup(itGroup)) { %>
                        <jalios:icon src="group"  alt="group" /> <%= itGroup.getName(userLang) %> <jalios:edit id='<%= itGroup.getId() %>' target='_blank'/>&nbsp;
                      <% } %>
                      </jalios:foreach>)
                    </li>
                  </jalios:foreach>
                 </ul>    
              </dd>         
              
              <dt><%= glp("ui.adm.grp-list.lbl.grpglobal") %></dt>  
              <dd>
                 <ul class="item-list">
                  <jalios:foreach array="<%= member.getDeclaredGroups() %>" name="itGroup" type="Group" counter="gCounter">
                  <% if (itGroup.getWorkspace() == null) { %>
                    <li><jalios:icon src="group"  alt="group" /> <%= itGroup.getName(userLang) %> <jalios:edit id='<%= itGroup.getId() %>' target='_blank'/>
                    <% if (itGroup.isSubGroup()) { %>
                    <ul>
                    <jalios:foreach collection='<%= itGroup.getAncestorSet(false) %>' name='itAncestor' type='Group' counter='ancestorCounter'>
                    <li><%= itAncestor.getIcon(userLang,true) %>&nbsp;<%= itAncestor %></li>
                    </jalios:foreach>
                    </ul>
                    <% } %>
                    </li>
                  <% } %>
                  </jalios:foreach>
                 </ul>
              </dd>      
              
              <dt><%= glp("ui.com.lbl.pub-cnt") %></dt>
              <dd>
                <%
                  Set<Publication> mbrPubSet = member.getPublicationSet();
                  int mbrDbPubCount = HibernateUtil.queryCount(Publication.class, DBConstants.AUTHOR_ID_FIELD, member.getId());
                %>
                <% if ( Util.isEmpty(mbrPubSet) && mbrDbPubCount == 0 ) { %>
                  0
                <% } else { %>
                  <a href='work/queryWork.jsp?mids=<%= member.getId() %>'><%= mbrPubSet.size() + mbrDbPubCount %></a>
                <% } %>              
              </dd> 
              
              <jalios:if predicate='<%= member.getLastLdapSynchro() != null %>'>
                <dt><%= glp("ui.com.lbl.ldap-sync") %></dt>
                <dd>
                  <jalios:date date='<%= member.getLastLdapSynchro() %>'/> - <jalios:time date='<%= member.getLastLdapSynchro() %>'/>
                </dd>
              </jalios:if>
              
            </dl>
          </fieldset>    
          </jalios:if><%-- isAdmin --%>
      </div>
    </div>
  </div>

  <%-- *** PUBLICATION READ RIGHT (Audiencement) ************************************** --%>
  <jalios:if predicate='<%= tabPubReadCat %>'>
  <div class="tab-pane fade in" id="memberProfile_pubread">
    <jalios:message msg="ui.adm.mbr-edit.pub-read-r.intro" dismissable="true" />
    <jalios:foreach name='itAxeCat' type='com.jalios.jcms.Category' counter='itAxeCatCounter'
                    collection='<%= AudienceRights.getInstance().getCategoriesAxesList() %>'>
      <div class='formLabel'><%= glp("ui.adm.mbr-edit.pub-read-r.axe", itAxeCat.getName(userLang)) %></div>
      <% Set readCatSet = member.getReadCategorySet(); %>
      <jalios:treecatview 
        opened="<%= readCatSet %>" 
        highlighted="<%= readCatSet %>" 

        collection="<%= itAxeCat.getChildrenSet() %>"
        
        selectable="true" 
        dragdrop="true"
        showCtxMenu="true"
        css="autocomplete" />
    </jalios:foreach>
  </div>
  </jalios:if>

  <%-- *** PUBLISH RIGHT ************************************** --%>
  <jalios:if predicate='<%= tabPubRight %>'>
  <div class="tab-pane fade in" id="memberProfile_pubright">

    <div class="tab-pane" id="workspace-tab">
    <% if (Util.isEmpty(member.getWorkspaceSet())) { %>
      <jalios:message msg='<%= glp("ui.work.prof.txt.access-no-wksp", member.getFullName()) %>' />
    </div>
    <% } else { %>


    <% boolean hasAtLeastOnePublishRight = false; %>
    <%-- One tab per workspace the member belongs to and the loggedMember can administrate --%>
    <jalios:buffer name="allWSPublishRightTable">
    <jalios:foreach collection='<%= member.getWorkspaceSet() %>' name='itWorkspace' type='Workspace' counter='c1'>
      <% if (itWorkspace.isAdmin(loggedMember)) { %>
      <div class="tab-pane fade in" >
      <h2 class="tab"><% /* %>Workspace i<% */ %><%= itWorkspace.getTitle(userLang) %></h2>
      <% boolean hasPublishRight = false; %>
      <jalios:buffer name="wsPublishRightTable">
      <table id='rightTable' class="table-data table-condensed">
        <tr>
          <th nowrap="nowrap" width='40%'><%= glp("ui.com.lbl.type") %></th>
          <th nowrap="nowrap" width='20%'><%= glp("ui.adm.grp-edit.pub-r.publish") %></th>
          <th nowrap="nowrap" width='20%'><%= glp("ui.adm.grp-edit.pub-r.update") %></th>
          <th nowrap="nowrap" width='20%'><%= glp("ui.adm.grp-edit.pub-r.delete") %></th>
        </tr> 
        <% 
          int counter = 0;  
          Set typeSet = itWorkspace.getTypeSet();
        %>
        <jalios:foreach array='<%= new Class[]{Content.class,UserContent.class,Form.class,PortalElement.class} %>' type='Class' name='itRootClass' counter='c2'>
      	    <tr><th nowrap="nowrap" colspan='4'><%= channel.getTypeLabel(itRootClass, workspace, userLang) %></th></tr>
      	    <jalios:foreach name="itClass" type="Class" collection="<%= channel.getSubTypeList(itRootClass, userLang) %>" counter='itCounter'>
      	    <jalios:if predicate='<%= typeSet.contains(itClass) %>'>
      	      <% String name = Util.getClassShortName(itClass); 
      	         counter = itCounter.intValue();
      	      %>
      	      <tr>
      	        <td><b><%= channel.getTypeLabel(itClass, workspace, userLang) %></b></td>
      	        <%
      	         if (member.canPublish(itClass,itWorkspace) || 
      	             member.canUpdateOther(itClass,itWorkspace) || 
      	             member.canDeleteOther(itClass,itWorkspace)) {
      	               hasPublishRight = true;
      	               hasAtLeastOnePublishRight = true;
      	         }      	         
      	        %>
      	        <td class="text-center"><%= member.canPublish(itClass,itWorkspace) ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
      	        <td class="text-center"><%= member.canUpdateOther(itClass,itWorkspace) ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
      	        <td class="text-center"><%= member.canDeleteOther(itClass,itWorkspace) ? channel.getProperty("list.boolean.on", "X") : channel.getProperty("list.boolean.off", "&nbsp;") %></td>
      	      </tr>
      	    </jalios:if>
      	    </jalios:foreach>
        </jalios:foreach>
      </table>
      </jalios:buffer>
      <% if (hasPublishRight) { 
          out.print(wsPublishRightTable); 
         } else { %>
          <jalios:message msg='<%= glp("ui.work.prof.txt.cannot-edit-content-wksp", member.getFullName()) %>' />
      <% } %>
    </div>
    <% } %>
    </jalios:foreach>
    </jalios:buffer>
    
    
    
    <%  if (!hasAtLeastOnePublishRight) { %>
          <jalios:message msg='<%= glp("ui.work.prof.txt.cannot-edit-content", member.getFullName()) %>' />
    </div>
    <% } else { %>
    <%= allWSPublishRightTable %>
    </div>
    <p>
      <ul>
        <li><%= glp("ui.adm.grp-edit.pub-r.txt.publish") %></li>
        <li><%= glp("ui.adm.grp-edit.pub-r.txt.update") %></li>
        <li><%= glp("ui.adm.grp-edit.pub-r.txt.delete") %></li>
      </ul>
    </p>
    <% } 
    } // End of test mbr in no WS
    %>
  </div>
  </jalios:if>

  <%-- *** CATEGORY USE RIGHT ************************************** --%>
  <jalios:if predicate='<%= tabCatUse %>'>
  <div class="tab-pane fade in" id="memberProfile_catuse">
    <jalios:select>
    <jalios:if predicate='<%= member.getExpandedUseCategorySet().isEmpty() %>'>
    <jalios:message msg='<%= glp("ui.work.prof.txt.cannot-use-cat", member.getFullName()) %>' dismissable="true" />
    </jalios:if>
    <jalios:default>
      <jalios:message msg='<%= glp("ui.work.prof.txt.can-use-cat", member.getFullName()) %>' dismissable="true" />
      <% Set useCatSet = member.getExpandedUseCategorySet(); %>
      <jalios:treecatview 
        prefix="useCatSet"
        opened="<%= useCatSet %>" 
        highlighted="<%= useCatSet %>" 

        collection="<%= Util.getHashSet(channel.getRootCategory()) %>"
        selectable="true" 
        dragdrop="true"
        showCtxMenu="true"
        css="autocomplete" />      
    </jalios:default>
    </jalios:select>
  </div>
  </jalios:if>

  <%-- *** CATEGORY EDITOR RIGHT ************************************** --%>
  <jalios:if predicate='<%= tabCatEdit %>'>
  <div class="tab-pane fade in" id="memberProfile_catedit">
    <jalios:select>
    <jalios:if predicate='<%= !member.canEditCategories() %>'>
    <jalios:message msg='<%= glp("ui.work.prof.txt.cannot-edit-cat", member.getFullName()) %>' />
    </jalios:if>
    <jalios:default>
	    <jalios:message msg='<%= glp("ui.work.prof.txt.can-edit-cat", member.getFullName()) %>' dismissable="true" />
      <% Set editCatSet = member.getCategoryRootSet(); %>
      <jalios:treecatview 
        prefix="editCatSet"
        opened="<%= editCatSet %>" 
        highlighted="<%= editCatSet %>" 

        collection="<%= Util.getHashSet(channel.getRootCategory()) %>"
        selectable="true" 
        dragdrop="true"
        showCtxMenu="true"
        css="autocomplete" />  
    </jalios:default>
    </jalios:select>
  </div>
  </jalios:if>

  <%-- *** NOTIFICATION ************************************** --%>
  <jalios:if predicate='<%= tabNotif %>'>
    <div class="tab-pane fade in" id="memberProfile_notif">
    <% NotificationCriteria[] criteria = NotificationManager.getNotificationCriteria(member);%>    
    <% if (Util.notEmpty(criteria)) { %>
        <table class="table-data table-condensed">
        
          <%-- HEADER --%>
          <tr>
            <th nowrap="norwrap"><%= glp("ui.work.notification.period") %></th>
            <th nowrap="norwrap"><%= glp("ui.work.notification.mutation-type") %></th>
            <th width="30%"><%= glp("ui.work.search.tab.cat") %></th>
            <th width="30%"><%= glp("ui.work.search.tab.text") %></th>
            <th width="30%"><%= glp("ui.work.search.tab.type") %></th>
          </tr>
          <jalios:foreach array="<%= criteria %>" name="itCriteria" type="NotificationCriteria" counter="qsCounter">
          <% com.jalios.jcms.handler.QueryHandler qh = itCriteria.getQueryHandler(); %> 
          <tr>
            <%-- Period --%>
            <td nowrap="norwrap">
              <jalios:icon src="calendar"  alt="calendar" />
              <%= itCriteria.getPeriodTypeLabel(userLang) %>
            </td>
            
            <%-- Mutation type --%>
            <td nowrap="norwrap"><%= itCriteria.getMutationTypeLabel(userLang) %></td>
            
            <%-- Category --%>
            <td>
              <% if (qh != null) { %>
              <jalios:foreach collection="<%= qh.getCategorySet(null) %>" name="itCat" type="Category" counter="c2">
                <span class="label label-info"><%= itCat.getName(userLang) %></span>
              </jalios:foreach>
              <% } %>
            </td>    
            
            <%-- Text --%>
            <td>
              <% if (qh != null && Util.notEmpty(qh.getText())) { %>
              "<%= qh.getText() %>"
              <% } %>
            </td>
            
            <%-- Types --%>
            <td>
              <% if (qh != null) { %>
              <jalios:foreach collection="<%= qh.getClassSet() %>" name="itClass" type="Class" counter="c2">
                <span class="label label-warning"><%= channel.getTypeLabel(itClass, userLang) %></span>
              </jalios:foreach>
              <% } %>      
            </td>
          </tr>
        </jalios:foreach>
     </table>
     <% } %>

    </div>
  </jalios:if>

   <%-- *** ADVANCED ********************************************* --%>
   <% if (tabAdv) { %> 
    <div class="tab-pane fade in" id="memberProfile_adv">
     <%@ include file='/admin/doMemberAdvancedTab.jspf' %>   
    </div> 
   <% } %>

   <%-- *** PLUGIN ********************************************* --%>
    <jalios:include target="MEMBER_PROFILE" targetContext="tab-pane" />

  </div>
  
 <% if (Util.notEmpty(buttonsBuffer)) { %>
  <%= buttonsBuffer %>
 <% } %>

<% if (emptyHeader) { %>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
<% } else { %>
<%@ include file='/work/doWorkFooter.jspf' %>
<% } %>
