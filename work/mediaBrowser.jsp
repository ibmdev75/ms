<%--
  @Summary: Media Browser
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ include file='/work/doInsertLinkParams.jspf' %><%
%><jsp:useBean id="mbHandler" scope="page" class="com.jalios.jcms.media.MediaBrowserHandler"><%
  %><jsp:setProperty name="mbHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name="mbHandler" property="*" /><%
%></jsp:useBean><%
%><% 
  if (mbHandler.validate()) {
    return;
  }
  request.setAttribute("title", glp("ui.work.mediabrowser.title"));

  // previewMediaID ==> given by doMediaBrowserFullDisplay.jsp when refreshing.
  //  - we make it work like an action portlet param (put in session redirect, and remove)
  //    other part of this code is at end of this jsp
  FileDocument previewedMedia = getDataParameter("previewedMediaID", FileDocument.class);
  // First step: add param to session in order to prevent
  // params to be reused in ServletUtil.getUrlWithUpdateParams
  if (previewedMedia != null) {
    request.getSession().setAttribute("previewedMediaID", previewedMedia.getId());
    sendRedirect(ServletUtil.getUrlWithUpdatedParam(request, "previewedMediaID", null), request, response);
    return;
  }
  // Second step: retrieve from session and remove
  FileDocument previewedMediaSession = channel.getData(FileDocument.class, (String) request.getSession().getAttribute("previewedMediaID"));
  if (previewedMediaSession != null) {
    previewedMedia = previewedMediaSession;    
    request.getSession().removeAttribute("previewedMediaID");
  }

  boolean selectMode = Util.notEmpty(jsFunc) || getBooleanParameter("selectMode",false) || hasParameter("tinyMCEPopup");

  // Set Custom CSS File for doEmptyHeader.jsp
  jcmsContext.addCSSHeader("css/jalios/mediabrowser.css");
  // Make sure we are in the proper zone
  request.setAttribute("zone","WorkArea");

%><%@ include file='/jcore/doEmptyHeader.jspf' %>
<div class="navbar-placeholder"></div>

