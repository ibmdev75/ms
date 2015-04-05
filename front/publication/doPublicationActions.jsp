<%@ include file='/jcore/doInitPage.jspf' %>
<%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %><%

Publication pub = (Publication) request.getAttribute("publication");

if (pub == null) {
  return;
}

if (jcmsContext.isPrintView()) {
  return;
}

FileDocument doc = null;
if (pub instanceof FileDocument) {
  doc = (FileDocument) pub;
}

boolean isDocument = doc != null;

boolean dataWriteEnabled = channel.isDataWriteEnabled();
boolean canWorkOn = dataWriteEnabled && isLogged && loggedMember.canWorkOn(pub);
boolean isVisible = pub.isInVisibleState();
boolean showEdit = canWorkOn;
boolean showRecommend = isVisible;
boolean showFollow = dataWriteEnabled && isLogged && pub.isPersisted() && pub.canBeFollowedBy(loggedMember);
boolean showAttach = dataWriteEnabled;
boolean showUnlock = canWorkOn && pub.isStrongLocked();
boolean showLock = canWorkOn && !pub.isStrongLocked();
boolean showRequestUnlock = pub.canRequestUnlock(loggedMember);
boolean showValidateState = dataWriteEnabled && canWorkOn && Util.notEmpty(pub.getNextWFStateSet(loggedMember));
boolean showDelete = dataWriteEnabled && isLogged && pub.checkDelete(loggedMember).isOK();
boolean showDuplicate = dataWriteEnabled && pub.canCreateCopy(loggedMember);
boolean showCaddy = dataWriteEnabled && isLogged && loggedMember.canPublishContent();
boolean showReaderTracker = ReaderTrackerManager.getInstance().canAccessReaderTracker(pub,loggedMember);
boolean showVersion = canWorkOn && (pub.isStored() || (pub instanceof HistorizedDBData)) && pub.hasBeenUpdated();
boolean showMetadata = isLogged;
boolean sticky = Util.toBoolean(request.getAttribute("publicationActionsSticky"), true);
boolean showPDFUpload = isDocument && canWorkOn && com.jalios.jcms.handler.AssociatedPDFUploadHandler.isPDFUploadAuthorized(doc);
%>
<jalios:include target="PUBLICATION_ACTIONS_TOP" />

