<%@ page language="java" contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%  
%><%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %><%
%><%@ page import="com.jalios.jcms.upload.UploadManager" %><%
%><%@page import="com.jalios.jcms.handler.EditFileDocumentHandler"%><%
%><% 
    // If not logged or not allow to publish document
    if (!isLogged || !loggedMember.canPublishSome(FileDocument.class)) {
      sendForbidden(request, response);
      return;
    }
    
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.upload.DocUploadHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="modal" value="<%= true %>" /><%
%></jsp:useBean><%
formHandler.checkWorkspaceChange();

Class documentType = formHandler.getAvailableType();
String documentTypeShortName = documentType.getSimpleName();  

%><jalios:include jsp='<%= "/types/" + documentTypeShortName + "/do" + documentTypeShortName + "FormHandler.jsp" %>' />
<%

  EditFileDocumentHandler docFormHandler = (EditFileDocumentHandler)request.getAttribute(documentTypeShortName + ".formHandler");
  docFormHandler.validate();

  formHandler.setDocumentFormHandler(docFormHandler);
  formHandler.internalInit();

  // Validate 
  String errors = formHandler.handleUploadError(formHandler.handleUpload());
  
  // CSS & JS
  UploadManager.getInstance().addUploadComponentScripts(jcmsContext);
  
  // BrowserPlus
  // jcmsContext.addJavaScript("http://bp.yahooapis.com/2.4.21/browserplus-min.js");
  
  // Labels
  String submit       = glp("ui.com.btn.upload");

  String filter = getAlphaNumParameter("pluploadFilter", null);
  filter = Util.notEmpty(filter) ? "plupload-filter-"+filter : "";
  
  String resize = getAlphaNumParameter("pluploadResize", null);
  resize = Util.notEmpty(resize) ? "plupload-resize-"+resize : "";
  
  // Parameters
  FileDocument doc     = formHandler.getAvailableFileDocument();
  boolean isUpdate     = doc != null;
  boolean showUnzipOpt = com.jalios.jcms.upload.UnzipUploadManager.canUnzipToFileDocuments() && !isUpdate && !getBooleanParameter("hideUnzip", false) && formHandler.getAvailableOpenerForm() == null;
  
  boolean showForm     = true;
  if (doc != null && !doc.checkStrongLockMember(loggedMember)) {
    errors   = doc.getStrongLockInfo(userLocale);
    showForm = !loggedMember.canWorkOn(doc);
  }
  if (Util.notEmpty(errors)){ request.setAttribute(JcmsConstants.WARNING_MSG, errors);   }
%>

<%-- UPLOADING --%>
<% if (Util.isEmpty(errors) && formHandler.isUploading()) { %>
<jalios:modal css="modal-lg modal-upload" title="msg.js.process-in-progress">
  <jalios:javascript><%= formHandler.getNextUploadStep() %></jalios:javascript>
  <jalios:icon src='wait'/>
</jalios:modal>
<% return; } %>

<%-- HIDDEN --%>
<% if (!showForm) { %>
<jalios:modal css="modal-lg modal-upload" title="ui.com.lbl.plupload.title">&nbsp;</jalios:modal>
<% return; } %>

