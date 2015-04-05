<%--  
  @Summary: Member editor
  @Category: Admin / Data
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.0
--%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%
if (JcmsUtil.checkDataWriteDisabled(request, response, "admin/doAdminMsg.jsp", userLang)) {
  return;
}

%><jsp:useBean id="extFormHandler" scope="page" class="generated.EditMemberExtensionHandler"><%
  %><jsp:setProperty name="extFormHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="extFormHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="extFormHandler" property="*" /><%
%></jsp:useBean><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.EditMemberHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="extFormHandler" value="<%= extFormHandler %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%
 
if (formHandler.validate()) {
  return;
}

Member member = formHandler.getMember();
String title = (member == null) ? glp("ui.adm.mbr-edit.title-add") : glp("ui.adm.mbr-edit.title-update", member.getFullName());
boolean isLdapAccount = member != null && member.isLdapAccount() && channel.isLdapEnabled();
boolean isDBAccount = member instanceof DBMember || getBooleanParameter("db", false);
final String MBR_ACL_RESOURCE = isDBAccount ? "admin/users/dbmember" : "admin/users/member";


request.setAttribute("title", title); 
if (isDBAccount) {
  request.setAttribute("dbmemberSubAdminMenu", "true"); 
} else {
  request.setAttribute("memberSubAdminMenu", "true"); 
}

request.setAttribute("formHandler", formHandler);
request.setAttribute("extFormHandler", extFormHandler);
request.setAttribute("classBeingProcessed", isDBAccount ? DBMember.class : Member.class);

if (channel.getBooleanProperty("js.member.edit.auto-convert-address", false)) {
  jcmsContext.addJavaScript(request.getScheme() + channel.getProperty("google-js.maps"));
  jcmsContext.addJavaScript("js/jalios/ux/jalios-member-edit.js");
}

boolean isEditionInWorkspace = !isAdmin && checkAccess("admin-ws/member-edit"); 
if (isEditionInWorkspace) {
  request.setAttribute("adminWAMenu", Boolean.TRUE);
  %><%@ include file='/work/doWorkHeader.jspf' %><%
} else { 
  %><%@ include file='/admin/doAdminHeader.jspf' %><%
}
%>

<div class="page-header">
  <h1<%= isDBAccount ? " class=\"DBMember\"" : "" %>><% /* %>Member Editor<% */ %><%= title %></h1>
</div>

<%@ include file='/jcore/doMessageBox.jspf' %>
<form class="form-horizontal" action="<%= channel.getSecuredBaseUrl(request) %>admin/editMember.jsp" method="post" name="editForm" enctype="multipart/form-data">

  <%
    boolean isAcl      = checkAccess(MBR_ACL_RESOURCE);
    boolean tabCat     = isAcl && (AudienceRights.getInstance().isEnabled() && !isDBAccount);
    boolean tabPub     = isAcl && !isDBAccount;
    boolean tabCatUse  = isAcl && !isDBAccount;
    boolean tabCatEdit = isAcl && !isDBAccount;
    boolean tabNotif   = isAcl && (member != null && member.isAccount() && channel.isNotificationEnabled() && !isDBAccount);
  %>
  
  <ul class="nav nav-tabs br">
              <li class="active"><a href="#editMember_gen" onclick="return false;"><%= glp("ui.com.tab.general") %></a></li>
                             <li><a href="#editMember_grp" onclick="return false;"><%= glp("ui.adm.mbr-edit.tab.group") %></a></li>
    <% if (tabCat)       { %><li><a href="#editMember_cat" onclick="return false;"><%= glp("ui.adm.mbr-edit.pub-read-r.title") %></a></li><% } %>
    <% if (tabPub)       { %><li><a href="#editMember_pub" onclick="return false;"><%= glp("ui.adm.grp-edit.tab.pub-r") %></a></li><% } %>
    <% if (tabCatUse)    { %><li><a href="#editMember_catuse" onclick="return false;"><%= glp("ui.adm.grp-edit.tab.cat-use-r") %></a></li><% } %>
    <% if (tabCatEdit)   { %><li><a href="#editMember_catedit" onclick="return false;"><%= glp("ui.adm.grp-edit.tab.cat-ed-r") %></a></li><% } %>
    <% if (isAcl)        { %><li><a href="#editMember_alert" onclick="return false;"><%= glp("alert.rule-editor.lbl.title") %></a></li><% } %>
    <% if (tabNotif)     { %><li><a href="#editMember_notif" onclick="return false;"><%= glp("ui.fo.notification.notification") %></a></li><% } %>
    <% if (member!=null) { %><li><a href="#editMember_adv" onclick="return false;"><%= glp("ui.work.form.tab.adv") %></a></li><% } %>
    <jalios:include target="EDIT_MEMBER" targetContext="nav-tabs"/>
  </ul>

  <div class="tab-content responsive">
    <div class="tab-pane fade in active" id="editMember_gen">
       <% request.setAttribute("EditMemberHandler", formHandler); %>
       <jalios:include jsp="/admin/editMemberGeneral.jsp" />
    </div>

    <div class="tab-pane fade" id="editMember_grp"><%@ include file='/admin/editMemberGroup.jspf' %></div>
    
    <% if (tabCat) { %>
    <div class="tab-pane fade" id="editMember_cat"><%@ include file='/admin/editMemberCat.jspf' %></div>
    <% } %>
    
    <% if (tabPub) { %>
    <div class="tab-pane fade" id="editMember_pub"><%@ include file='/admin/editMemberPub.jspf' %></div>
    <% } %>
    
    <% if (tabCatUse) { %>
    <div class="tab-pane fade" id="editMember_catuse"><%@ include file='/admin/editMemberCatUse.jspf' %></div>
    <% } %>
    
    <% if (tabCatEdit) { %>
    <div class="tab-pane fade" id="editMember_catedit"><%@ include file='/admin/editMemberCatEdit.jspf' %></div>
    <% } %>
    
    <% if (isAcl) { %>
    <% com.jalios.jcms.handler.EditMemberHandler memberFH = formHandler; %> 
    <div class="tab-pane fade" id="editMember_alert"><%@ include file="/jcore/alert/doAlertRuleEditor.jspf" %></div>
    <% } %>
    
    <% if (tabNotif) { %>
    <% com.jalios.jcms.handler.EditMemberHandler memberFH = formHandler; %> 
    <div class="tab-pane fade" id="editMember_notif"><%@ include file="/jcore/notification/doMemberNotificationList.jspf" %></div>
    <% } %>

    <%-- *** ADVANCED ********************************************* --%>
    <% if (member != null) { %> 
    <div class="tab-pane fade" id="editMember_adv"><%@ include file='/admin/doMemberAdvancedTab.jspf' %></div> 
    <% } %>
    
    <%-- *** PLUGIN ********************************************* --%>
    <jalios:include target="EDIT_MEMBER" targetContext="tab-pane"/>
  </div>
    
