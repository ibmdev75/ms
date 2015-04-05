<%--
  @Summary: JSP used in a iframe window to provide wysiwyg preview of the content
            of the textarea referenced by 'targetInputId' field.
            Parameter 'targetInputId' is *required*.
            - targetInputId is the DOM element ID of the opener in which to retrieve the content to edit//update
            The wysiwygParams parameter is optionnal (default is to use "all")

--%><%@ page contentType="text/html; charset=UTF-8"%><%

  String targetInputId = getChooserParameter("targetInputId");
  if (Util.isEmpty(targetInputId)) {
    throw new IllegalArgumentException("Parameter 'targetInputId' is required");
  }
  
%><%@ include file='/jcore/doInitPage.jspf' %><%

  jcmsContext.addBodyAttributes("style", "background-color: #FFFFFF;");
  request.setAttribute("RegiserAjaxContext","false");
%><%@ include file='/jcore/doEmptyHeader.jspf' %><%
%>
<div id="wysiwyPreview"></div>
<textarea id="wysiwyPreviewTextarea" style="display: none;"></textarea>
<jalios:javascript>
!function ($) {

  var updateContent = function(html) {
    var textarea = $('#wysiwyPreviewTextarea');
    var previewDiv = $('#wysiwyPreview'); 
    // refresh only when the content has changed
    if (html == textarea.value) {
      return;
    }
    textarea.val(html);
    previewDiv.html(html);
  }

  updateContent(parent.jQuery('#<%= targetInputId %>').val());
 
}(window.jQuery);

</jalios:javascript>
<%
%><%@ include file='/jcore/doEmptyFooter.jspf' %>
