<%@page import="com.jalios.jcms.taglib.settings.impl.RichTextAreaSettings"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%

String wysiwygParams = getOption(RichTextAreaSettings.PARAMETERS, RichTextAreaSettings.PARAMS_PREFIX + RichTextAreaSettings.DEFAULT_PARAMS_INIT);

// For richtext, using disabled=true means popup edition
if (getOption(RichTextAreaSettings.POPUP_EDITION, false) || Util.toBoolean(fieldDisabled, false) || getBooleanParameter("wysiwygDisabled", false)) {
  addOption(BasicSettings.CSS, "hide source " + getOption(BasicSettings.CSS,""));
  %>
  <div class="btn-group">
      
      <a href="work/wysiwygPopupEdit.jsp?targetInputId=<%= encodeForURL(fieldId) %>&amp;<%= wysiwygParams %>&amp;lang=<%= cptLang %>"
         target="_blank" class="btn btn-primary btn-xs">
         <%= glp("js.wysiwyg.popupedit.ui.edit-link") %> 
         <jalios:icon src="images/jalios/icons/external.gif" />
      </a>
      
      <a href="#" class="btn btn-default btn-xs" id="<%= fieldId %>_preview_link"
         onclick="jQuery('#<%= fieldId %>_preview_iframe').attr('src', jQuery('#<%= fieldId %>_preview_iframe').attr('data-src')); return false;" 
         data-jalios-action="add:hide remove:hide" 
         data-jalios-target="#<%= fieldId %>|#<%= fieldId %>_preview_iframe">
         <%= glp("js.wysiwyg.popupedit.ui.preview-link") %>
      </a>
      
      <a href="#" class="btn btn-default btn-xs" id="<%= fieldId %>_source_link" 
         data-jalios-action="remove:hide add:hide" 
         data-jalios-target="#<%= fieldId %>|#<%= fieldId %>_preview_iframe">
         <%= glp("js.wysiwyg.popupedit.ui.source-link") %>
      </a>
      
  </div>
  <iframe id="<%= fieldId %>_preview_iframe" class="form-control hide"
          style="width: 100%; height: 250px; border: 1px solid gray;"
          src="" data-src="work/wysiwygPreview.jsp?targetInputId=<%= encodeForURL(fieldId) %>">
  </iframe>
  <%@ include file="/jcore/field/control/doTextArea.jspf" %><%
  return;
}

int nbRows = getOption(RichTextAreaSettings.ROWS, 0);
if (nbRows > 0) {
  nbRows += (wysiwygParams.indexOf("basic") != -1) ? 1 : 0;
  nbRows += (wysiwygParams.indexOf("format") != -1) ? 1 : 0;
  nbRows += (wysiwygParams.indexOf("font") != -1) ? 1 : 0;
  nbRows += (wysiwygParams.indexOf("table") != -1) ? 1 : 0;
  nbRows += (wysiwygParams.indexOf("style") != -1) ? 1 : 0;
}

final String wsCssOption = ((workspace != null) ? ("WSID_" + workspace.getId() + " ") : "");

addOption(BasicSettings.CSS, "formRichText " + wsCssOption + getOption(BasicSettings.CSS, ""));
addOption(RichTextAreaSettings.ROWS, nbRows);
addOption("title", wysiwygParams);

// Add required JavaScript 
WidgetUtil.addWysiwygJavaScripts(jcmsContext);

// And make sure to register the spellchecker RPC
if (json_bridge != null) {
  try {
    json_bridge.registerClass("TinyMceSpellChecker", com.jalios.jcms.widget.WidgetUtil.TinyMceSpellChecker.class);
  } catch (Exception ex) {
  }
}

%><%
%><%@ include file="/jcore/field/control/doTextArea.jspf" %>