<%-- BUTTONS -------------------------------------------------------------------- --%> 
<p>
  <input type='hidden' name='db' value='<%= isDBAccount %>' />
  <input type='hidden' name='redirect' value='<%= Util.getString(formHandler.getRedirect(), ServletUtil.getBaseUrl(request) + (isDBAccount ? "admin/dbmemberList.jsp" : "admin/memberList.jsp")) %>' />
  <% if (member == null) { %> 
    <button class='btn btn-primary' name="opCreate" type="submit"  value="true"><%= glp("ui.com.btn.save") %></button>
    <button class='btn btn-default' name='opCancel' type='submit'  value="true"><%= glp("ui.com.btn.cancel") %></button>
  <% } else { %> 
    <button class='btn btn-primary' name="opUpdate" type="submit"  value="true"><%= glp("ui.com.btn.save") %></button>
    <input name="id" type="hidden" value="<%= member.getId() %>" ></input>
  
    <% if (isLdapAccount) { %>
      <% String confirmSync = encodeForJavaScript(glp("msg.js.confirm")); %>
      <button class='btn btn-default' name="opUpdate" type="button" onclick='confirmAction("<%= confirmSync %>", "<%= contextPath %>/admin/syncLdap.jsp?opSyncOne=true&amp;id=<%= member.getId() %>&amp;redirect=" + escape("<%= ServletUtil.getUrl(request) %>"))' /><%= glp("ui.adm.mbr-list.btn.sync") %></button>

      <% String confirmDetach = encodeForJavaScript(glp("ui.adm.mbr-list.btn.detach.msg", HttpUtil.encodeForHTML(member.getFullName()))); %>
      <button class='btn btn-default' name="opDetachFromLDAP" type="button" onclick='confirmAction("<%= confirmDetach %>", "<%= contextPath %>/admin/editMember.jsp?opDetachFromLDAP=true&amp;id=<%= member.getId() %>&amp;redirect=" + escape("<%= ServletUtil.getUrl(request) %>"))' /><%= glp("ui.adm.mbr-list.btn.detach") %></button>
      
    <% } %>
  
    <button class='btn btn-default' name='opCancel' type='submit'  value="true"/><%= glp("ui.com.btn.cancel") %></button>
    <% if (checkAccess(MBR_ACL_RESOURCE)) { %> 
      <% String confirmDelete = encodeForHTMLAttribute(glp("msg.js.confirm-delete", member.getFullName())); %>
      <button class="btn btn-default modal confirm" value="true" name="opDelete" type="submit" title="<%= confirmDelete %>"><%= glp("ui.com.btn.delete") %></button>
      <% if (Util.notEmpty(member.getPublicationSet())) { %>
        <input type="checkbox" name="forceDelete" value="true" />
        <span class='formMandatory'><% /* %>Delete member's publications<% */ %><%= glp("ui.adm.mbr-edit.lbl.update-pub") %></span>
      <% } %>
    <% } %> 
  <% } %>
</p>

<input type='hidden' name='action' value='true' />
<input type='hidden' name='loaded' value='false' />
<input type='hidden' name="anchor" />
<input type='hidden' name="opItem" />
<input type='hidden' name="itemPos" />
<%
int openTab = 0;

// When adding groups items
boolean opRefresh = getBooleanParameter("opRefresh", false);
int gidsAddCount = getIntParameter("gidsAddCount", 0);
if (opRefresh && gidsAddCount != 3) { 
  openTab = 1; // group tab
}

 // When adding notification items
boolean opAddItem = getBooleanParameter("opAddItem", false);
if (opAddItem) {
  openTab = 6; // notification tab
}
%>
<jalios:javascript>
setSelectedTab("editMember-tab", <%= openTab %>);
</jalios:javascript>

</form>
<%
if (isEditionInWorkspace) {
  %><%@ include file='/work/doWorkFooter.jspf' %><%
} else { 
  %><%@ include file='/admin/doAdminFooter.jspf' %><%
}
%>