<jalios:accordion css="jalios-accordion-sticky publication-actions hidden-print" multiOpen="true">

  <div class="list-group collapse-action-wrapper <% if (sticky) {%>sticky<%}%>">
    <%-- Toggle menu --%>
    <a class="list-group-item pub-action-toggle" data-jalios-action="toggle:selection-wrapper-side-open" data-jalios-target=".pub-action-toggler" href="#" onclick="return false;"><jalios:icon src="chevron-right" css="pub-action-toggle-opened"/><jalios:icon src="chevron-left" css="pub-action-toggle-closed"/></a>
  </div>

  <jalios:include target="PUBLICATION_ACTIONS_ACCORDION_TOP" />


  <jalios:accordion-panel css="publication-action-main panel-default" active="true">
    <div class="list-group sticky-action-group">

      <jalios:include target="PUBLICATION_ACTIONS_MAIN_ITEM_TOP" />


      <%-- Edit --%>
      <% if (showEdit){
           String customEditIcon = (String) request.getAttribute("PUBLICATION_ACTIONS_EDIT_ITEM");
           if(Util.notEmpty(customEditIcon)){
             %><%=customEditIcon %><%
           }else{%>
              <jalios:edit iconTitle='<%= glp("ui.com.alt.edit") %>' data="<%= pub %>" ctxEdit="false" popup="true" css="list-group-item pub-action-main pub-action-edit"><span class="pub-action-edit-icon nowrap"><jalios:icon src="edit"/></span> <span class="publication-action-label"><%= glp("ui.com.alt.edit") %></span></jalios:edit>
           <%}
         }%>

      <%-- Recommend --%>
      <% if (showRecommend) {
        String customRecommendIcon = (String) request.getAttribute("PUBLICATION_ACTIONS_RECOMMEND_ITEM");
        if(Util.notEmpty(customRecommendIcon)){
          %><%=customRecommendIcon %><%
        }else{%>
          <jalios:recommendation css="list-group-item pub-action-main pub-action-recommend" data="<%= pub %>"><jalios:icon src="recommendation" /> <span class="publication-action-label"><%= glp("ui.recommendation") %></span></jalios:recommendation>
      <% } %>
      <% } %>

      <%-- Unlock --%>
      <% if (showUnlock) { %>
      <a class="modal pub-action-optional pub-action-unlock list-group-item confirm" title="<%= glp("msg.js.confirm-unlock", HttpUtil.encodeForHTMLAttribute(pub.getTitle(userLang))) %>" href="edit.jsp?opUnlock=true&amp;id=<%= pub.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(ServletUtil.getUrl(request)) %>"><jalios:icon src="unlock-strong" /> <span class="publication-action-label"><%= glp("ui.com.alt.unlock") %></span></a>
      <% } %>

      <%-- Request Unlock --%>
      <% if (showRequestUnlock) { %>
        <a class="modal pub-action-optional list-group-item pub-action-request-unlock" href="work/requestUnlock.jsp?id=<%= pub.getId() %>"><jalios:icon src="mail-lock" /> <span class="publication-action-label"><%= glp("ui.work.alt.unlock-request") %></span></a>
      <% } %>

      <% if (isDocument) { %>
        <%@ include file='/front/publication/doPublicationActions_FileDocument.jspf' %>
      <% } %>

      <jalios:include target="PUBLICATION_ACTIONS_MAIN_ITEM_BOTTOM" />

      <%-- DELETE --%>
      <% if (showDelete){
           String customDeleteIcon = (String) request.getAttribute("PUBLICATION_ACTIONS_DELETE_ITEM");
           if(Util.notEmpty(customDeleteIcon)){
             %><%=customDeleteIcon %><%
           }else{%>
            <a class="modal confirm list-group-item pub-action-optional pub-action-delete" href="edit.jsp?id=<%= pub.getId() %>&amp;opDelete=true&amp;confirm=true&amp;redirect=<%= pub.getWorkspace().getHomeUrl(userLocale) %>"><jalios:icon src="delete" /> <%= glp("ui.com.btn.delete") %></a>
        <% } %>
      <% } %>

    </div>
  </jalios:accordion-panel>


  <jalios:include target="PUBLICATION_ACTIONS_ACCORDION_MIDDLE" />

  <jalios:accordion-panel title="ui.com.txt.more" active="false">
    <div class="list-group sticky-action-group">
      <jalios:include target="PUBLICATION_ACTIONS_OTHER_ITEM_TOP" />

      <%-- Attach --%>
      <% if (showAttach) {
           String customAttachIcon = (String) request.getAttribute("PUBLICATION_ACTIONS_ATTACH_ITEM");
           if(Util.notEmpty(customAttachIcon)){
             %><%=customAttachIcon %><%
           }else{%>
            <a  class="list-group-item modal pub-action-optional pub-action-attach" href="work/attachPublication.jsp?attachment=<%= pub.getId() %>" title="<%= glp("ui.work.attach-pub.modal.title") %>"><jalios:icon  src="link"/> <span class="publication-action-label"><%= glp("ui.work.attach-pub.link") %></span></a>
        <% } %>
      <% } %>

      <%-- State change --%>
      <% if (showValidateState) { %>
      <a class="list-group-item pub-action-optional pub-action-wf-validate modal" href="work/validateStateChange.jsp?id=<%= pub.getId() %>"><jalios:icon src="wf" /> <span class="publication-action-label"><%= glp("ui.com.alt.validate") %></span></a>
      <% } %>

      <%-- Merge workcopy --%>
      <% if (pub.isWorkCopy() && pub.canMergeWorkCopy(loggedMember)) { %>
      <a class="modal pub-action-optional pub-action-wf-merge list-group-item confirm" title="<%= glp("msg.js.confirm-mergecopy", HttpUtil.encodeForHTMLAttribute(pub.getTitle(userLang))) %>" href="edit.jsp?opMerge=true&amp;id=<%= pub.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(pub.getMainInstance().getDisplayUrl(userLocale)) %>"><jalios:icon src="duplicate-merge"  alt='<%= glp("ui.com.alt.duplicatemerge") %>' /> <span class="publication-action-label"><%= glp("ui.com.alt.duplicatemerge") %></span></a>
      <% } %>

      <%-- Lock --%>
      <% if (showLock) { %>
      <a class="modal pub-action-optional pub-action-lock list-group-item confirm" title="<%= glp("msg.js.confirm-lock", HttpUtil.encodeForHTMLAttribute(pub.getTitle(userLang))) %>" href="edit.jsp?opLock=true&amp;id=<%= pub.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(ServletUtil.getUrl(request)) %>"><jalios:icon src="lock-strong" /> <span class="publication-action-label"><%= glp("ui.com.alt.lock") %></span></a>
      <% } %>


      <%-- Upload PDF --%>
      <% if (showPDFUpload) { %>
      <a class="list-group-item pub-action-optional pub-action-upload-pdf modal" href="work/pdfUploadModal.jsp?id=<%= pub.getId() %>"><jalios:icon src="pdf" /> <span class="publication-action-label"><%= glp("filedocument.pdfupload.ctx-menu.upload-label") %></span></a>
      <% } %>


      <%-- Follow --%>
      <% if (showFollow) {
           String customFollowIcon = (String) request.getAttribute("PUBLICATION_ACTIONS_FOLLOW_ITEM");
           if(Util.notEmpty(customFollowIcon)){
             %><%=customFollowIcon %><%
           }else{%>
            <% if (pub.isFollowedBy(loggedMember)) { %>
              <a href="front/follow.jsp?id=<%= pub.getId() %>&amp;follow=false&amp;redirect=<%= ServletUtil.encodeURL(ServletUtil.getUrl(request)) %>" class="list-group-item pub-action-optional modal confirm pub-action-unfollow pub-action-main" title="<%= glp("ui.com.alt.unfollow-msg") %>"><jalios:icon src="unfollow" /> <span class="publication-action-label"><%= glp("ui.com.alt.unfollow") %></span></a>
            <% } else { %>
              <a href="front/follow.jsp?id=<%= pub.getId() %>&amp;redirect=<%= ServletUtil.encodeURL(ServletUtil.getUrl(request)) %>" class="list-group-item pub-action-optional modal confirm pub-action-follow pub-action-main" title="<%= glp("ui.com.alt.follow-msg") %>"><jalios:icon src="follow" /> <span class="publication-action-label"><%= glp("ui.com.alt.follow") %></span></a>
            <% } %>
          <% } %>
      <% } %>

      <%-- Reader --%>
      <% if (showReaderTracker) {%>
        <a class="list-group-item modal pub-action-reader pub-action-optional" onclick="return false;" href="front/readerTracking/readerTrackingModal.jsp?trackedPubId=<%= pub.getId() %>" title="<%= glp("ui.work.rdr.title1") %>"><jalios:icon src="reader-tracking" /> <span class="publication-action-label"><%= glp("ui.adm.prop.tab.readertracker") %></span></a>
      <% } %>

      <%-- Version --%>
      <% if (showVersion) {%>
        <a class="list-group-item pub-action-optional pub-action-version" href="work/version.jsp?id=<%= pub.getId() %>"><jalios:icon src="version" /> <span class="publication-action-label"><%= glp("ui.com.alt.version") %></span></a>
      <% } %>

      <%-- Caddy --%>
      <% if (showCaddy) { %>
        <jalios:caddy css="list-group-item pub-action-optional pub-action-caddy" displayLinkText="true" data='<%= pub %>'/>
      <% } %>

      <%-- Duplicate --%>
      <% if (showDuplicate) { %>
        <%
        String duplicateUrl = "work/duplicate.jsp?popupEdition=true&amp;redirectOnClosePopup=true&amp;redirectToCopyPreview=true&amp;id=" + pub.getId();
        String duplicateFunc = "function() {Popup.popupWindow(JCMS.Security.getUrlWithCSRFToken('" + contextPath + "/" + duplicateUrl + "'), 'Copy', 900, 600);}";
        String duplicateOnclick = "confirmJSAction('" + HttpUtil.encodeForJavaScript(glp("msg.js.confirm-copy", pub.getTitle(userLang))) + "', " + duplicateFunc + "); return false;";
        %>
        <a class="list-group-item pub-action-optional pub-action-duplicate" href="#" onclick="<%= duplicateOnclick %>" ><jalios:icon src="duplicate" /> <span class="publication-action-label"><%= glp("ui.com.alt.duplicate") %></span></a>
      <% } %>


      <%-- PermaLink --%>
      <a href='<%= PortalManager.getPermalink(pub, userLocale) %>' class="list-group-item modal permalink pub-action-optional pub-action-permalink"><jalios:icon src='permalink' css="tool" alt='<%= glp("ui.com.alt.permalink") %>'  /> <span class="publication-action-label"><%= glp("ui.com.title.permalink") %></span></a>

      <%-- Print --%>
      <%
        String customPrintIcon = (String) request.getAttribute("PUBLICATION_ACTIONS_PRINT_ITEM");
        if(Util.notEmpty(customPrintIcon)){
          %><%=customPrintIcon %><%
        }else{
          String printUrl = ServletUtil.getUrlWithUpdatedParams(request,new String[]{"id","portal","printView","qs","highlight","portlet"},new String[]{pub.getId(), channel.getProperty("channel.default-printportal"),"true", null, null, null});
          %>
          <a class="list-group-item <%= pub instanceof FileDocument ? "pub-action-optional" : "pub-action-main" %> pub-action-print" rel="nofollow" href="<%= printUrl %>"><jalios:icon src="printer" css="tool" /> <span class="publication-action-label"><%= glp("ui.com.alt.print") %></span></a>
      <%} %>

      <%-- Metadata --%>
      <% if (showMetadata) {%>
        <a class="list-group-item pub-action-optional pub-action-metadata modal" href="work/pubMetadata.jsp?id=<%= pub.getId() %>"><jalios:icon src="info" /> <span class="publication-action-label"><%= glp("ui.com.lbl.infos") %></span></a>
      <% } %>


      <jalios:include target="PUBLICATION_ACTIONS_OTHER_ITEM_BOTTOM" />

    </div>
  </jalios:accordion-panel>
  <jalios:include target="PUBLICATION_ACTIONS_ACCORDION_BOTTOM" />

</jalios:accordion>

<jalios:include target="PUBLICATION_ACTIONS_BOTTOM" />
