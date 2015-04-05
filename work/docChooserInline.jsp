<%@ page language="java" contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%  
%><%@ page import="com.jalios.jcms.tracking.ReaderTrackerManager" %><%
%><%@ page import="com.jalios.jcms.upload.UploadManager" %><%
%><%@page import="com.jalios.jcms.handler.EditFileDocumentHandler"%><%
%><% 
    // If not logged or not allow to publish document
    if (!isLogged || !loggedMember.canPublishSome(FileDocument.class)) {
      return;
    }

%><jsp:useBean id="formHandler" scope="request" class="com.jalios.jcms.upload.DocUploadHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
  %><jsp:setProperty name="formHandler" property="modal" value="<%= true %>" /><%
%></jsp:useBean><%

  // Do not display either if user does not have publish right in the selected categories
  Set<Category> catSet = formHandler.getAvailableCategorySet();
  if (Util.notEmpty(catSet)) {
    for (Category cat : catSet) {
      if (!loggedMember.canUseCategory(cat)) {
        return;
      }
    }
  }

Class documentType = formHandler.getAvailableType();
String documentTypeShortName = documentType.getSimpleName();  

%><jalios:include jsp='<%= "/types/" + documentTypeShortName + "/do" + documentTypeShortName + "FormHandler.jsp" %>' /><%

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
%>

<%-- UPLOADING --%>
<% if (Util.isEmpty(errors) && formHandler.isUploading()) { %>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url='work/docChooserInline.jsp'>
  <jalios:javascript><%= formHandler.getNextUploadStep() %></jalios:javascript>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<% return; } %>

<%-- HIDDEN --%>
<% if (!showForm) { return; } %>

<div class="ajax-refresh-div" data-jalios-ajax-refresh-url='work/docChooserInline.jsp'>
  <form class="form-horizontal noSingleSubmitButton lang-trigger" name='inlineForm' lang="<%= formHandler.getAvailableMainLanguage() %>" 
        action='work/docChooserInline.jsp' method="post" role="form" accept-charset="UTF-8"  enctype="multipart/form-data">
        
    <%-- PLUPLOAD  --%>
    <div id="plupload-inline" class='plupload plupload-light plupload-field-filename <%= encodeForHTMLAttribute(filter) %> <%= encodeForHTMLAttribute(resize) %>'>
    </div>

    <jalios:foreach collection='<%= formHandler.getAvailableCategorySet() %>' name='itCat' type='Category'>
      <input type='hidden' name='cids' value='<%= itCat.getId() %>'>
    </jalios:foreach>


    <% String isTrackedStr = Util.getString(ReaderTrackerManager.getInstance().isTypeReaderTracked(formHandler.getPublicationClass()),"false"); %>
    <input type='hidden' name='tracked' value='<%= isTrackedStr%>' />
    <input type='hidden' name='unzipUploadedFiles' value='<%= String.valueOf(formHandler.getUnzipUploadedFiles()) %>' />
    
    <input type='hidden' name='pluploadFilter'  value='<%= encodeForHTMLAttribute(getAlphaNumParameter("pluploadFilter","")) %>'  />
    <input type='hidden' name='pluploadResize'  value='<%= encodeForHTMLAttribute(getAlphaNumParameter("pluploadResize","")) %>'  />
      
    <input type='hidden' name='pstatus'  value='<%= formHandler.getAvailablePstatus() %>'  />
    <input type='hidden' name='type' value='<%= encodeForHTMLAttribute(documentTypeShortName) %>' />
    <input type='hidden' name='originalType' value='<%= encodeForHTMLAttribute(formHandler.getAvailableOriginalType().getName()) %>' />
    <input type='hidden' name='nbElt'    value='<%= formHandler.getAvailableNbElt() %>' />
    <input type='hidden' name='jsFunc'   value='<%= encodeForHTMLAttribute(formHandler.getAvailableJsFunc()) %>' />
    <input type='hidden' name='ws'       value='<%= encodeForHTMLAttribute(formHandler.getAvailableWorkspace().getId()) %>' />
    <input type='hidden' name='id'       value='x' />
    
    <%-- Used by MediaBrowser  --%> 
    <input type='hidden' name='ensureLuceneIndexing' value='<%= getBooleanParameter("ensureLuceneIndexing",false) %>' />

    <% if (formHandler.getRedirect() != null) { %>
      <input type='hidden' name='redirect' value='<%= encodeForHTMLAttribute(formHandler.getRedirect()) %>' />
    <% } %>
    
    <% String ajaxRefreshTarget = HttpUtil.getAlphaNumParameter(request, "ajaxRefreshTarget", null);
       if (ajaxRefreshTarget != null) { %>
      <input type='hidden' name='ajaxRefreshTarget' value='<%= encodeForHTMLAttribute(ajaxRefreshTarget) %>' />
    <% } %>
    
    <%-- Used by docChooser --%>
    <% if (formHandler.getAvailableOpenerForm() != null) { %>
      <input type='hidden' name='openerForm' value='<%= encodeForHTMLAttribute(formHandler.getAvailableOpenerForm()) %>' />
    <% } %>
    
    <%-- Used by docChooser --%>
    <% if (formHandler.getAvailableOpenerRefresh() != null) { %>
      <input type='hidden' name='refresh' value='<%= encodeForHTMLAttribute(formHandler.getAvailableOpenerRefresh()) %>' />
    <% } %>
      
    <% if (formHandler.isUploadEnabled()){ %>
    <div class="inline-footer br">
      <button style="display:none;" class="btn btn-primary ajax-refresh plupload-submit" type="submit"  name="opUpload"  value="true"><%= submit %></button>
    </div>
    <% } %>

  </form>
  
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>