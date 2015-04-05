<%--
  @Summary: Display information about the site
  @Category: Admin / Channel
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.5
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
request.setAttribute("fileSizeSubAdminMenu", "true"); 
%><%@ page import="com.jalios.jstore.jsync.*" %><% 
%><%@ include file='/admin/doAdminHeader.jspf' %><%
%>
<div class="page-header">
	<h1><%= glp("ui.adm.mn.files.file-size-map") %></h1>
</div>
<%
boolean opRefreshFileSizeMap = getBooleanParameter("opRefreshFileSizeMap", false);
QuotaManager mgr = QuotaManager.getInstance();
WorkspaceFileAnalyzer wfa = mgr.getGlobalFileAnalyzer(opRefreshFileSizeMap);
if(wfa != null){
	ObjectLongTreeMap fileSizeMap = wfa.getFileSizeMap();
	ObjectLongTreeMap fileSizeMapWithSatellite = wfa.getFileSizeMapWithSatellite();
	String fileSizeMapRefreshUrl = ServletUtil.getUrlWithUpdatedParam(request, "opRefreshFileSizeMap", "true");
	String fileSizeMapLinkPrefix = "work/queryWork.jsp?workspaceFilter=false&amp;types=com.jalios.jcms.FileDocument&amp;types=com.jalios.jcms.DBFileDocument&amp;mode=advanced&amp;text=";
	%>	  
  <%@ include file="/admin/doFileSizeMap.jspf" %>
<%}else{
    	int completeness = mgr.getCurrentChannelAnalyzerThread() == null?0: mgr.getCurrentChannelAnalyzerThread().getCompleteness();
    %><%=glp("ui.adm.data-report.file-analyze-in-progress", completeness) %><%
        %><jalios:javascript>
       	var url = window.location.href;
       	url = url.replace(/opRefreshFileSizeMap=true/g, "opRefreshFileSizeMap=false");
   	    setTimeout('window.location.href="'+url+'";', 3000);
    	</jalios:javascript><%
%><%}%> 
<%@ include file="/admin/doAdminFooter.jspf" %>
