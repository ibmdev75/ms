<%--
  @Summary: Display a media preview inside the MediaBrowser (iframe)
--%><%@ include file='/jcore/doInitPage.jspf' %><% 
jcmsContext.addCSSHeader("css/jalios/mediabrowser.css"); 
// Make sure we are in the proper zone
request.setAttribute("zone","WorkArea");

  final boolean displayInformations = true;
  final boolean displayDescription = true;
  final boolean displayMetaData = true;

  FileDocument fileDoc = getDataParameter("fileDocID", FileDocument.class);
  boolean selectMode = getBooleanParameter("selectMode", false);
  if (fileDoc == null || !fileDoc.canBeReadBy(loggedMember)) {
    return;
  }

  boolean isFirst = getBooleanParameter("first", false);
  boolean isLast = getBooleanParameter("last", false);
  int itemIdx = getIntParameter("itemIdx", 0);
%>
<jalios:modal>
  <div class="media mb-item-preview" data-jalios-mb-current-idx="<%= itemIdx %>">

     <%-- Preview --%>
     <div class="<% if (!fileDoc.isAudio() && !fileDoc.isVideo()) { %>pull-left<% } %> br">
       <jalios:media fileDoc='<%= fileDoc %>' maxWidth='480' maxHeight='360' />
     </div>
     
     <div class="media-body">
     
    <%-- Description--%>
    <% if (displayDescription && Util.notEmpty(fileDoc.getDescription(userLang))) { %>
    <p <%= gfla(fileDoc, "abstract") %>>
      <strong><%= glp("ui.com.lbl.description") %></strong> : <br />
      <jalios:wiki><%= fileDoc.getDescription(userLang) %></jalios:wiki>
    </p>
    <% } %>
    
    <%-- Infos --%>
    <jalios:accordion>
    
    <% if (displayInformations) { %>
    <jalios:accordion-panel title="ui.com.lbl.infos" active="true">
    <dl class="dl-horizontal">

      <%-- Dimensions (images) --%>
      <% if (fileDoc.isImage() && fileDoc.getDimensions() != null) { %>
      <dt><%= glp("ui.filedocument.lbl.dimensions") %></dt>
      <dd><%= fileDoc.getDimensions() %>&nbsp;</dd>
      <% } %>
      
      <%-- Duration(audio) --%>
      <% if (fileDoc.isAudio()) { %>
      <dt><%= glp("ui.filedocument.lbl.duration") %></dt>
      <dd><jalios:duration time='<%= fileDoc.getDuration() %>' />&nbsp;</dd>
      <% } %>
      
      <%-- File Size --%>
      <dt><%= glp("ui.filedocument.lbl.size") %></dt>
      <dd><jalios:filesize doc='<%= fileDoc %>'/></dd>
      
      <%-- File Type --%>
      <dt><%= glp("ui.filedocument.lbl.file-type") %></dt>
      <dd>
        <jalios:fileicon doc='<%= fileDoc %>' />
        <%= fileDoc.getTypeInfo(userLang) %>
      </dd>
      
      <%-- MDATE --%>
      <dt><%= glp("ui.com.lbl.mdate-long") %></dt>
      <dd>
        <jalios:date date='<%= fileDoc.getMdate() %>' format='<%= "short" %>' />
        <jalios:time date='<%= fileDoc.getMdate() %>' format='<%= "short" %>' /> &nbsp;
      </dd>
      
    </dl>
    </jalios:accordion-panel>
    
    <jalios:accordion-panel title="ui.work.form.tab.adv">
    <dl class="dl-horizontal">
      
      <%-- CDATE --%>
      <dt><%= glp("ui.com.lbl.cdate-long") %></dt>
      <dd>
        <jalios:date date='<%= fileDoc.getCdate() %>'  format='<%= "short" %>' />
        <jalios:time date='<%= fileDoc.getCdate() %>'  format='<%= "short" %>' /> &nbsp;
      </dd>
      
      <%-- SDATE --%>
      <dt><%= glp("ui.com.lbl.sdate-long") %></dt>
      <dd>
        <jalios:date date='<%= fileDoc.getSdate() %>'  format='<%= "short" %>' />
        <jalios:time date='<%= fileDoc.getSdate() %>'  format='<%= "short" %>' /> &nbsp;
      </dd>
      
      <%-- Categories --%>
     <% if (Util.notEmpty(fileDoc.getCategorySet())) { %>
      <dt><%= glp("ui.com.lbl.categories") %></dt>
        <% for (Iterator itCat = fileDoc.getCategorySet().iterator(); itCat.hasNext(); ) { %>
         <% Category cat = (Category) itCat.next(); %>
         <dd title="<%= encodeForHTMLAttribute(cat.getAncestorString(" > ", true)) %>">
           - <%= cat.getName(userLang) %>
         </dd>
        <% } %>
     <% } %>
     
      <%-- Weak Refererer --%>
     <% if (fileDoc.hasWeakReferrers()) { %>
      <dt><%= glp("ui.work.form.lbl.weak-ref") %></dt>
        <% for (Iterator itWeakRef = fileDoc.getWeakReferrerSet().iterator(); itWeakRef.hasNext(); ) { %>
         <% Publication referrer = (Publication) itWeakRef.next(); %>
         <dd title="<%= encodeForHTMLAttribute(referrer.getTitle(userLang), true) %>">
           - <jalios:link data='<%= referrer %>' htmlAttributes="target='_blank'"><%= Util.wordWrap(referrer.getTitle(userLang), 20, " ", true) %></jalios:link>
             <jalios:edit pub='<%= referrer %>' popup='<%= true %>' />
         </d>
        <% } %>
     <% } %>
     
      <%-- Refererer --%>
     <% if (fileDoc.getLinkCount() > 0) { %>
        <dt><%= glp("ui.work.form.lbl.link-ref") %></dt>
         <% Map referrerMap = (Map) channel.getLinkIndexManager().getIndex().get(fileDoc); %>
         <jalios:foreach name="itClass" type="Class" collection="<%= referrerMap.keySet() %>">
         <dd>
          <%= channel.getTypeLabel(itClass, userLang) %>
          <ul>
          <% for (Iterator itReferrer = channel.getLinkIndexedDataSet(fileDoc, itClass).iterator(); itReferrer.hasNext(); ) { %>
           <% Data referrer = (Data) itReferrer.next(); %>
           
           <li title="<%= encodeForHTMLAttribute(referrer.getDataName(userLang), true) %>">
             - <jalios:link data='<%= referrer %>' htmlAttributes="target='_blank'"><%= Util.wordWrap(referrer.getDataName(userLang), 20, " ", true) %></jalios:link>
               <jalios:edit data='<%= referrer %>' popup='<%= true %>' />
           </li>
          <% } %>
          </ul>
         </dd>
         </jalios:foreach>
     <% } %>
     
      <%-- Author/Writer --%>
      <dt><%= glp("ui.com.lbl.author") %></dt>
      <dd><%= fileDoc.getAuthor().getFullName() %></dd>
      
      <%-- Content Type --%>
      <dt><%= glp("ui.filedocument.lbl.ctnt-type") %></dt>
      <dd><%= Util.wordWrap(fileDoc.getContentType(), 20, " ", true) %></dd>
      
      <%-- Original Filename --%>
      <dt><%= glp("ui.filedocument.lbl.ori-filename") %></dt>
      <dd><%= Util.wordWrap(fileDoc.getOriginalFilename(), 20, " ", true) %></dd>
      
      <%-- Version --%>
      <dt><%= glp("ui.com.lbl.version") %></dt>
      <dd><%= fileDoc.getVersionString() %> </dd>
    
    </dl>
    </jalios:accordion-panel>
    
    <% } %>
    
    <jalios:accordion-panel title="ui.com.lbl.metadata">
    <dl class="dl-horizontal">
  
    <%-- MetaData --%>
    <% 
      if (displayMetaData && Util.notEmpty(fileDoc.getMetaDataMap())) {
         Map metaDataMap = fileDoc.getMetaDataMap();
         TreeSet keySet = new TreeSet(); 
         keySet.addAll(metaDataMap.keySet());
         int mdCounter = 0; 
         for (Iterator itKey = keySet.iterator(); itKey.hasNext();) {
           String metaDataTag = (String) itKey.next();
           String mdLabelProp = "metadata." + metaDataTag;
           String mdLabel = glp(mdLabelProp);
           mdLabel = mdLabel.equals(mdLabelProp) ? metaDataTag : mdLabel;
           mdLabel = mdLabel.startsWith("image.") ? mdLabel.substring("image.".length()) : mdLabel;
         %>
          <dt><%= encodeForHTML(mdLabel) %></dt>
          <dd><%= encodeForHTML(Util.wordWrap(fileDoc.getMetaData(metaDataTag), 20, " ", true)) %></dd>
         <% 
        }
      }
    %>
    
    </dl>
    </jalios:accordion-panel>
    
    </jalios:accordion>
    
    </div> <%-- media-body --%>

  </div> <%-- media --%>
    
  <jalios:buffer name="MODAL_BUTTON">
    <jalios:edit pub='<%= fileDoc %>' popup='<%= true %>'  css="btn btn-default">
     <%= glp("ui.com.alt.edit") %>
    </jalios:edit>
    <% if (!isFirst) { %>
      <button name="opPrev" class="btn btn-default preview-previous" onclick="return false;">
         <%= glp("ui.com.btn.previous") %>
      </button>
    <% } %>
    <% if (!isLast) { %>
      <button name="opNext" class="btn btn-primary preview-next" onclick="return false;">
         <%= glp("ui.com.btn.next") %>
      </button>
    <% } %>
   <% if (selectMode) { %>
    <button name="opSelectMedia" class="btn btn-primary select-media"
            data-jalios-mb-doc-id="<%= fileDoc.getId() %>"
            data-jalios-mb-doc-title="<%= encodeForHTMLAttribute(fileDoc.getTitle(userLang)) %>"
            data-jalios-mb-doc-mediatype="<%= encodeForHTMLAttribute(fileDoc.getMediaType()) %>"
            data-jalios-mb-doc-filename="<%= encodeForHTMLAttribute(fileDoc.getFilename()) %>"
            <% if (fileDoc.isImage()) { %>
            data-jalios-mb-doc-width="<%= fileDoc.getWidth() %>"
            data-jalios-mb-doc-height="<%= fileDoc.getHeight() %>"
            <% } %>
             onclick="return false;">
        <%= glp("ui.work.mediabrowser.select") %>
    </button>
   <% } %>
  </jalios:buffer>
    
  <jalios:buffer name="title">
    <%= encodeForHTML(fileDoc.getTitle()) %>
    <% if (!fileDoc.isInVisibleState()) { %>
     <span class='work-state wfstate pstatus-<%= fileDoc.getPstatus() %>'><%= fileDoc.getWFStateLabel(userLang) %></span>
    <% } %>
    <jalios:checkIntegrity data="<%= fileDoc %>"/>
    <jalios:lock data="<%= fileDoc %>"/>
  </jalios:buffer>
</jalios:modal>
