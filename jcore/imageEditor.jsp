<%@ page language="java" contentType="text/html; charset=UTF-8" %><%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.media.EditImageHandler">
  <jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/>
  <jsp:setProperty name="formHandler" property="*" />
</jsp:useBean>
<%
  if (!formHandler.validate()){
%><%@ include file="/jcore/modal/modalRedirect.jspf" %><%
  }
  boolean isDataWriteEnable = channel.isDataWriteEnabled();
  FileDocument fd = formHandler.getFileDocument();
  jcmsContext.addJavaScript("js/lib/imagesLoaded/imagesloaded.pkgd.js");
  
  jcmsContext.addCSSHeader("css/lib/jcrop/jquery.Jcrop.css");
  jcmsContext.addJavaScript("js/lib/jcrop/jquery.Jcrop.js");
  jcmsContext.addJavaScript("js/jalios/ux/jalios-crop.js");
%>


<jalios:modal title="ui.filedocument.image-editor" 
              url="jcore/imageEditor.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg cropper"
              picture="image-editor"
              op="opCropNew"
              button="ui.filedocument.image-editor.create">


      <% if (isDataWriteEnable){ %>
      <%@ include file='/jcore/doImageEditor.jspf' %>
      <% } %>
 
 
<jalios:buffer name="MODAL_BUTTONS">
      <% if (!isDataWriteEnable){ %>
        <input type="submit" class="btn btn-primary" name="opClose" onclick="return JCMS.window.Modal.close(false);" value="<%= glp("ui.com.btn.close") %>" />
       <% } else { %>
        <input type="hidden" name="fd" value="<%= fd.getId() %>" />
        <input type="submit" class="btn btn-default" name="opCancel" onclick="return JCMS.window.Modal.close(false);" value="<%= glp("ui.com.btn.cancel") %>" />  
        <input type="submit" class="btn btn-primary ajax-refresh" name="opCropNew"     value="<%= glp("ui.filedocument.image-editor.create") %>"/>
        <% if ("image/jpeg".equals(fd.getContentType())) {%>
        <input type="submit" class="btn btn-danger ajax-refresh" name="opCropReplace" value="<%= glp("ui.filedocument.image-editor.update") %>"/>
        <% } %>
      <% } %>
</jalios:buffer>    


</jalios:modal>
