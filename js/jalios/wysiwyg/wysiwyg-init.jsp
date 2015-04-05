<%--

  @Summary: this JSP prints the javascript code used to initialize TinyMCE
              
--%><%@ page contentType="text/javascript; charset=UTF-8"%><%
  request.setAttribute("ContentType", "text/javascript; charset=UTF-8"); 
%><%@ include file="/jcore/doInitPage.jspf" %><%
  // because this file depends on variable of the current request (workspace, language etc)
  // ask the client to never cache it.
 response.addHeader("Pragma", "no-cache");
 
%>
!function ($) {

  var jcmsTinyMCE = function(){
    // Ensure wysiwyg and wikiwyg can be initialized correctly during ajax refresh request
    // by waiting until TinyMCE javascript is fully loaded before calling it
    if (typeof(tinyMCE) === 'undefined' || typeof(tinymce) === 'undefined') {
      window.setTimeout(jcmsTinyMCE, 50);
      return;
    }

    var t0 = new Date().getTime();
  
    // Add TinyMCE compatibility with Ajax-Refresh and modal by forcing the DOMloaded status
    // We can do that quite safely as the TinyMCE Javascript are inserted in the HTML's end,
    // thus DOM is available for most part
    tinymce.dom.Event.domLoaded = true;

<%
  // Default RICHTEXT configuration (formRichText)
  {
    String configurationPrefix = "wysiwyg.tinymce."; 
    %><%@ include file="/js/jalios/wysiwyg/doWysiwyg-init.jspf" %><%
  }

  // Default Wikiwyg configuration (formWikiwyg)
  {
    String configurationPrefix = "wikiwyg.tinymce."; 
    %><%@ include file="/js/jalios/wysiwyg/doWysiwyg-init.jspf" %><%
  }

  // Alternate configurations if any
  Map<String,Object> otherConfigurationMap = channel.getSubProperties("wysiwyg.tinymce.conf.");
  for (String key : otherConfigurationMap.keySet()) {
     String configurationPrefix = "wysiwyg.tinymce.conf." + key +"."; 
    %><%@ include file="/js/jalios/wysiwyg/doWysiwyg-init.jspf" %><%
  }

%>
  
    var t1 = new Date().getTime();
  
    JcmsLogger.info('Wysiwyg', 'Init Wysiwyg JCMS', ' in '+(t1-t0)+' ms');
    
  }
  
  var refresh = function(event) {
    // Handle an Ajax-Refresh Before
    // Required when saving Wysiwyg editor through ajax refresh (fix bug JCMS-2792 and JCMS-4227)
    var refreshBefore = jQuery.jalios.Event.match(event, 'refresh', 'before');
    var refreshSerialize = jQuery.jalios.Event.match(event, 'refresh', 'serialize'); 
    if (refreshBefore || refreshSerialize) { 
      if (window['tinyMCE'] != undefined) {
        tinyMCE.triggerSave();
      }
    }

    // Handle an Ajax-Refresh After
    // InitCase #3 : when an ajax request is performed, but this file was *already loaded* before
    var refreshAfter = jQuery.jalios.Event.match(event, 'refresh', 'after');
    if (refreshAfter) {
      jcmsTinyMCE.defer();
    }

    // Handle a tinymce refresh
    var refreshTinyMCE = jQuery.jalios.Event.match(event, 'tinymce', 'refresh');
    if (refreshTinyMCE) {
      jcmsTinyMCE.defer();
    }
    
  }
  
  var registered = false; // jalios:ready catched ?
  var register = function() {
  
    if (registered) {
      return;
    }
    registered = true;
  
    JcmsLogger.info('Wysiwyg', 'Register Wysiwyg Init script...'); 
  
    // InitCase #1 : jalios:ready for first time initialization on page load
    // InitCase #2 : jalios:ready when this file is *loaded* through Ajax (eg : modal)
    jcmsTinyMCE.defer();
    
    // Register both InitCase #3 and proper save (see above) 
    jQuery(document).on('jalios:refresh', refresh);
    jQuery(document).on('jalios:tinymce', refresh);
  }
  
  // Plugin initialization on DOM ready
  $(document).ready(function($) {
    register();
  });
  
}(window.jQuery);