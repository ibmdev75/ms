<%@ page import="com.jalios.jcms.mashup.*, com.jalios.jcms.taglib.*" %><%@ include file="/jcore/doInitPage.jspf" %><%
  
  boolean disabled = Util.toBoolean(jcmsContext.getAjaxRequestAttribute("channel.ctxmenu.disabled"),false);
  if (disabled || !channel.isDataWriteEnabled()){
    return;
  }
    
  Category cat = getCategoryParameter("ctxId");
  if (cat == null || !cat.canBeReadBy(loggedMember) || loggedMember == null){
    return;
  }
  
  // Handle parameter (should be moved to a bean)
  boolean refresh = false;
  String ctx = getUntrustedStringParameter("ctx", null);
  String value = getUntrustedStringParameter("value", null);
  String open  = "false";
  ControllerStatus cs = null;
  if ("addsub".equals(ctx)){
    cs = cat.addSubs(value,loggedMember, userLang);
    String catId = cat.getId();
    Category childCat = null;
    if(getBooleanParameter("displayChildren", false)) {
      // Retrieve the last children added which will be opened
      for(Category child : cat.getChildrenSet()) {
        if(childCat == null || child.getCdate().after(childCat.getCdate())) {
          childCat = child;
        }
      }
      catId = childCat != null ? childCat.getId() : catId;
    }
    open = "'"+ catId +"'";
    refresh = true;
  } 
  else if ("addsib".equals(ctx)){
    cs = cat.addSiblings(value, loggedMember, userLang);
    if (cs != null && cs.isOK()){
      String firstSiblingName = Util.getFirst(Util.split(value, ","));
      Category newSibling = cat.getParent().getChild(JcmsUtil.escapeHtml(firstSiblingName));
      if (newSibling != null) {
        open = "'"+ newSibling.getId() +"'";
      }
    }
    refresh = true;
  } 
  else if ("rename".equals(ctx)){
    cs = cat.rename(value, userLang, loggedMember);
    refresh = true;
  } 
  else if ("delete".equals(ctx)){
    cs = cat.delete(loggedMember);
    refresh = true;
  } 
  else if ("refresh".equals(ctx)){
    refresh = true;
  }
  String url = "jcore/ctxmenu/ctxmenu.jsp";
  boolean canManage = isLogged && loggedMember.canManageCategory(cat);
  boolean isRoot = cat == channel.getRootCategory();
%>
<% if (refresh){ %>
<jalios:javascript>

  // Retrieve last refresh event
  var refresh = jQuery.jalios.AjaxRefresh.LastRefresh.refresh;
  
  // Refresh parent treeview
  var treeview = refresh.target.closest('UL[data-jalios-ajax-refresh-url].treeview');
  
  <% if (cs != null && !cs.isOK()){ %>
    jQuery.jalios.ui.Modal.alert.postpone(0.6,"<%= cs.getMessage(userLang) %>", function(){ 
  <% } %>
  
  // Simple refresh
  jQuery.jalios.ui.TreeView.refresh(treeview, <%= open %>);
  jQuery.jalios.ui.CtxMenu.hide();
  
  <% if (cs != null && !cs.isOK()){ %>});<% }%>
  
</jalios:javascript>
<%@ include file="/jcore/doAjaxFooter.jspf" %>
<% return; } %>

