<%@ include file='/jcore/doInitPage.jspf' %><%
%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.AssociatedPDFUploadHandler"><%
 %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
 %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
 %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

  if (formHandler.validate()) {
    %><script type="text/javascript" language="JavaScript"><%
    if (Util.notEmpty(formHandler.getRedirect())) {
      %>window.top.jQuery.jalios.Browser.redirect("<%= formHandler.getRedirect() %>");<%
    } else {
      %>window.top.jQuery.jalios.Browser.reload();<%      
    }
    %></script><%
    return;    
  }

  FileDocument fd = formHandler.getFileDocument();

  boolean inIframe = getBooleanParameter("iframe", false);
  if (inIframe) { %><% 
    %><%@ include file='/jcore/doEmptyHeader.jspf' %><%
    %><jalios:javascript>
    window.top.jQuery('#pdfUploadSubmitIframe').parent().html(jQuery('#pdfUploadSubmitIframe').parent()[0].innerHTML);
    </jalios:javascript><%
  }
  
%>
<div class="ajax-refresh-div">
  <iframe id="pdfUploadSubmitIframe" name='pdfUploadSubmitIframe' style='display: none;'></iframe>
   
  <form  action="work/pdfUploadModal.jsp" method="post" 
         name="pdfUploadForm" enctype="multipart/form-data"
         target='pdfUploadSubmitIframe'  role="form" 
         class="form-horizontal noSingleSubmitButton lang-trigger" >
    <input type="hidden" name="id" value="<%= fd.getId() %>"/>
    <input type="hidden" name="iframe" value="true"/>
    
   <div class='modal-dialog'>
    <div class="modal-content">
  
      <div class="modal-header">
        <div class="modal-title" id="modalLabel"><%= glp("filedocument.pdfupload.modal.title") %></div>
      </div>
      
      <div class="modal-body container-fluid">
        <%@ include file='/jcore/doMessageBox.jspf' %>
        <jalios:message msg='<%= glp("filedocument.pdfupload.modal.intro", encodeForHTML(fd.getTitle(userLang))) %>' title="" dismissable="false" />
        
        <input class='formTextfield' type='file' name='pdffile'/>
      </div>
      
      <div class="modal-footer">
        <input type="button" name="opCancel" class="btn btn-default" value='<%= glp("ui.com.btn.cancel") %>' data-dismiss="modal" />
        <input type="submit" name="opUpload" class="btn btn-primary" value="<%= glp("ui.com.btn.upload") %>" />
      </div>
    </div>
   </div>
    
  </form>
  
  <%
    if (!inIframe) { 
      %><%@ include file='/jcore/doAjaxFooter.jspf' %><%
    }  
  %>
</div>
<%
  if(inIframe) { %><% 
    %><%@ include file='/jcore/doEmptyFooter.jspf' %><%
  }
%>