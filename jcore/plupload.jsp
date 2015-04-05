<%@ page import="org.apache.commons.fileupload.*, com.jalios.jcms.upload.*" %><%@ include file="/jcore/doInitPage.jspf" %><%

  // Retrive FileName
  String fileName = getUntrustedStringParameter("file", null); // ENCODE !!
  
  // Retrieve FileItem
  FileItem fileItem = (FileItem) request.getAttribute("file");
  request.removeAttribute("file");
  
  // The field name to store
  String field = getAlphaNumParameter("field","field"); // see plupload.js/token = \w+
   
  // The token to store
  String token = getAlphaNumParameter("token",""); // see plupload.js/token = \w+
  
  // Remove option
  boolean remove    = getBooleanParameter("opRemove",false);
  boolean removeAll = getBooleanParameter("opRemoveAll",false);
  
  // Perform action
  if (remove && Util.notEmpty(fileName)){
    UploadManager.getInstance().removeFileItem(jcmsContext, token, field, fileName);
  } else if (removeAll){
    UploadManager.getInstance().removeAllFileItem(jcmsContext, token, field);
  } else if (Util.notEmpty(fileName)){
    UploadManager.getInstance().storeFileItem(jcmsContext, token, field, fileItem);
  } else {
    return;
  }
%>DONE