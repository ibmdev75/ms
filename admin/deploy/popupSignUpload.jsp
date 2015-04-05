<%@ include file='/jcore/doInitPage.jspf' %>
<%@page import="com.jalios.jcms.upload.DocUploadInfo, com.jalios.io.Signature"%><% 

  request.setAttribute("title",glp("ui.adm.um.tgt-sign.title")); 
  request.setAttribute("zone","InternalUI");
  
%><%@ include file='/jcore/doEmptyHeader.jspf' %>
<div style='margin: 1em;'>

<%-- UPLOAD PERFORMED, CLOSE THE POPUP --%>
<%
  DocUploadInfo info = (DocUploadInfo) jcmsContext.getUploadedFile("file",false,false);
  File tmpFile = null;
  Signature signature = null; 
  if (info != null){
	  logger.debug("doUpload()"+info.getStatusMessage(userLang));
	  tmpFile = info.getFile();
	  signature = Signature.read(tmpFile);
    if (signature == null) {
      setWarningMsg(glp("ui.adm.um.msg.bad-file"), request);
    }
  }

  if (signature != null) {
    
    signature.setType("target");
    
    String filename = info.getOriginalFileName();
	  File newLocation = new File(channel.getDataPath("signature/" + filename));
	  signature.write(newLocation);
	  tmpFile.delete(); 
%>
<script>
opener.document.location = '<%= encodeForJavaScript(getValidHttpUrl("redirect")) %>';
close();
</script>

<%-- IMPORT FORM --%>
<% } else { %>

<%@ include file='/jcore/doMessageBox.jspf' %>

<h3><%= glp("ui.adm.um.tgt-sign.title") %></h3>
<form action='admin/deploy/popupSignUpload.jsp' method='post' name='editForm' enctype="multipart/form-data">

  <jalios:field name="file" label="ui.adm.um.tgt-sign.txt" resource="field-vertical">
    <input class='formTextfield' type='file' name='file' size='50' />
  </jalios:field>
  <hr>
  <button class='btn btn-primary' type='submit' value='true'><%= glp("ui.com.btn.upload") %></button>
  <input type='hidden' name='redirect' value='<%= encodeForHTMLAttribute(getValidHttpUrl("redirect")) %>' />
</form>
<% } %>
</div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