<jalios:modal css="modal-lg modal-upload toggle-wrapper" title="ui.com.lbl.plupload.title" picture="upload-big" url="work/docChooserModal.jsp" formHandler="<%= formHandler %>">
  
  <%-- PLUPLOAD  --%>
  <div id="plupload-modal" class='plupload plupload-light plupload-field-filename <%= encodeForHTMLAttribute(filter) %> <%= encodeForHTMLAttribute(resize) %>'>
    <p><%= glp("ui.com.lbl.plupload.error.init") %></p>
  </div>

  <div class="toggle-wrapper-state <%= formHandler.getAvailableShowOptions() ? "" : "hide" %>">
    <%-- TABS --%>
    <ul class="nav nav-tabs">
        <li class="tab active"><a href="#pcontent" onclick="return false;"><%= glp("ui.com.lbl.metadata") %></a></li>
      
     <% if (!formHandler.isCategoryTabHidden()) { %>
        <li class="tab"><a href="#pcat" onclick="return false;"><%= glp("ui.work.form.lbl.categories") %></a></li>
     <% } %>
     
     <% if (!formHandler.isReadRightTabHidden()) { %>
        <li class="tab"><a href="#prights" onclick="return false;"><%= glp("ui.work.form.lbl.read-rights") %></a></li>
     <% } %>
     
     <% if (!formHandler.isAdvancedTabHidden()) { %>
        <% if (!isUpdate || showUnzipOpt) { %><li class="tab"><a href="#padvanced" onclick="return false;"><%= glp("ui.work.form.tab.adv") %></a></li><% } %>
     <% } %>
    </ul>
    <div class="br"></div>
  
    <div class="tab-content">
  
      <%-- TAB - METADATA --%>
      <div class="tab-pane active" id="pcontent">
  
        <%-- Workspace  --%>
        <%
        ServletUtil.backupAttribute(pageContext, "TRIGGER_WS_CHANGE_REFRESH");
        request.setAttribute("TRIGGER_WS_CHANGE_REFRESH", true);
        %>
        <%@ include file='/jcore/doWorkspaceField.jspf' %>
        <%
        ServletUtil.restoreAttribute(pageContext, "TRIGGER_WS_CHANGE_REFRESH");
        %>
  
  
        <%-- Document Type Selector --%>
        <% Set typeSet = formHandler.getTypeSet(); %>
        <% if (Util.getSize(typeSet) == 1) { %>
        <input type="hidden" name="type" value="<%= formHandler.getAvailableType().getName() %>" />
        <% } else { %>
        <jalios:field  name='type' label="ui.com.lbl.type"  value='<%= documentType %>'>
          <select name="type" class="form-control" data-jalios-action="ajax-refresh">
            <jalios:foreach collection="<%= typeSet %>" name="itClass" type="Class">
            <option value="<%= itClass.getName() %>" <%= documentType == itClass ? "selected='selected'" : "" %>><%= channel.getTypeLabel(itClass, userLang) %></option>
            </jalios:foreach>
          </select>
        </jalios:field>
        <% } %>
  
        <jalios:field  name="title" label="ui.com.lbl.title" description="ui.work.doc.txt.title" ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getAllAvailableTitleML() %>' css="focus">
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
        
        
        <%-- Document Type Editor  --%>
        <% if (docFormHandler != null) {
             docFormHandler.validate(); 
             request.setAttribute("formHandler", docFormHandler);
        %><jalios:include jsp='<%= "types/" + documentTypeShortName + "/doEdit" + documentTypeShortName + ".jsp" %>' />
        <% } %>
        <jalios:include target="DOCCHOOSER_MODAL_CONTENTTAB" targetContext="div" />
        
        <div class="largeFileInfo"><%= glp("ui.com.lbl.plupload.description",ServletUtil.getQueryString(request,false)) %></div>
        
        
      </div>
          
      <% if (!formHandler.isCategoryTabHidden()) {%>
      <div class="tab-pane categories" id="pcat">
        <%@ include file='/work/doEditPubCat.jspf' %>
        <jalios:include target="DOCCHOOSER_MODAL_CATEGORIESTAB" targetContext="div" />
      </div>
  
      <% } %>
            
      <% if (!formHandler.isReadRightTabHidden()) { %>
        <div class="tab-pane read-rights" id="prights">
          <jalios:field  name='authorizedGroupIds' label='<%= glp("ui.work.form.lbl.grp-read-rights") %>' value='<%= formHandler.getAvailableAuthorizedGroupSet() %>' keyword='true'>
            <jalios:control type="<%= ControlType.GROUP %>" />
          </jalios:field>
  
          <jalios:field name='authorizedMemberIds' label='<%= glp("ui.work.form.lbl.mbr-read-rights") %>' value='<%= formHandler.getAvailableAuthorizedMemberSet() %>' keyword='true'>
            <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
          </jalios:field>
  
          <jalios:include target="DOCCHOOSER_MODAL_READRIGHTTAB" targetContext="div" />
        </div>
      <% } %>
  
      <% if (!formHandler.isAdvancedTabHidden()) { %>
        <% if (!isUpdate || showUnzipOpt) { %>
          <div class="tab-pane advanced" id="padvanced" style="padding-left: 20px">
            
            <% if (!isUpdate) { %>
              <% String isTrackedStr = Util.getString(ReaderTrackerManager.getInstance().isTypeReaderTracked(formHandler.getPublicationClass()),"false"); %>
                <jalios:field  name='<%= "tracked" %>' label='<%= glp("ui.work.form.lbl.track") %>' value='<%= ""+formHandler.getAvailableTracked() %>'>
                  <jalios:control type="<%= ControlType.BOOLEAN %>" />
                </jalios:field>
            <% } %>
            
            <% if (showUnzipOpt) { %>
              <jalios:field  name='<%= "unzipUploadedFiles" %>' label='<%= glp("ui.work.form.lbl.unzip") %>' description='<%= "ui.work.form.lbl.unzip.h" %>' value='<%= String.valueOf(formHandler.getUnzipUploadedFiles()) %>'>
                  <jalios:control type="<%= ControlType.BOOLEAN %>" />
                </jalios:field>
            <% } %>
  
            <% if (isUpdate && (!channel.isJSyncEnabled() || !channel.getJSyncReplica().getSyncFiles())) { %>
            <jalios:field  name='<%= "removeFile" %>' label='<%=  glp("ui.work.doc.lbl.remove-file") %>' value='<%= ""+formHandler.getAvailableRemoveFile() %>'>
                  <jalios:control type="<%= ControlType.BOOLEAN %>" />
                </jalios:field>
            <% } %>
  
            <% if (isUpdate && doc.isStrongLocked()) { %>
              <jalios:field  name='<%= "unlock" %>' label='<%= glp("ui.work.doc.lbl.unlock") %>' value='<%= "true" %>'>
                <jalios:control type="<%= ControlType.BOOLEAN %>" />
              </jalios:field>
            <% } %>
  
            <jalios:include target="DOCCHOOSER_MODAL_ADVTAB" targetContext="div" />
          </div>
        <% } %>
        <jalios:include target="DOCCHOOSER_MODAL" targetContext="div" />
      </div>
      <% } %>
    </div>  
    <input type='hidden' name='pluploadFilter'  value='<%= encodeForHTMLAttribute(getAlphaNumParameter("pluploadFilter","")) %>'  />
    <input type='hidden' name='pluploadResize'  value='<%= encodeForHTMLAttribute(getAlphaNumParameter("pluploadResize","")) %>'  />
      
    <input type='hidden' name='pstatus'  value='<%= formHandler.getAvailablePstatus() %>'  />
    <input type='hidden' name='originalType' value='<%= encodeForHTMLAttribute(formHandler.getAvailableOriginalType().getName()) %>' />
    <input type='hidden' name='nbElt'    value='<%= formHandler.getAvailableNbElt() %>' />
    <input type='hidden' name='jsFunc'   value='<%= encodeForHTMLAttribute(formHandler.getAvailableJsFunc()) %>' />
    <input type='hidden' name='id'       value='x' />
    
    <%-- Used by MediaBrowser  --%> 
    <input type='hidden' name='ensureLuceneIndexing' value='<%= getBooleanParameter("ensureLuceneIndexing",false) %>' />

    <% if (formHandler.getRedirect() != null) { %>
      <input type='hidden' name='redirect' value='<%= encodeForHTMLAttribute(formHandler.getRedirect()) %>' />
    <% } %>
    
    <%-- Used by docChooser --%>
    <% if (formHandler.getAvailableOpenerForm() != null) { %>
      <input type='hidden' name='openerForm' value='<%= encodeForHTMLAttribute(formHandler.getAvailableOpenerForm()) %>' />
    <% } %>
    
    <%-- Used by docChooser --%>
    <% if (formHandler.getAvailableOpenerRefresh() != null) { %>
      <input type='hidden' name='refresh' value='<%= encodeForHTMLAttribute(formHandler.getAvailableOpenerRefresh()) %>' />
    <% } %>
      
    <jalios:buffer name="MODAL_BUTTONS">
      <%@ include file='/jcore/modal/doModalLang.jspf' %>
      <input type='hidden' name="showOptions" value="true" />
      <% if (isUpdate) { %>
        <input type='hidden' name='id' value='<%= doc.getId() %>' />
        <input type='checkbox' name='majorUpdate' class='majorUpdate' value='true' <%= formHandler.getAvailableMajorUpdate() ? "checked='checked'" : "" %> onclick='var checked = this.checked; $$("INPUT.majorUpdate").each(function(input) {input.checked = checked;});'/><span class='formInfo'><%= glp("ui.work.form.lbl.major-update") %></span>
      <% } %>
      <button class="btn btn-default" type="button" name="opCancel"  data-dismiss="modal" ><%= glp("ui.com.btn.cancel") %></button>
      <button class="btn btn-default" data-jalios-action="toggle:hide" data-jalios-target=".toggle-wrapper .toggle-wrapper-state">
        <span class="toggle-wrapper-state <%= formHandler.getAvailableShowOptions() ? "hide" : "" %>"><%= glp("ui.work.doc.upload.lbl.show-options") %></span>
        <span class="toggle-wrapper-state <%= formHandler.getAvailableShowOptions() ? "" : "hide" %>"><%= glp("ui.work.doc.upload.lbl.hide-options") %></span>
      </button>
      <% if (formHandler.isUploadEnabled()){ %>
      <button class="btn btn-primary ajax-refresh plupload-submit" type="submit"  name="opUpload"  value="true"><%= submit %></button>
      <% } %>
    </jalios:buffer>

  <jalios:javascript>
    
    !function($){

        $("BUTTON.plupload-submit").on('click', function(event){ 
          if (window.unzipConfirmed) {
            return;
          }
          // Checkbox unzip is not checked
          if ( $('#jalios-modal INPUT[name=unzipUploadedFiles]:checked').val() == 'false'){ return; }
          
          // Has any zip
          var hasZip = false;
          var files = $('#plupload-modal').data('plupload').files;
          for (var i = 0 ; (files && i < files.length); i++){
          if (files[i].name && files[i].name.indexOf('.zip') > 0){ hasZip = true; break; }
        }
          if (!hasZip){ return; }
          
          // Confirm unzip
          var doUnzip = top.confirm('<%= glp("msg.js.confirm-unzip") %>');
        if (doUnzip){
          window.unzipConfirmed = true 
          return;
        }
          
          event.preventDefault();
          event.stopPropagation();
        });
        
    }(jQuery)

    </jalios:javascript>
</jalios:modal>