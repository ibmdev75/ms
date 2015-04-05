<%@ include file="/jcore/doInitPage.jspf" %><%
  Publication pub = getPublicationParameter("ttId");
  if (pub == null || !pub.canBeReadBy(loggedMember)){
    Object tmpObj = request.getAttribute("JCMS_TTCARD_PUBLICATION");
    if(tmpObj != null && tmpObj instanceof Publication){
      pub =(Publication) tmpObj;
	    if (!pub.canBeReadBy(loggedMember)){      
	      return;
	    }
    }
    else{
      return;
    }
  }
  
  TypeFieldEntry tfe = channel.getTypeAbstractFieldEntry(pub.getClass());
  
  String pubAbstract  = pub.getAbstract(userLang);
  
  boolean hasThumbnail = Util.notEmpty(pub.getDataImage());
  boolean hasThumbshot = pub instanceof WebPage && Util.notEmpty(channel.getProperty("tag.thumbnail.thumbshot.url"));
  
  if (!hasThumbnail && pub instanceof FileDocument && ((FileDocument)pub).getFile() != null) {
    File thumbnailFile = com.jalios.jcms.taglib.ThumbnailTag.createThumbnail((FileDocument)pub, null, null, null, JcmsConstants.TTCARD_MEDIA_WIDTH, JcmsConstants.TTCARD_MEDIA_HEIGHT);
    hasThumbnail = thumbnailFile != null;
  }
  
  Category[] categories = pub.getCategories(loggedMember);
