<%@page import="com.jalios.jcms.upload.UploadManager"%><%
%><%@ include file="/jcore/field/control/doInitControl.jspf" %><%
%><%
String superType = getOption(PublicationSettings.SUPER_TYPE_CLASS, null);
if(superType != null) {
  Class<?> superTypeClass = channel.getClass(superType);
  // Add 'upload' chooser button when the publication type is assignable from FileDocument
  if(superTypeClass != null && FileDocument.class.isAssignableFrom(superTypeClass)) {
    String extraDataOptions = formatAttribute(" data-jalios-options='type=" + superType + "&%s'", getOption(AbstractChooserSettings.CHOOSER_OPTION, ""));
  %><%--
    <jalios:buffer name="extraChooserButton">
      <button type="button" class="btn btn-default btn-chooser" data-jalios-action="chooser:document"<%= extraDataOptions %>>
        <jalios:icon src="upload" />
      </button>
    </jalios:buffer>
    <% includeLocalObject("APPEND_BTN_ACTION", extraChooserButton); %>
    --%>
    <%
    boolean hideFileInput = Util.notEmpty(resolveValue(fieldValue));   

    String customCss = getOption(BasicSettings.CSS, "");
    if(!hideFileInput) { // Hide chooser input
      addOption(BasicSettings.CSS, "hide" + (Util.notEmpty(customCss) ? " " + customCss : ""));
      includeLocalObject("INPUT_DISABLED", true);
      // fieldDisabled = true;
    }
    %>
    <jalios:buffer name="extraControlInput">
      <%
      String extraRequired = Util.toBoolean(fieldRequired, false) ? "aria-required='true'" : "";
      String extraDisabled = Util.toBoolean(fieldDisabled, false) || hideFileInput ? "disabled='disabled'" : "";
      String extraCss = "form-control" + (" jalios-" + controlType.toString().toLowerCase() + "-filebrowser") + (Util.notEmpty(customCss) ? " " + customCss : "") + (hideFileInput ? " hide" : "");
      %>
      <% if(Util.toBoolean(request.getAttribute(JcmsConstants.AJAX_MODE_ATTR), false)) { // Ajax Mode (use plupload)
        extraCss += " plupload plupload-light" + (" plupload-field-" + fieldName) + " plupload-single";
        // Add scripts for plupload
        UploadManager.getInstance().addUploadComponentScripts(jcmsContext); %>
        <div id="<%= ServletUtil.generateUniqueDOMId(request, "plupload-" + encodeForHTMLAttribute(fieldName)) %>" class="<%= extraCss %>" <%= extraDisabled %> <%= extraRequired %>>
          <p><%= glp("ui.com.lbl.plupload.error.init") %></p>
        </div>
      <% } else { // NOT Ajax Mode (classic file input) %>
        <input type="file" name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>" class="<%= extraCss %>" <%= extraDisabled %> <%= extraRequired %> />
      <% } %>
      <% if((cptField + 1) >= cptMax) { // Add input hidden to prevent problem when we remove files %>
      <input type="hidden" name="<%= HttpUtil.encodeForHTMLAttribute(fieldName) %>" value="" />
      <% } %>
    </jalios:buffer>
    <% includeLocalObject("CONTROL_APPEND", extraControlInput); %><%
  }
}
%><%@ include file="/jcore/field/control/doData.jspf" %>