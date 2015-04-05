<%@page import="java.util.zip.ZipEntry"%>
<%@page import="java.util.zip.ZipOutputStream"%><%@ include
	file='/jcore/doInitPage.jspf'%><%@page
	import="java.text.SimpleDateFormat"%><%@page
	import="com.jalios.util.Util"%><%@page import="com.jalios.jcms.stat.*"%><%
  HashMap<String, ExportParameters> paramsMap = (HashMap<String, ExportParameters>) loggedMember.getExtraInfo(StatExporter.JCMS_EXPORT_RAW_DATA_PARAMS_MAP);
  String token = getAlphaNumParameter(StatExporter.TOKEN, null);
  if (token == null) {
    token = (String) request.getAttribute(StatExporter.TOKEN);
  }
  out.print("<div id=\"progressDiv\"  class=\"ajax-refresh-div progressBar\">");
  boolean isExporterRunning = false;
  boolean isHeaderPrinted = false;
  if (paramsMap != null && !paramsMap.isEmpty()) {
    StringBuilder content = new StringBuilder();
    int index =0;
    // dumpExistingExport    
    Workspace currentWorkspace = (Workspace) request.getAttribute("StatExporter_CURRENT_WORKSPACE");
    for (String tokenKey : paramsMap.keySet()) {
      ExportParameters currentParams = paramsMap.get(tokenKey);
      StatExporter exporter = currentParams.getLinkedExporter();
      if(currentWorkspace != null && !(currentWorkspace.equals(currentParams.getWorkspace()) || isAncestor(currentWorkspace, currentParams.getWorkspace()))){
        continue;        
      }
      if(!isHeaderPrinted){
        addHeader(content);
        isHeaderPrinted = true;
      }
      // check if process is ended or not
      if (exporter.isWorking()) {
        long state = exporter.getStatus();
        isExporterRunning = true;
        content.append("<tr ");
        content.append("><td>" + generateDescription(currentParams, userLang) + "</td><td> ");
        content.append(generateResponse(state, ""));
        content.append("</td></tr>");
      } else {
        content.append("<tr ");
        content.append("><td>" + generateDescription(currentParams, userLang) + "</td><td>");
        StringBuilder link = new StringBuilder("<a href=\"").append(contextPath).append("/admin/stat/doDownloadExport.jsp?downloadFile=true&").append(StatExporter.TOKEN).append("=").append(tokenKey).append("\"><img src=\"images/jalios/icons/download.gif\" alt=\"Download\" /></a>");
        link.append("<a class=\"cross\" onclick=\"return confirm('").append(glp("ui.statreport.exportRawData.ConfirmClear")).append("');\" href=\"").append(contextPath).append("/admin/stat/doClearExport.jsp?").append(StatExporter.TOKEN).append("=").append(tokenKey).append("\"><img class=\"cross icon icon16\" src=\"s.gif\" alt=\"Clear\" /></a>");
        content.append(generateResponse(100, link.toString()));
        content.append("</td></tr>");
      }
      index++;
    }
    content.append("</table>");
    out.print(content.toString());
  }
  if (paramsMap != null && !paramsMap.isEmpty() && isExporterRunning) {
%><jalios:javascript>
	JCMS.ajax.Refresh.refreshDIV.delay(2,$('progressDiv'), "<%=contextPath%>/admin/stat/doAsyncExport.jsp");
  </jalios:javascript>
<%@ include file='/jcore/doAjaxFooter.jspf'%>
<%} 
  out.print("</div>");
%>
<%!String generateResponse(long state, String otherMessage) {
    //generate first progress bar 
    StringBuilder builder = new StringBuilder("<table class='layout'><tr><td>");
    if (state < 100) {
      builder.append(glp("ui.statreport.exportRawData.exportInProgress"));
    } else {
      builder.append(glp("ui.statreport.exportRawData.exportEnded"));
    }
    builder.append("&nbsp;").append(otherMessage).append("</td><td>");
    if (state < 100) {
      builder.append(generateProgressBar(state));
    }
    builder.append("</td></tr></table>");
    return builder.toString();
  }%><%!String generateProgressBar(long percentValue) {

    StringBuilder builder = new StringBuilder("<table class='layout'><tr><td><div class=\"ProgressBarContainer\"><div class=\"ProgressBarExecuted\" width=\"");
    builder.append(percentValue).append("%\">&nbsp;</div></div></td><td>&nbsp;").append(percentValue).append("%</td></tr></table>");
    builder.append("<style>.ProgressBarExecuted{width:").append(percentValue).append("%;}</style>");
    return builder.toString();

  }%><%!String generateDescription(ExportParameters params, String userLang) {
    return glp("ui.statreport.exportRawData.RunningExportDescription", new Object[] { params.getWorkspace() == null?glp("ui.statreport.exportRawData.AllWorkspaces"):params.getWorkspace().getTitle(userLang), channel.getDateFormat(userLang).format(params.getBeginDate()), channel.getDateFormat(userLang).format(params.getEndDate()), params.getToken() });
  }%><%!
  	public boolean isAncestor(Workspace wk1, Workspace wk2){
    	if(wk1 == null || wk2 == null){
    	  return false;
    	}
    	Set<Workspace> wkSet = wk1.getAllSubWorkspaces();
    	if(Util.notEmpty(wkSet)){
    	  for(Workspace child : wkSet){
    	    if(wk2.equals(child)){
    	      return true;
    	    }
    	    else{
    	      if(isAncestor(child, wk2)){
    	        return true;
    	      }
    	    }
    	  }
    	}
    	return false;
  	}  
  	public void addHeader(StringBuilder content){
      content.append("<h2  class='boTitle'>").append(glp("ui.statreport.exportRawData.ExistingExport")).append("</h2>");
      content.append("<table class='layout' style='width:400px;'><tr><th class=\"listHeader\">");
      content.append(glp("ui.statreport.exportRawData.Description"));
      content.append("</th><th class=\"listHeader\">");
      content.append(glp("ui.statreport.exportRawData.State"));
      content.append("</th></tr>"); 
  	}
  
  %>