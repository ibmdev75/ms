<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %><%
%><%@page import="com.jalios.jcms.handler.EditFileDocumentHandler"%><%

  if (loggedMember == null) {
    sendForbidden(request, response);
    return;
  }

  jcmsContext.addCSSHeader("css/jalios/docChooser.css");

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.upload.DocUploadHandler'><%
  %><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
  %><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

Class documentType = formHandler.getAvailableType();
String documentTypeShortName = documentType.getSimpleName();  

%><jalios:include jsp='<%= "/types/" + documentTypeShortName + "/do" + documentTypeShortName + "FormHandler.jsp" %>' /><%
%><%


  EditFileDocumentHandler docFormHandler = (EditFileDocumentHandler)request.getAttribute(documentTypeShortName + ".formHandler");
  docFormHandler.validate();

  formHandler.setDocumentFormHandler(docFormHandler);
  Class clazz  = formHandler.getPublicationClass();
  formHandler.internalInit();
  FileDocument doc = formHandler.getAvailableFileDocument();

  // UPDATE
  if (formHandler.isUpdate()) {
    if (!loggedMember.canWorkOn(doc)) {
      sendForbidden(request, response);
      return;
    }
  } 
  // CREATE
  else {
    if (!loggedMember.canPublish(clazz, formHandler.getAvailableWorkspace())) {
      if (clazz == FileDocument.class && loggedMember.canPublishSome(DBFileDocument.class, formHandler.getAvailableWorkspace())){
        formHandler.setType("DBFileDocument");
        
      } else {
        sendForbidden(request, response);
        return;
      }
    }
  }
%>
<%-- *** PLUGINS ********************** --%>
<jalios:include target="DOCCHOOSER_HEADER" />
<% 
	String    errors = formHandler.handleUploadError(formHandler.handleUpload());
	int       nbElt  = formHandler.getAvailableNbElt();
  boolean   isUpdate = doc != null;
  String    btnText = isUpdate ? glp("ui.com.btn.upload-update") : glp("ui.com.btn.upload");
	boolean   showUnzipOpt = com.jalios.jcms.upload.UnzipUploadManager.canUnzipToFileDocuments() && !isUpdate &&
                           !getBooleanParameter("hideUnzip", false) &&
                           formHandler.getAvailableOpenerForm() == null;
  
  boolean showForm     = !formHandler.isUploading() || Util.notEmpty(errors);
  if (doc != null && !doc.checkStrongLockMember(loggedMember)) {
    errors   = doc.getStrongLockInfo(userLocale);
    showForm = !loggedMember.canWorkOn(doc);
  }
  
  // It's possible to add custom messages if you use DOCCHOOSER_HEADER
  List<String> customMessages = (List<String>) request.getAttribute("docChooser.messages");
  if(Util.notEmpty(customMessages)) {
    StringBuilder sb = new StringBuilder();
    sb.append("<ul>");
    for(String customMessage : customMessages) {
      sb.append("<li>").append(customMessage).append("</li>");
    }
    sb.append("</ul>");
    errors = sb.toString();
  }
  
  if (isUpdate && doc.getPdfUploadDate() != null) {
    setInfoMsg(glp("filedocument.pdfupload.reupload.warning"), request);
  }
  
%><%@ include file='/jcore/doEmptyHeader.jspf' %>

<%boolean isActionPerformed = false;%> 
<%-- Handle Errors ******************************************************* --%>
<% if (Util.notEmpty(errors)){ %>
<jalios:message level="<%= MessageLevel.WARN %>" dismissable="true">
  <div><%= errors %></div>
</jalios:message>

<%-- Handle Upload ******************************************************* --%>
<% } else if (formHandler.isUploading()){ 
	isActionPerformed = true;%>
<jalios:javascript><%= formHandler.getNextUploadStep() %></jalios:javascript>
<% } %>

