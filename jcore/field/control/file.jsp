<%@page import="com.jalios.jcms.JcmsUtil"%><%
%><%@ page import="com.jalios.jcms.upload.UploadManager" %><%
%><%@page import="com.jalios.jcms.taglib.settings.BasicSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.ControlSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.FileSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.FileSettings.FileFilter"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.FileSettings.Mode"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
String prepend = getIncludeString("PREPEND", getOption(BasicSettings.PREPEND, ""));
String append  = getIncludeString("APPEND", getOption(BasicSettings.APPEND, ""));
String required = fieldRequired.booleanValue() ? "aria-required='true'" : "";
String disabled = Util.toBoolean(fieldDisabled, false) ? "disabled='disabled'" : "";
String htmlAttributes = getOption(BasicSettings.HTML_ATTRIBUTES, "");
String dataAttributes = formatDataAttributes(getOption(BasicSettings.DATA_ATTRIBUTES, (Map<String, Object>) null));

boolean single = getOption(FileSettings.SINGLE_FILE, false);
String singleFile = single ? " plupload-single" : "";

String[] selectedFileLabels = getOption(FileSettings.SELECTED_FILE_LABEL, null);

int maxWidth = getOption(FileSettings.MAX_IMAGE_WIDTH, -1);
int maxHeight = getOption(FileSettings.MAX_IMAGE_HEIGHT, -1);
String resize = maxWidth > 0 && maxHeight > 0 ? " plupload-resize-" + maxWidth + "x" + maxHeight + "x90" : "";

Mode mode = getOption(FileSettings.MODE, Mode.PLUPLOAD);

String token = getOption(FileSettings.AJAX_TOKEN, null);
String ajaxToken = token != null ? " plupload-token-" + token : "";

FileFilter filter = getOption(FileSettings.FILTER, null);
String fileFilter = filter != null ? " plupload-filter-" + filter.getFilterString() : "";

String css = getOption(BasicSettings.CSS, "");
css = Util.notEmpty(css) ? " " + css : "";
if(Mode.SIMPLE_FILE.equals(mode)) {
  css = "form-control" + css;
} else {
  css = "plupload plupload-light" + (" plupload-field-" + fieldName) + singleFile + resize + ajaxToken + fileFilter + css;
}

// Add scripts for plupload
UploadManager.getInstance().addUploadComponentScripts(jcmsContext);
%>

<% if (Util.notEmpty(prepend)) { %><span class="input-group-addon"><%= prepend %></span><% } %>

<% if (Util.notEmpty(fieldValues) && Util.notEmpty(selectedFileLabels)) { %>
<div class="input-group jalios-input-group">
  <ul class="selected-file-labels list-group">
  <% for(int i = 0; i < fieldValues.size(); i++) { %>
    <% String value = fieldValues.get(i); %>
    <% String selectedFileLabel = selectedFileLabels != null ? selectedFileLabels[i] : value; %>
    <li class="list-group-item"><span class="selected-file-label"><%= selectedFileLabel %></span></li>
    <input type="text" name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>" value="<%= encodeForHTMLAttribute(value) %>" class="form-control hide" />
  <% } %>
  </ul>
</div>
<% } %><%
%><% if(Mode.SIMPLE_FILE.equals(mode)) { %>
<input id="<%= encodeForHTMLAttribute(fieldId) %>"
      name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>"
      type="file"
      class="<%= css %>"
      value="<%= encodeForHTMLAttribute(resolveValue(fieldValue)) %>"
      <%= JcmsUtil.getLangAttributes(cptLang) %>
      <%= disabled %>
      <%= required %>
      <%= dataAttributes %>
      <%= htmlAttributes %> />
<% } else { %>
<div id="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>"
     class="<%= css %>"
     <%= disabled %>
     <%= required %>
     <%= dataAttributes %>
     <%= htmlAttributes %>>
  <p><%= glp("ui.com.lbl.plupload.error.init") %></p>
</div>
<% } %>

<% if (Util.notEmpty(append)) { %><span class="input-group-addon"><%= append %></span><% } %>