<jalios:include target="CTXMENU_HEADER_CATEGORY" targetContext="li" />

  <% if (canManage && !isRoot) { %>
    <%-- EDIT --%>
    <li class="icon">
      <% String editUrl = HttpUtil.encodeForHTMLAttribute(ResourceHelper.getSpecificEdit(cat) + "?id=" + cat.getId() + "&redirect="+ HttpUtil.encodeForURL("jcore/closePopup.jsp?refresh=" + HttpUtil.encodeForURL("{'nodeId':'" + cat.getId() + "'}")) + "&redirectOnClosePopup=false&popupEdition=true"); %>
      <a title="<%= glp("ui.com.alt.edit") %>" href="" class="editArea" onclick="Popup.popupWindow('<%= editUrl %>', '<%= glp("ui.com.alt.edit") %>', 900, 600, true, true, true, false, null, jQuery.jalios.ui.TreeView.refreshNode); return false;">
        <jalios:icon src="edit" /> <%= glp("ui.com.alt.edit") %>
      </a>
    </li>
  <% } %>
  
  <%-- TARGET --%>
  <jalios:include target="CTXMENU_CATEGORY_1" targetContext="li" />    
  
  <% if (canManage) { %>
    <%-- ADD SUB --%>
    <% String classesParam = getUntrustedStringParameter("classes", null); %>
    <%-- add displayChildren param to know whether the treecat displays the children and not the root category --%>
    <% String displayChildren = classesParam != null && classesParam.contains("treecat-empty") ? "&displayChildren=true" : ""; %>
    <li class="icon"><a href="<%= url %>?ctxId=<%= cat.getId() %>&ctx=addsub<%= displayChildren %>" data-jalios-target="UL#ctxAjaxMenu" class="ajax-refresh modal prompt" title="<%= glp("msg.cat-editor.add-sub-cat") %>"><jalios:icon src="add-sub-cat" /> <%= glp("ui.work.cat.lbl.add-sub-cat") %></a></li>
  <% } %>
  
  <% if (canManage && !isRoot) { %>  
    <%-- ADD SIBLING (FIXME: if not root) --%>
    <li class="icon"><a href="<%= url %>?ctxId=<%= cat.getId() %>&ctx=addsib" data-jalios-target="UL#ctxAjaxMenu"  class="ajax-refresh modal prompt" title="<%= glp("msg.cat-editor.add-sibling-cat") %>"><jalios:icon src="add-sub-cat" /> <%= glp("ui.work.cat.lbl.add-sibling-cat") %></a></li>
  <% } %>
  
  <% if (canManage && !isRoot) { %>
    <%-- RENAME --%>
    <li class="icon"><a href="<%= url %>?ctxId=<%= cat.getId() %>&ctx=rename" data-jalios-target="UL#ctxAjaxMenu"  class="ajax-refresh modal prompt" title="<%= glp("msg.cat-editor.edit-name") %>" data-jalios-modal-default="<%= encodeForHTMLAttribute(cat.getName(userLang), true) %>"><jalios:icon src="textfield-rename"/> <%= glp("ui.com.lbl.rename") %></a></li>
  <% } %>
  
  <% if (canManage && !isRoot) { %>
    <%-- DELETE --%>
    <% if (channel.isDataWriteEnabled() && cat.checkDelete(loggedMember).isOK()) { %>
    <% String deleteMsg = cat.isLeaf(loggedMember) ? glp("msg.js.confirm-delete",cat.getName(userLang)) : glp("msg.js.confirm-deep-delete",cat.getName(userLang),Util.join(cat.getChildrenSet(), ", ", 3, "...")); %>
    <li class="icon"><a href="<%= url %>?ctxId=<%= cat.getId() %>&ctx=delete" data-jalios-target="UL#ctxAjaxMenu"  class="modal confirm" data-jalios-action="ajax-refresh" title="<%= encodeForHTMLAttribute(deleteMsg) %>"><jalios:icon src="trash-empty"/> <%= glp("ui.com.btn.delete") %></a></li>
    <% } %>
  <% } %>
  
  <% if (canManage) { %>
    <%-- INSPECT --%>
    <% if (checkAccess("admin/dev")) { %>
    <li class="icon"><a href="admin/editDataId.jsp?opInspect=true&amp;dataId=<%= cat.getId() %>" class="modal"><jalios:icon src="inspect" /> <%= glp("ui.adm.data-inspector.link") %></a></li>
    <% } %>
  <% } %>
  
  <% if (canManage && !isRoot) { %>
    <%-- MERGE --%>
    <% if (channel.isDataWriteEnabled() && cat != channel.getRootCategory()) { %>
    <li class="icon"><a href="work/mergeCategory.jsp?srcCat=<%= cat.getId() %>" class="modal"><jalios:icon src="merge"/> <%= glp("ui.work.cat.lbl.merge") %></a></li>      
    <% } %>
  <% } %>
    
  <%-- REFRESH --%>
  <%-- MUST refresh LI associated --%>
  <li class="icon"><a href="<%= url %>?ctxId=<%= cat.getId() %>&ctx=refresh" data-jalios-target="UL#ctxAjaxMenu" class="ajax-refresh" title="<%= glp("msg.cat-editor.edit-name") %>"><jalios:icon src="refresh" /> <%= glp("ui.com.btn.refresh") %></a></li>
  
  <%-- TARGET --%>
  <jalios:include target="CTXMENU_CATEGORY_2" targetContext="li" />
  
  <%-- --------------------------------------------------------------------------------------------------- --%>
  <li class="divider"></li>

  <% if (canManage && !isRoot) { %>
    <%-- CADDY  --%>
    <li class="icon"><jalios:caddy data="<%= cat %>" displayLinkText="<%= true %>"/></li>
  <% } %>
  
  <% if (canManage && !isRoot) { %>    
    <%-- EXPORT  --%>
    <% if (ExportManager.getInstance().checkIP(channel.getCurrentServletRequest().getRemoteAddr())) { 
      Category importRootCat = ImportManager.getInstance().getImportRootCategory();
      if (cat != importRootCat && !cat.hasAncestor(importRootCat)) {
    %>
    <li class="icon"><a href="admin/exportXml.jsp?cids=<%= cat.getId() %>" title="<%= glp("ui.com.alt.export-xml") %>"><jalios:icon src="xml" /> <%= glp("ui.com.alt.export-xml") %></a></li>
    <% }} %>
  <% } %>
  
  <% if (canManage && !isRoot) { %>
    <%-- WEBDAV  --%>
    <% if (FileWebdavTag.Webdav.canUseWebdavFolderIcon() && loggedMember.hasWebdavAccess()) { %>
    <li class="icon"><jalios:webdav folder="<%= cat %>" title='<%= glp("ui.com.btn.webdav-browse") %>' /></li>
    <% } %>
  <% } %>

  <%-- VIEW PORTAL  --%>
  <li class="icon"><a href="<%= cat.getDisplayUrl(userLocale) %>"><jalios:icon src="portal" /> <%= glp("ui.work.cat.lbl.view-portal") %></a></li>

  <%-- TARGET --%>
  <jalios:include target="CTXMENU_CATEGORY_3" targetContext="li" />

  <%-- --------------------------------------------------------------------------------------------------- --%>
  <li class="divider"></li>

  <%-- PORTAL  --%>
  <% Set<PortalInterface> portalSet = Util.interSet(channel.getAllDataSet(PortalInterface.class), cat.getPublicationSet()); %>
  <% if (Util.notEmpty(portalSet)) { %>
  <li class="icon dropdown-submenu">
      <a href="#"><jalios:icon src="multiportal"/> <%= glp("ui.com.lbl.portals") %></a>
      <ul class="dropdown-menu ctxInfo">
        <% for (PortalInterface portal : portalSet) { 
           if (!((Publication)portal).canBeReadBy(loggedMember)) { continue; }
        %><li class="text"><a href="#"><span><jalios:icon src="portal" /> <%= portal.getTitle(userLang) %></span></a></li>
        <% } %>
      </ul>
  </li>
  <% } %>

  <%-- METADATA  --%>
  <% SimpleDateFormat sdf = channel.getDateTimeFormat(userLang); %>
  <li class="icon dropdown-submenu">
    <a href="#"><jalios:icon src="info" /> <%= glp("ui.com.lbl.metadata") %></a>
    <ul class="dropdown-menu ctxInfo">
      <% boolean sep =  false; %>
      
      <%-- FRIENDLY URL  --%>
      <% Set friendlyUrl = cat.getFriendlyURLSet(); 
         if (Util.notEmpty(friendlyUrl)) { sep = true; %>
      <li class="dropdown-submenu">
        <a href="#"><%= glp("ui.com.lbl.friendly-urls") %></a>
        <ul class="dropdown-menu ctxInfo">
        <jalios:foreach collection="<%= friendlyUrl %>"  name="itUrl" type="String">
          <li><a href="<%= itUrl %>"><%= itUrl %></a></li>
        </jalios:foreach>
        </ul>
      </li>
      <% } %>
      
      <%-- SYNONYMES  --%>
      <% String[] synonyms = cat.getSynonyms();
         if (Util.notEmpty(synonyms)) { sep = true; %>
      <li class="dropdown-submenu">
        <a href="#"><%= glp("ui.work.cat.lbl.synonyms") %></a>
        <ul class="dropdown-menu ctxInfo">
        <jalios:foreach array="<%= synonyms %>"  name="itSyn" type="String">
          <li><a href="#"><%= itSyn %></a></li>
        </jalios:foreach>
        </ul>
      </li>
      <% } %>
      
      <%-- --------------------------------------------------------------------------------------------------- --%>
      <% if (sep){ %><li class="divider"></li><% } %>
       
      <%-- AUTHOR  --%>
      <% if (cat.getAuthor() != null) { %>
      <li><a href="#"><strong><%= glp("ui.com.lbl.author") %>:</strong> <%= cat.getAuthor().getFullName() %></a></li>
      <% } %>
     
      <%-- CDATE  --%>
      <% if (cat.getCdate() != null) { %>
      <li><a href="#"><strong><%= glp("ui.com.lbl.cdate") %>:</strong> <%=  sdf.format(cat.getCdate()) %></a></li>
      <% } %>
      
      <%-- MDATE  --%>
      <% if (cat.hasBeenUpdated() && cat.getMdate() != null) { %>
      <li><a href="#"><strong><%= glp("ui.com.lbl.mdate") %>:</strong> <%=  sdf.format(cat.getMdate()) %></a></li>
      <% } %>
      
      <%-- INDEX  --%>
      <% Date idxDate = cat.getIndexingDate();
      if (idxDate != null) { %>
      <li><a href="#"><strong><%= glp("ui.com.lbl.idxdate") %>:</strong> <%=  sdf.format(idxDate) %></a></li>
      <% } %>
      
        <%-- <<->> --%>
          <li class="divider"></li>
      
      <li><a href="#"><strong><%= glp("ui.com.lbl.id") %>:</strong> <%=  cat.getId() %></a></li>
      
    </ul>
  </li>

  <%-- RIGHTS --%>
  <% Set authMbrSet = cat.getAuthorizedMemberSet();
     Set authGrpSet = cat.getAuthorizedGroupSet();
     if (Util.notEmpty(authMbrSet) || Util.notEmpty(authGrpSet)){ %>
  <li class="icon dropdown-submenu">
    <a href="#" ><jalios:icon src="key"  /> <%= glp("ui.work.form.lbl.read-rights") %></a>
    <ul class="dropdown-menu ctxInfo">
    
    <% if (Util.notEmpty(authMbrSet)) { %>
      <li class='section'><a href="#"><%= glp("ui.com.lbl.members") %></a></li>
      <jalios:foreach collection="<%= authMbrSet %>" type="Member" name="itMember" max="5">
        <li><jalios:link data="<%= itMember %>" /></li>
      </jalios:foreach>
    
    <% } if (Util.notEmpty(authGrpSet)) { %>
      <li class='section'><a href="#"><%= glp("ui.com.lbl.groups") %></a></li>
      <jalios:foreach collection="<%= authGrpSet %>" type="Group" name="itGroup" max="5">
        <li><jalios:link data="<%= itGroup %>" /></li>
      </jalios:foreach>
    
    <% } %>
    </ul>
  </li>
  <% } %>

  <%-- DESCRIPTION --%>
  <% if (Util.notEmpty(cat.getDescription(userLang))) { %>
  <li class="icon dropdown-submenu"><a href="#" ><jalios:icon src="abstract" /> <%= glp("ui.com.lbl.description") %></a>
  <ul class="dropdown-menu ctxInfo">
    <li class='block'><a href="#">
    <jalios:truncate length="400" suffix="..."><%= cat.getDescription(userLang) %></jalios:truncate>
    </a></li>
  </ul>
  </li>
  <% } %>

  <%-- IMAGE --%>
  <% String imagePath = cat.getImage(userLang); 
     if (Util.notEmpty(imagePath)) { %>
  <li class="divider"></li>
  <li class="ctx-image"><a href="<%= imagePath %>"><jalios:icon src="<%= imagePath %>" /></a></li>
  <% } %>
 
  <jalios:include target="CTXMENU_FOOTER_CATEGORY" targetContext="li" />
<%@ include file="/jcore/doAjaxFooter.jspf" %>