<%-- Upload Form ********************************************************* --%>
<% if (showForm) { %>
<form lang="<%= formHandler.getAvailableMainLanguage() %>" action="<%= contextPath %>/work/docChooser.jsp"  method="post" name="editForm" id="editForm" accept-charset="UTF-8"  enctype="multipart/form-data"  style="margin: 0.5em;" class="form-horizontal noSingleSubmitButton lang-trigger toggle-wrapper">

  <%-- NAVBAR --%>
  <div class="navbar navbar-default">
    <div class="container-fluid">
      <% if(formHandler.isUploadEnabled()) { %>
        <input class='btn btn-primary navbar-btn' name='opUpload' value='<%= btnText %>' type='submit' id='opUpload' onclick='return confirmSubmitUpload();' />
      <%} %>
      <button class="btn btn-default navbar-btn" data-jalios-action="toggle:hide" data-jalios-target=".toggle-wrapper .toggle-wrapper-state">
          <span class="toggle-wrapper-state"><%= glp("ui.work.doc.upload.lbl.show-options") %></span>
          <span class="toggle-wrapper-state hide"><%= glp("ui.work.doc.upload.lbl.hide-options") %></span>
      </button>
    </div>
  </div>
  
  <script type="text/javascript">
    function confirmSubmitUpload() {
      /*
      <% if (showUnzipOpt) { %>
      var isZip = false;
      $('editForm').select('INPUT[name="filename"]').each(function(fn){
        var fnv = fn.value; 
        if (fnv.endsWith('zip') || fnv.endsWith('war')){ isZip = true;  }
      });
      var unzipRequested = Util.toBoolean($('editForm').getInputs('radio','unzipUploadedFiles').find(function(radio) { return radio.checked; }).value);
      if (isZip && unzipRequested) {
        return top.confirm('<%= glp("msg.js.confirm-unzip") %>');
      }
      <% } %>
      */
      return true;
    }
  </script>

  <%-- Upload Infos ********************************************************* --%>
  <div class="doc-chooser-upload alert alert-info hide">
    <jalios:include jsp="work/docChooserUpload.jsp" />
  </div>
  <%-- Ajax Iframe ********************************************************* --%>
  <iframe src="work/docChooserIFrame.jsp" name="docIFrame" width="100%" height="10" class="hide"></iframe>

  <%-- Files ------------------------------------------------------------ --%>
  <div class="files">
    <% for(int i=0; i < nbElt; i++) { %>
    <jalios:field name="filename" resource="field-light">
      <jalios:control settings='<%= new FileSettings().mode(FileSettings.Mode.SIMPLE_FILE) %>' />
    </jalios:field>
    <% } %>
  </div>
  
  <div class="metadata toggle-wrapper-state hide">
    <div class="tab-pane" id="content-tab-pane-1">
    
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='edit' alt='P' title='<%= glp("ui.work.form.tab.content") %>' />&nbsp;<%= glp("ui.work.form.tab.content") %></h2>  
     
        <%-- Document Type Selector ------------------------------------------------------------ --%>
        <% Set typeSet = formHandler.getTypeSet(); %>
        <% if (isUpdate || Util.getSize(typeSet) == 1) { %>
        <input type="hidden" name="type" value="<%= formHandler.getAvailableType().getName() %>" />
        <% } else { %>
        <jalios:field label="ui.com.lbl.type" name="type">
          <select id="documentTypeSelector" name="type"  onchange="document.editForm.submit();" class="form-control">
            <jalios:foreach collection="<%= typeSet %>" name="itClass" type="Class">
            <option value="<%= itClass.getName() %>" <%= documentType == itClass ? "selected='selected'" : "" %>><%= channel.getTypeLabel(itClass, userLang) %></option>
            </jalios:foreach>
          </select>  
        </jalios:field>
        <% } %>
      
        <%-- MAJOR VERSION -------------------------------------------- --%> 
         <% if (isUpdate) { %>
        <jalios:field name="majorUpdate" label="ui.work.form.lbl.major-update" value='<%= ""+formHandler.getAvailableMajorUpdate() %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <% } %>
        
      
        <%-- REMOVE PREVIOUS FILE -------------------------------------------- --%> 
        <% if (nbElt == 1 && formHandler.isUpdate() && (!channel.isJSyncEnabled() || !channel.getJSyncReplica().getSyncFiles())) { %>
        <jalios:field name="removeFile" label="ui.work.doc.lbl.remove-file" value='<%= ""+formHandler.getAvailableRemoveFile() %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <% } %>
        
        <%-- UNLOCK -------------------------------------------- --%> 
        <% if (nbElt == 1 && formHandler.isUpdate() && doc.isStrongLocked()) { %>
        <jalios:field name="unlock" label="ui.work.doc.lbl.unlock" value='<%= "true" %>'>
         <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <% } %>
      
        <%-- Title ------------------------------------------------------------ --%> 
        <jalios:field  name='<%= "title" %>' label='<%= glp("ui.com.lbl.title") %>' description='<%= glp("ui.work.doc.txt.title") %>' required='<%= false %>' ml='<%= channel.isMultilingual() %>' value='<%= formHandler.getAllAvailableTitleML() %>'>
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
      
      
        <%-- Document Type Editor  --%>
        <% if (docFormHandler != null) { %>
        <% docFormHandler.validate(); %>
        <% request.setAttribute("formHandler", docFormHandler); %>   
        <jalios:include jsp='<%= "types/" + documentTypeShortName + "/doEdit" + documentTypeShortName + ".jsp" %>' />
        <% } %>
        
      
      </div>
    
      <%-- CATEGORIES ------------------------------------------------------------ --%>   
      <% if (!formHandler.isCategoryTabHidden()) { %>
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='categories' alt='C' title='<%= glp("ui.work.form.lbl.categories") %>' />&nbsp;<%= glp("ui.work.form.lbl.categories") %></h2>
    
        <%@ include file='/work/doEditPubCat.jspf' %>
  
    
      </div>
      <% } %>
    
      <%-- READ RIGHTS ------------------------------------------------------------ --%> 
      <% if (!formHandler.isReadRightTabHidden()) { %>
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='read-right' alt='R' title='<%= glp("ui.work.form.lbl.read-rights") %>' />&nbsp;<% /* %>Read Rights<% */ %><%= glp("ui.work.form.lbl.read-rights") %></h2>
        <%-- AuthorizedGroupSet ------------------------------------------------------------ --%> 
        <jalios:field name="gids" label="ui.work.form.lbl.grp-read-rights" value='<%= formHandler.getAvailableAuthorizedGroupSet() %>' mv='1'>
          <jalios:control type="<%= ControlType.GROUP %>" />
        </jalios:field>
            
        <%-- AuthorizedMemberSet ------------------------------------------------------------ --%> 
        <jalios:field name="mids" label="ui.work.form.lbl.mbr-read-rights" value='<%= formHandler.getAvailableAuthorizedMemberSet() %>' mv='1'>
          <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
        </jalios:field>
      </div>
      <% } %>
    
    
      <%-- ADVANCED ------------------------------------------------------------ --%> 
      <% if (!formHandler.isAdvancedTabHidden() && (!isUpdate || showUnzipOpt)) { %>
      <div class="tab-page">
        <h2 class="tab"><jalios:icon src='advanced' alt='A' title='<%= glp("ui.work.form.tab.adv") %>' />&nbsp;<% /* %>Advanced<% */ %><%= glp("ui.work.form.tab.adv") %></h2>
          
          <%-- TRACK READER ---------------------------------------------------------- --%>
          <% if (!isUpdate) { %>
          <jalios:field  name='<%= "tracked" %>' label='<%= glp("ui.work.form.lbl.track") %>' required='<%= false %>' value='<%= ""+formHandler.getAvailableTracked() %>'>
            <jalios:control type="<%= ControlType.BOOLEAN %>" />
          </jalios:field>
          <% } %>
          
          <%-- UNZIP ---------------------------------------------------------- --%>
          <% if (showUnzipOpt) { %>
          <jalios:field  name='<%= "unzipUploadedFiles" %>' label='<%= glp("ui.work.form.lbl.unzip") %>' description='<%= glp("ui.work.form.lbl.unzip.h") %>' required='<%= false %>' value='<%= String.valueOf(formHandler.getUnzipUploadedFiles()) %>'>
            <jalios:control type="<%= ControlType.BOOLEAN %>" />
          </jalios:field>
          <% } %>    
    
          <%-- *** PLUGINS ********************** --%>
          <jalios:include target="DOCCHOOSER_MAINTAB" targetContext="tr" />
    
      </div>
      <% } %>
    
    </div>
  
    <%-- *** PLUGINS ********************** --%>
    <jalios:include target="DOCCHOOSER_FOOTER_BUTTON" />
  </div>
  
  <%-- Pstatus ---------------------------------------------------------- --%> 
  <input type='hidden' name='pstatus'  value='<%= formHandler.getAvailablePstatus() %>'  />
  <input type='hidden' name='startElt' value='<%= formHandler.getAvailableStartElt() %>' />
  <input type='hidden' name='nbElt'    value='<%= nbElt %>' />
  <input type='hidden' name='jsFunc'   value='<%= encodeForHTMLAttribute(formHandler.getAvailableJsFunc()) %>' />
  
  <%-- Used by MediaBrowser  --%> 
  <input type='hidden' name='ensureLuceneIndexing' value='<%= getBooleanParameter("ensureLuceneIndexing",false) %>' />
  
  <input type='hidden' name='originalType'     value='<%= encodeForHTMLAttribute(formHandler.getAvailableOriginalType().getName()) %>' />
  
  <% if (formHandler.getRedirect() != null) { %>
    <input type='hidden' name='redirect' value='<%= encodeForHTMLAttribute(formHandler.getRedirect()) %>' />
  <% } %>
  
  <% if (isUpdate) { %>
    <input type='hidden' name='id' value='<%= encodeForHTMLAttribute(doc.getId()) %>' />
  <% } %>
  
  <% if (formHandler.getAvailableOpenerForm() != null) { %>
    <input type='hidden' name='openerForm' value='<%= encodeForHTMLAttribute(formHandler.getAvailableOpenerForm()) %>' />
  <% } %>
  
  <% if (formHandler.getAvailableOpenerRefresh() != null) { %>
    <input type='hidden' name='refresh' value='<%= encodeForHTMLAttribute(formHandler.getAvailableOpenerRefresh()) %>' />
  <% } %>

</form>

<% } else { %>
<div style="text-align: center;">
  <button class='btn btn-primary' onclick='window.close();'><%= glp("ui.com.btn.close") %></button>
</div>
<% } %>

<%@ include file='/jcore/doEmptyFooter.jspf' %>