<jalios:javascript>
!function ($) {  

  var register = function(){
    
    $(document).on("click", ".select-media", function(event){
      selectMedia(event);
    });
    
    
    $(document).on("click", ".preview-previous", function(event){
      preview(-1);
    });        
    $(document).on("click", ".preview-next", function(event){
      preview(+1);
    });    
    
    $("body").keydown(function(e) {
      if(e.keyCode == 37) { // left
        preview(-1);
      }
      else if(e.keyCode == 39) { // right
        preview(+1);
      }
    });    
     
  }
  
  var preview = function(increment) {
    var $currentItemPreview = $(".mb-item-preview");
    if (!$currentItemPreview.exists()) {
      return;
    }
    var $modal = $('#jalios-modal');
    if (!$modal.exists() || !$modal.data('bs.modal').isShown) {
      return;
    }
    
    var currentIdx = parseInt($currentItemPreview.attr('data-jalios-mb-current-idx'), 10);
    var previewUrl = $('.mb-gallery-item-' + (currentIdx + increment) ).attr('data-jalios-mb-preview-url');
    $.jalios.AjaxRefresh.refresh(previewUrl,'#jalios-modal', {noscroll:true});
  }  
  
  var selectMedia = function(event) {
    var $elm = $(event.currentTarget);
    var fdID = $elm.attr("data-jalios-mb-doc-id");
    var fdTitle = $elm.attr("data-jalios-mb-doc-title");
    var fdMediaType = $elm.attr("data-jalios-mb-doc-mediatype");
    var fdURL = $elm.attr("data-jalios-mb-doc-filename");
    var p1 = $elm.attr("data-jalios-mb-doc-width");
    var p2 = $elm.attr("data-jalios-mb-doc-height");
                        
   <%
   // TinyMCE when used through toolbar button 
   if (Util.getString(jsFunc, "").startsWith("tinymce.plugins.JcmsPluginCB.")) {
     jcmsContext.addJavaScript("js/tiny_mce/tiny_mce_popup.js?nopack"); %>
     tinyMCEPopup.getWin().<%= jsFunc %>(fdID, fdTitle, fdMediaType, fdURL, '<%= encodeForJavaScript(targetInput) %>', '<%= encodeForJavaScript(targetLabel) %>', p1, p2);
     tinyMCEPopup.close(); <%
   }
   // TinyMCE when used through buttons inside other windows (file chooser in image/video popup)
   else if (hasParameter("tinyMCEPopup")) {
    jcmsContext.addJavaScript("js/tiny_mce/tiny_mce_popup.js?nopack"); %>
    var win = tinyMCEPopup.getWindowArg("window");
    win.document.getElementById(tinyMCEPopup.getWindowArg("input")).value = fdURL;
    var altInput = win.document.getElementById("alt"); // For default image edition
    if (altInput && fdTitle) { altInput.value = fdTitle };
    var titleInput = win.document.getElementById("title"); // For TinyMCE advimage plugin 
    if (titleInput && fdTitle) { titleInput.value = fdTitle };
    var widthInput = win.document.getElementById("width");
    if (widthInput && p1) { widthInput.value = p1 };
    var heightInput = win.document.getElementById("height");
    if (heightInput && p2) { heightInput.value = p2 };
    if (win.ImageDialog) {
      if (win.ImageDialog.getImageData) win.ImageDialog.getImageData();
      if (win.ImageDialog.showPreviewImage) win.ImageDialog.showPreviewImage(fdURL);
    }
    tinyMCEPopup.close();
   <% } else if (Util.notEmpty(jsFunc)) { %> 
    if (window.opener) {
      opener.<%= jsFunc %>(fdID, fdTitle, fdMediaType, fdURL, '<%= encodeForJavaScript(targetInput) %>', '<%= encodeForJavaScript(targetLabel) %>', p1, p2);
      close();
    }
   <% } else { %>
      Popup.callback(fdID, fdTitle, fdMediaType, fdURL, p1, p2);
      close();
   <% } %>
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);
</jalios:javascript>
<jalios:pager name='mbPagerHandler' declare="true" action='init'
              pageSize='<%= channel.getIntegerProperty("media-browser.page-size", 64) %>' sort='mdate'
              size='<%= mbHandler.getResultSet().getResultSize() %>' />
              
<div class="media-browser">

<jalios:javascript>
!function ($) {  
  function navbarautohide() {
    var navbar = $('.navbar-autohide');
    navbar.removeClass('navbar-autohide-level1'); // set standart view
    navbar.removeClass('navbar-autohide-level2'); // set standart view
    if (navbar.innerHeight() > 50) { // check if we've got 2 lines
      navbar.addClass('navbar-autohide-level1'); // force collapse mode
      if (navbar.innerHeight() > 50) {
        navbar.addClass('navbar-autohide-level2'); // force collapse mode
      }
    }
  }
  
  navbarautohide();
  $(window).on('resize', navbarautohide);  
}(window.jQuery);
</jalios:javascript>
  <div class="mb-nav navbar navbar-default navbar-fixed-top no-navbar-brand navbar-autohide navbar-autohide-on" role="navigation">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mb-navbar-collapse">
          <jalios:icon src="nav-burger"/> 
        </button>
      </div>
  
      <div id="mb-navbar-collapse" class="collapse navbar-collapse">
        
        <ul class="nav navbar-nav navbar-left">
          
          <%-- Upload button --%>
          <%
           if (isLogged && loggedMember.canPublishSome(FileDocument.class, workspace)) {
             %><li><jalios:edit type='FileDocument' 
                          cids='<%= JcmsUtil.dataListToString(mbHandler.getCategorySet(), ",") %>' 
                          redirect='<%= ServletUtil.getBaseUrl(request) + mbHandler.getMediaURL("all", false) %>'
                          params='<%= "unzipUploadedFiles=true&nbElt=1&pstatus=0&pluploadFilter=media&ensureLuceneIndexing=true" %>'
                          popup="<%= false %>"><jalios:icon src='upload'/> <%= glp("ui.com.btn.upload") %></jalios:edit></li><%
           }
          %>
          
          <%-- Workspace chooser --%>
          <li class="typeahead-container">
            <a href="#" class="typeahead-label">
              <%
                if (!mbHandler.isWorkspaceFilter()) { 
                  %><%= glp("ui.work.mn.allworkspaces") %><%
                } else { 
                  %><%= encodeForHTML(workspace.getTitle(userLang)) %><% 
                }
              %>
             <jalios:icon src="caret" />
            </a> 
            
            <div class="typeahead-input" style="display:none"> 
              <form class="navbar-form  navbar-right noSingleSubmitButton" role="search">                
                <div class="form-group">
                 <div class="input-group jalios-input-group">
                  <input type="text" class="form-control typeahead" name="text" 
                         placeholder="<%= glp("ui.topbar.workspace.placeholder") %>"
                         data-jalios-ajax-refresh-url="jcore/autocomplete/acworkspaceQuery.jsp" 
                         data-ac-lookup-empty="true" />
                  <div class="input-group-btn">
                     <button type="button" name="close-typeahead" class="btn btn-default">
                       <jalios:icon src="topbar-space-close" css="close-button typeahead-close"/>
                     </button>
                  </div>
                 </div>
                </div>
              </form>
            </div>
          </li>
        
          <%-- Media Type --%>
          <% if (mbHandler.getMediaList().size() == 1) { %>
          <% String activeMedia = mbHandler.getMediaList().get(0); %>
          <li class="active navbar-autohide-level2-item">
            <a href="<%= mbHandler.getMediaURL(activeMedia, true) %>">
             <%= glp("ui.work.mediabrowser.media." + activeMedia) %>
            </a>
          </li>
          <% } else { %>          
          <li class="dropdown navbar-autohide-level2-item">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <%= glp("ui.work.mediabrowser.media." + mbHandler.getCurrentMedia()) %>
              <jalios:icon src="caret"/>
            </a>
            <ul class="dropdown-menu">
             <% for (Iterator itMedia = mbHandler.getMediaList().iterator(); itMedia.hasNext(); ) { 
                 String media = (String) itMedia.next(); %>
               <li class="<%= mbHandler.isCurrentMedia(media) ? "active" : ""%>">
                <a href="<%= mbHandler.getMediaURL(media, true) %>">
                 <%= glp("ui.work.mediabrowser.media." + media) %>
                </a>
               </li><%
               }
             %>
            </ul>
          </li>
          <% } %>
          
          <%-- Sort link --%>
          <%
            Map<String,String> sortLabelMap = new LinkedHashMap<String,String>();
            sortLabelMap.put("title", "ui.com.lbl.title");
            sortLabelMap.put("dimensions", "ui.filedocument.lbl.dimensions");
            sortLabelMap.put("duration", "ui.filedocument.lbl.duration");
            sortLabelMap.put("size", "ui.filedocument.lbl.size");
            sortLabelMap.put("contentType", "ui.filedocument.lbl.file-type");
            sortLabelMap.put("cdate", "ui.com.lbl.cdate-long");
            sortLabelMap.put("mdate", "ui.com.lbl.mdate-long");
            sortLabelMap.put("sdate", "ui.com.lbl.sdate-long");    
          %>        
          <li class="dropdown navbar-autohide-level1-item">
            <a  class="dropdown-toggle" data-toggle="dropdown" href="#">
              <%= glp("ui.fo.query.sort") %> <%= glp(sortLabelMap.get(mbPagerHandler.getSort())) %>
              <jalios:icon src="caret" />
            </a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="sort-dropdownMenu">
            <% for (String sortId : sortLabelMap.keySet()) { %>
               <li <%= sortId.equals(mbPagerHandler.getSort()) ? "class='active'" : "" %>>
                 <a href="<%= mbPagerHandler.getSortURL(sortId, !mbPagerHandler.isReverse()) %>"><%= glp(sortLabelMap.get(sortId)) %></a>
               </li>
            <% } %>
            </ul>
          </li>
          
          <jalios:include target="MEDIA_BROWSER_ACTIONS" targetContext="li" />
          
        </ul>
        
        <%-- Search box --%>
        <form class="navbar-form  navbar-right noSingleSubmitButton" role="search" action="work/mediaBrowser.jsp">
          <%= printDisabledHiddenParams(request, Arrays.asList(new String[] {"text", "ws"})) %>
          <div class="form-group ">
           <div class="input-group jalios-input-group">
            <input type="text" class="form-control" value="<%= encodeForHTMLAttribute(mbHandler.getText()) %>" 
                   name="text" placeholder="<%= glp("ui.com.placeholder.search") %>">
            <div class="input-group-btn">
              <button type="submit" name="opSearch" class="btn btn-default">
                <jalios:icon src="search" />
              </button>
            </div>
           </div>
          </div>
        </form>
          
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </div><%-- navbar --%>

  
   
  <div class="container-fluid">
  <div class="row br">
  
    <%-- *** MEDIA BROWSER - LEFT PANEL ******************* --%>
    <div class="mb-categories hidden-xs col-sm-3 col-md-2" role="navigation">
     <div class="overflowing-panel">
        <% 
          Set wCatSet = mbHandler.getWorkspace().getCatSet();
          if (!mbHandler.isWorkspaceFilter() || wCatSet.size() > 1){
            wCatSet = new TreeSet();
            wCatSet.addAll(channel.getRootCategory().getChildrenSet());
          }
  
          Set treeCatHSet = mbHandler.getCategorySet();
          if (wCatSet.size() == 1 && wCatSet.contains(channel.getRootCategory())) {
            wCatSet = new TreeSet();
            wCatSet.addAll(channel.getRootCategory().getChildrenSet());
          }
        %>
        
          <jalios:treecatview 
              prefix="mbTC"
              link='<%= ServletUtil.getUrlWithUpdatedParams(request, new String[] {"cids", "pagerAll"}, new String[] {"_NODE_ID_", null}) %>'
              
              collection="<%= wCatSet %>"
              opened="<%= treeCatHSet %>"
              highlighted="<%= treeCatHSet %>"
              
              dragdrop="true"
              showCtxMenu="true"
              css="autocomplete"
          />
      </div>
    </div><%-- mb-categories --%>
  
  <%-- *** MEDIA BROWSER - CENTER PANEL ******************* --%>
  <div class="mb-main-container col-xs-12 col-sm-9 col-md-10">
      
    <%-- GALLERY --%>
    <div class="container-fluid">
    
     <% if (isLogged && loggedMember.canPublishSome(FileDocument.class, workspace)) { %>
     <div class="mb-drop-zone row">
      <div class="container-fluid">
        <%
        String docChooserUrl = "work/docChooserInline.jsp?" +
                               "pluploadFilter=media" + // Selection options
                               "&ws="+workspace.getId()+"&pstatus=0&cids="+JcmsUtil.dataListToString(mbHandler.getCategorySet(), ",") + // Create options
                               "&refresh=true&redirect=" + encodeForURL(ServletUtil.getBaseUrl(request) + mbHandler.getMediaURL("all", false)) + // Redirect action
                               "&ensureLuceneIndexing=true";
        %>
        <jalios:include jsp='<%= docChooserUrl %>' />
      </div>       
     </div>
     <% } %>
     
     <div class="mb-gallery row">
      <%
          Comparator<? super FileDocument> comparator = ComparatorManager.getComparator(FileDocument.class, mbPagerHandler.getSort(), mbPagerHandler.isReverse()); 
          SortedSet sortedResultSet   = new TreeSet<FileDocument>(comparator);
          sortedResultSet.addAll(mbHandler.getResultSet());
          
        if (sortedResultSet.isEmpty()) {
          %>
          <div class="well">
          <%= glp("ui.com.lbl.no-result") %>
          </div><%
        }
      %>
      <jalios:foreach name='itDoc' type='FileDocument' counter='mbCounter'
                      max='<%= mbPagerHandler.getPageSize() %>' skip='<%= mbPagerHandler.getStart() %>'
                      collection='<%= sortedResultSet %>'>
          <%
            boolean isFirstInPage = (mbCounter == 1);
            boolean isLastInPage = (mbPagerHandler.getStart()+mbCounter) == Math.min(sortedResultSet.size(), mbPagerHandler.getStart()+mbPagerHandler.getPageSize());
            String previewUrl = "work/doMediaBrowserPreview.jsp?fileDocID=" + itDoc.getId() + "&amp;selectMode=" + selectMode +
                                "&amp;itemIdx=" + mbCounter + "&amp;first=" + isFirstInPage + "&amp;last=" + isLastInPage ;
          %>
          <div class="mb-gallery-item mb-gallery-item-<%= mbCounter %> col-xs-6 col-sm-4 col-md-3 col-lg-2"
               data-jalios-mb-preview-url="<%= previewUrl %>">          
            
            <div class="thumbnail">
              
              <%-- Visible by default, hidden on hover --%>
              <div class="caption title">
                 <a href="<%= previewUrl %>" 
                    class="modal title" title="<%= encodeForHTMLAttribute(itDoc.getTitle(userLang), true) %>">
                    <%= encodeForHTML(Util.truncate(itDoc.getTitle(userLang), 25, "...")) %>
                 </a>
              </div>
              
              <%-- Visible on hover --%>
              <div class="caption">              
                                  
                 <div class="center-block">
                   <a href="<%= previewUrl %>" 
                      class="modal label label-info" title="<%= encodeForHTMLAttribute(itDoc.getTitle(userLang), true) %>">
                      <%= glp("ui.com.alt.preview") %>
                   </a>
                 </div>
                 
                 <% if (selectMode) { %>
                 <div class="center-block">
                     <a href="#" class="label label-success select-media" title="<%= glp("ui.work.mediabrowser.select") %>"
                        data-jalios-mb-doc-id="<%= itDoc.getId() %>"
                        data-jalios-mb-doc-title="<%= encodeForHTMLAttribute(itDoc.getTitle(targetLang), true) %>"
                        data-jalios-mb-doc-mediatype="<%= encodeForHTMLAttribute(itDoc.getMediaType()) %>"
                        data-jalios-mb-doc-filename="<%= encodeForHTMLAttribute(itDoc.getFilename()) %>"
                        <% if (itDoc.isImage()) { %>
                        data-jalios-mb-doc-width="<%= itDoc.getWidth() %>"
                        data-jalios-mb-doc-height="<%= itDoc.getHeight() %>"
                        <% } %>
                        onclick="return false;">
                       <%= glp("ui.work.mediabrowser.select") %>
                     </a>
                 </div>
                 <% } %>
              
              </div>
              
                <jalios:thumbnail fileDoc="<%= itDoc %>" format="jpeg" width="<%= 140 %>" height="<%= 120 %>"
                                  useAjaxLoading="<%= true %>" ajaxLoadingImage="<%= itDoc.getGenericThumbnail() %>">
                  <img src="<%= itDoc.getGenericThumbnail() %>" alt='' />
                </jalios:thumbnail>
            </div>
            
          </div>
              
        </jalios:foreach>
        
    </div><%-- mb-gallery --%>

    <div class="mb-pager mb-pager-down">
      <jalios:pager name='mbPagerHandler'/>
    </div>
    
<% if (previewedMedia != null) { %>
<jalios:javascript>
  JCMS.MediaBrowser.previewMedia("<%= previewedMedia.getId() %>");
</jalios:javascript>
<% } %>
   </div><%-- mb-main-container --%>    
  </div><%-- container-fluid --%>

 </div><%-- row --%>    
</div><%-- container-fluid --%>
   
</div><%-- media-browser --%>

<%@ include file='/jcore/doEmptyFooter.jspf' %>