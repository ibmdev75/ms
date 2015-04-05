<%--
  @Summary: JSP used in a popup window to provide wysiwyg edition of the content
            of the textarea referenced by 'targetInputId' field.
            Parameter 'targetInputId' is required 
            - 'targetInputId' is the DOM element ID of the opener in which to retrieve the content to edit//update
            - 'wysiwygParams' is parameter is optionnal (default is to use "all")
            - 'lang' parameter is optionnal (default is to use the main site language)

--%><%@ page contentType="text/html; charset=UTF-8"%><%

  String targetInputId = getChooserParameter("targetInputId");
  if (Util.isEmpty(targetInputId)) {
    throw new IllegalArgumentException("Parameter 'targetInputId' is required");
  }
  String wysiwygParams = getStringParameter("wysiwygParams", "all", "^[a-zA-Z0-9,]*$");

%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/doEmptyHeader.jspf' %>
<jalios:javascript>

'JCMS.wysiwyg.PopupEditJsp'._namespace({

 _getContentFromTargetInput : function() {
   try {
     document.editForm.content.value = window.opener.$('<%= targetInputId %>').value;
     var update = function() {
       tinyMCE.activeEditor.setContent(document.editForm.content.value);
     }
     update.defer();
     
   } catch(ex) {
     alert('Error : Could not retrieve content to edit.\n\n' + 'targetInputId : <%= targetInputId %>\n'+ 'Exception : ' + ex);
   }
 },

 _putContentInTargetInput : function() {
   tinyMCE.triggerSave();
   window.opener.$('<%= targetInputId %>').value = document.editForm.content.value;
   var $previewIframe = window.opener.jQuery('#<%= targetInputId %>_preview_iframe');
   if ($previewIframe.exists()) {
     $previewIframe.attr('src', $previewIframe.attr('data-src'));
   }
 },
 
 _resizeEditorToViewport : function() {
   if (typeof tinyMCE == undefined || !tinyMCE.activeEditor) {
     JCMS.wysiwyg.PopupEditJsp._resizeEditorToViewport.defer();
   }

   $('.mceLayout').css('width', '100%');
 },
 
 _registerOnUnload : function() {
   window.onbeforeunload = function unloadMess() {
     return I18N.glp('wysiwyg.popupedit.warn.contentlost');
   }
 },
 
 _unregisterOnUnload : function() {
   window.onbeforeunload = null;
 },
 
 _close: function() {
   JCMS.wysiwyg.PopupEditJsp._unregisterOnUnload();
   window.close();
 },
 
 cancel: function() {
   JCMS.wysiwyg.PopupEditJsp._close();
 },
 
 validate: function(close) {
   try {
     JCMS.wysiwyg.PopupEditJsp._putContentInTargetInput();
   } catch(ex) {
     alert('Error : Could not update content.\n\n' + 'Exception : ' + ex);
     return;
   }
   if (close) {
     JCMS.wysiwyg.PopupEditJsp._close();
   }
 }
});

JCMS.wysiwyg.PopupEditJsp._getContentFromTargetInput.defer();
// JCMS.wysiwyg.PopupEditJsp._resizeEditorToViewport.defer();
// Event.observe(window, 'resize', JCMS.wysiwyg.PopupEditJsp._resizeEditorToViewport);

!function($) {
  
  var setup = function(event) {
    var wysiwyg = $.jalios.Event.match(event,'wysiwyg','ready');
    if (wysiwyg) {
      $('.mceLayout').css('width', '100%');      
    }
  }
  
  // Plugin initialization on DOM ready
  $(document).on('jalios:wysiwyg', setup);

}(window.jQuery);

</jalios:javascript>

<form name="editForm" style="overflow:hidden;">
 <div class="container-fluid">
  <div>
     <button class="btn btn-primary" onclick='JCMS.wysiwyg.PopupEditJsp.validate(true); return false;'><%= glp("ui.com.btn.validate-close") %></button>
     <button class="btn btn-default" onclick='JCMS.wysiwyg.PopupEditJsp.cancel(); return false;'><%= glp("ui.com.btn.cancel") %></button>
  </div>  
  <div class="row">
   <%
     String editLang = getAlphaNumParameter("lang", null);
     if (Util.isEmpty(editLang) || !channel.getLanguageList().contains(editLang)) {
       editLang = channel.getLanguage();
     }
     List languageList = new ArrayList();
     languageList.add(editLang);
   %>
    <jalios:field name="content" ml="false" resource="field-inline">
      <jalios:control settings='<%= new RichTextAreaSettings().rows(20).parameters(RichTextAreaSettings.ParameterValue.toParameterValues(wysiwygParams)) %>' />
    </jalios:field>
  </div>  
 </div>
</form>

<%@ include file='/jcore/doEmptyFooter.jspf' %>