%>
<div class="tt-card tt-publication <%= pub.getClass().getSimpleName()%>">
  <div class="tt-card-body">
    <div class="tt-card-title">
      <jalios:dataicon data="<%= pub %>"/> <jalios:link data="<%= pub %>" />
    </div>
    <div class="tt-card-abstract">
      <%-- Thumbnail --%>
      <% if (hasThumbnail || hasThumbshot) { %>
      <div class="tt-card-thumbnail pull-left">
        <% if (hasThumbnail) { %>
          <jalios:link data="<%= pub %>"><jalios:thumbnail data="<%= pub %>"
                            width="<%= JcmsConstants.TTCARD_MEDIA_WIDTH %>"
                            height="<%= JcmsConstants.TTCARD_MEDIA_HEIGHT %>"
                            alt="<%= pub.getTitle(userLang) %>" css="photo img-thumbnail" /></jalios:link>
          <%  } else if (hasThumbshot) { %>
          <jalios:link data="<%= pub %>"><jalios:thumbnail url="<%= Util.getString(((WebPage)pub).getUrlToShot(), ((WebPage)pub).getUrl()) %>" 
                            width="<%= JcmsConstants.TTCARD_MEDIA_WIDTH %>"
                            height="<%= JcmsConstants.TTCARD_MEDIA_HEIGHT %>"
                            css="img-thumbnail"><span>?</span></jalios:thumbnail></jalios:link>
          <% } %>
          <div class="photo-anchor"><jalios:include target="PUB_VISUAL_ANCHOR" targetContext="inline" /></div>
      </div>
      <% } %>
      
      <div class="tt-card-abstract-text">
        <%-- Title --%>
        <div class="name">
          <% if (pub.isWorkCopy()) { %>
          <span class="wfstate" title="<%= glp("ui.com.lbl.workcopyof", pub.getMainInstance().getTitle(userLang)) %>"><%= glp("ui.com.lbl.workcopy") %></span>
          <% } %>
        </div>
        <%-- Abstract --%>
        <% if (Util.notEmpty(pubAbstract)) { %>
        <div class="abstract">
          <% if (tfe != null && tfe.isWysiwyg()){ %>
            <jalios:wysiwyg><%= pubAbstract %></jalios:wysiwyg>
          <% } else { %>
          <jalios:wiki truncateLength="400" truncateSuffix="..."><%= pubAbstract %></jalios:wiki>
          <% } %>    
        </div>
        <% } %>
      </div>
    </div>
    
    <%-- PUBLICATION_TOOLTIP_CONTENT_TOP --%>
    <jalios:buffer name="contentTopBuffer">
      <jalios:include target="PUBLICATION_TOOLTIP_CONTENT_TOP" targetContext="bloc" />
    </jalios:buffer>
    <% if (Util.notEmpty(contentTopBuffer)) { %>
    <div class="tt-card-section">
      <%= contentTopBuffer %>
    </div>
    <% } %>
    
    <%-- METADATA --%>    
    <div class="tt-card-meta">
      <% if (pub instanceof FileDocument) { 
        FileDocument doc = (FileDocument) pub;
      %>
      <div class="doc">
        <jalios:dataicon data="<%= doc %>" />&nbsp;<%= doc.getTypeInfo(userLang) %> /
        <jalios:filesize doc='<%= doc %>' />
        <%   if (doc.isImage()) { %>&middot; <%= doc.getDimensions() %><% } %>
        <%   if (doc.getDuration() > 0) { %>&middot; <jalios:duration time='<%= doc.getDuration() %>'/><% } %>        
      </div>
      <% } %>
      
      
      <%-- Fields --%>
      <% boolean showUpdated = true; %>
      <% if (pub instanceof FileDocument) { %>
        <div class="author">
          <jalios:memberphoto member="<%= pub.getAuthor() %>" size="<%= PhotoSize.ICON %>"/>
        <%= glp("ui.work.query.txt.uploaded") %>    
        <jalios:link data="<%= pub.getAuthor() %>" />
        <%= JcmsUtil.getFriendlyDate(pub.getCdate(), DateFormat.SHORT, true, userLocale) %>
        </div>
        <% showUpdated = pub.getOpAuthor() != null && pub.getCdate() != null && Math.abs(pub.getMdate().getTime() - pub.getCdate().getTime()) > 2000 ; %>    
      <% } %>
      
      <% if (showUpdated) { %>
        <div class="author">
        <jalios:memberphoto member="<%= pub.getOpAuthor() != null ? pub.getOpAuthor() : pub.getAuthor() %>" size="<%= PhotoSize.ICON %>"/>
        <%= glp("ui.work.query.txt.updated") %>    
        <jalios:link data="<%= pub.getOpAuthor() != null ? pub.getOpAuthor() : pub.getAuthor() %>" />
        <%= JcmsUtil.getFriendlyDate(pub.getMdate(), DateFormat.SHORT, true, userLocale) %>
        </div>
      <% } %>
    </div>
    
    <%-- PUBLICATION_TOOLTIP_CONTENT_BOTTOM --%>
    <jalios:buffer name="contentBottomBuffer">
      <jalios:include target="PUBLICATION_TOOLTIP_CONTENT_BOTTOM" targetContext="bloc" />
    </jalios:buffer>
    <% if (Util.notEmpty(contentBottomBuffer)) { %>
    <div class="tt-card-section">
      <%= contentBottomBuffer %>
    </div>
    <% } %>
    
  </div><%-- EOF .tt-card-body --%>

  <%-- FOOTER --%>
  <jalios:buffer name="footerBuffer">
    <jalios:include target="PUBLICATION_TOOLTIP_FOOTER_START" targetContext="inline" />
    <% if (pub instanceof FileDocument) { %>
    <button type="button" class="btn btn-success op-download" name="opDownload" value="true" onClick="return Popup.redirect('<%= ServletUtil.getContextPath(request) %>/<%= ((FileDocument)pub).getFilename() %>');"><jalios:icon src="download-btn" /> <%= glp("ui.com.btn.download") %></button>
    <% } %>
    <jalios:include target="PUBLICATION_TOOLTIP_FOOTER" targetContext="inline" />
  </jalios:buffer>
  
  <% if (Util.notEmpty(footerBuffer)) { %>
  <div class="tt-card-footer popover-footer tt-btn focus">
    <%= footerBuffer %>
  </div>
  <% } %>
</div>