<%@page import="com.jalios.jcms.upload.MultipartFilter"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
String ajaxUrl = "work/docChooserUpload.jsp";

String token = getUntrustedStringParameter("token", null);

String fileName = null;
String elapse = "0";
// String status = null;
String sizeElapse = null;
String contentLength = null;
String fileRateTotal = null;
String timeRemainTotal = null;
String timeElapse = null;
if(jcmsContext.isAjaxRequest()) {
  Map<String,String> statusMap = MultipartFilter.getFileUploadStatus("filename", token);
  token = statusMap.get("token");
  ajaxUrl += "?token=" + token;
  fileName = statusMap.get("fileName");
  elapse = statusMap.get("percentElapseTotal");
  sizeElapse = statusMap.get("sizeElapseTotal");
  contentLength = statusMap.get("contentLength");
  fileRateTotal = statusMap.get("fileRateTotal");
  timeRemainTotal = statusMap.get("timeRemainTotal");
  timeElapse = statusMap.get("timeElapse");
  // status = statusMap.get("monitorStatus");
}
%>
<div class="upload-infos ajax-refresh-div" data-jalios-ajax-refresh-url="<%= ajaxUrl %>" data-jalios-ajax-refresh-periodical="2">
  <div class="progress">
    <div class="progress-bar" role="progressbar" aria-valuenow="<%= elapse %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= elapse %>%;">
      <%= elapse %>%
    </div>
  </div>
  <div class="filename"><%= glp("ui.com.lbl.file-name", fileName) %></div>
  <div class="status">
    <div class="status-infos"><%= glp("ui.work.doc.upload.lbl.info", sizeElapse, contentLength, fileRateTotal) %></div>
    <div class="time-infos">
      <span class="left-time-infos"><%= glp("ui.work.doc.upload.lbl.left-time", timeRemainTotal) %></span>
       - 
      <span class="left-time-infos"><%= glp("ui.work.doc.upload.lbl.elapsed-time", timeElapse) %></span>
     </div>
    <%--<%= status %>--%>
  </div>
</div>