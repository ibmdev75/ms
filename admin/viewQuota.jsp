<%--
  @Summary: Display quota information about the site
  @Category: Admin / Channel
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-7.1
--%><%@page import="com.jalios.jcms.QuotaManager.WorkspaceNodeComparator.WorkspaceNodeComparatorType"%>
<%@page import="com.jalios.jcms.taglib.EditTag"%>
<%@page import="com.jalios.jcms.QuotaManager.WorkspaceNode"%><%
%><%@page import="com.jalios.jcms.QuotaManager.WorkspaceNodeComparator"%><%
%><%@page import="com.jalios.jcms.QuotaManager.WorkspaceNodeComparator"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% request.setAttribute("quotaSubAdminMenu", "true");  %><%
%><%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header">
  <h1><%= glp("ui.adm.mn.files.view-quota") %></h1>
</div>

<div class="quota-site">
<%
QuotaManager mgr = QuotaManager.getInstance();
int pageSize = 10;

if(mgr.isQuotaEnabled()){
	Map<Workspace, QuotaElement> elements = mgr.getElements();
	QuotaElement siteElement = elements.get(null);
	List<WorkspaceNode> workspaceNodeList =  QuotaManager.generateWorkspaceTreeList();
	WorkspaceNodeComparatorType sortCriteria = WorkspaceNodeComparatorType.fromString(getAlphaNumParameter("sort", "workspaceNodeState"));
	boolean reverseCriteria = getBooleanParameter("reverse", false);
	Collections.sort(workspaceNodeList, new WorkspaceNodeComparator(elements, sortCriteria, reverseCriteria ));
	String contextRoot = jcmsContext.getContextPath();
  QuotaElement element = mgr.getSiteElement();
  long size = element == null ?0L: element.getQuota();
  long maxQuotaValue = element == null ?100L:element.getQuotaMaxValue();
%>
  <div>
    <% if(element != null){ %>
    <span class="quota-site-title"><%=glp("ui.adm.mn.files.view-quota.all-site") %></span>
    <% String link = "admin/fileSizeMap.jsp";%>
    <span class="quota-site-element <%=element.isAlert()?"warning":""%> <%=(element.getQuota() > element.getQuotaMaxValue())?"exceeded":""%>">
    <a href='<%=link %>'><%=Util.formatFileSize(size, userLocale)%></a> / <%=Util.formatFileSize(maxQuotaValue, userLocale)%>
    </span>
    <div class="quota-site-gauge">
      <%=generateQuotaBar(size, maxQuotaValue, element.getAlertThreshold(), element.isAlert(), element.isOver())%>
    </div>
    <% } else { %>
    <jalios:message msg="ui.adm.mn.files.view-quota.data-computation-in-progress" />
    <% } %> 		 
  </div>
  <jalios:pager name='wsPagerHandler' 
                declare='true' 
                action='init' 
                pageSize='<%=pageSize %>'                
                size='<%= workspaceNodeList.size() %>'/>
                
  <table class="table-data">
	  <tr>
  		<th class='fit'></th>
  		<th class="nowrap"><%= glp("ui.com.lbl.workspace") %>&nbsp;<jalios:pager name='wsPagerHandler' action='showSort' sort='workspaceNodeName'/></th>
  		<th class="nowrap"><%= glp("ui.filedocument.lbl.size") %>&nbsp;<jalios:pager name='wsPagerHandler' action='showSort' sort='workspaceNodeSize'/></th>
  		<th class="nowrap"><%= glp("ui.filedocument.lbl.size-max") %>&nbsp;<jalios:pager name='wsPagerHandler' action='showSort' sort='workspaceNodeMaxSize'/></th>
  		<th class='fit' style="width:300px;"><%= glp("ui.adm.mn.files.view-quota.state") %>&nbsp;<jalios:pager name='wsPagerHandler' action='showSort' sort='workspaceNodeState'/></th>
	  </tr>  
  	<jalios:foreach collection="<%= workspaceNodeList %>" type="WorkspaceNode" name="wkNode" 
        max="<%= wsPagerHandler.getPageSize() %>"
        skip="<%= wsPagerHandler.getStart() %>">
    <% if(wkNode.getWorkspace() != null){
        	  Workspace wk = wkNode.getWorkspace();
    %>
    <%= generateContent(wk,  elements.get(wk), userLang, userLocale, WorkspaceNodeComparatorType.LEVEL.equals(sortCriteria)?(wkNode.getLevel() * 10):10, jcmsContext, wsPagerHandler.getStart() + itCounter.intValue()) %>
    <% } %>
    </jalios:foreach>
  </table>
  <jalios:pager name='wsPagerHandler' />

<% } else { 
  jcmsContext.addMsg(new JcmsMessage(JcmsMessage.Level.WARN, glp("ui.adm.mn.files.view-quota.quota-not-enabled")));
  %><%@ include file='/jcore/doMessageBox.jspf' %><%
}
%></div><%@ include file="/admin/doAdminFooter.jspf" %><%
%><%!
private String generateQuotaBar(long quotaValue, long quotaMaxValue, int alertThreshold, boolean isAlert, boolean isOver){
  int percentValue  = Math.round((100 * quotaValue)/quotaMaxValue);
  StringBuffer buffer = new StringBuffer("<div class=\"progress\">");
  buffer.append("<div class=\"progress-bar ").append(isOver?"progress-bar-danger":(isAlert?"progress-bar-warning":"progress-bar-success")).append("\" style=\"width: ").append(percentValue).append("%;\">");
  buffer.append(percentValue).append("%");
  buffer.append("</div>");
  buffer.append("</div>");
  return buffer.toString();
}

private String generateContent(Workspace wk, QuotaElement element, String currentLang, Locale locale, int padding, JcmsJspContext jcmsJspContext, int index){
  long size = element == null ?0L: element.getQuota();
  long maxQuotaValue = element == null ?100L:element.getQuotaMaxValue();
  StringBuilder buffer = new StringBuilder();
  String link = "";
  if(element != null){
    link = "admin/fileSizeMap.jsp";
    if(wk !=null){
      link = "work/wsDataReport.jsp?openTab=3&ws="+wk.getId();
    }
  }
  buffer.append("<tr>");   
  if(wk == null){
    buffer.append("<td style='padding:").append(padding).append("px' >");
    buffer.append( glp("ui.adm.mn.files.view-quota.all-site"));     
  }
  else{    
    EditTag tag = new EditTag();
    buffer.append("<td class='text-right text-overflow'>").append(index).append(". ");
    buffer.append(tag.getEditIcon(jcmsJspContext, wk.getId(), null, null, false, null));
    buffer.append("</td><td style='padding:").append(padding).append("px' >");
    buffer.append("<a href='").append(link).append("'>").append(wk.getTitle(currentLang)).append("&nbsp;").append("</a>");
  }
  buffer.append("</td>");
  if(element != null){       
  	buffer.append("<td class='numeric fit'>").append("<a href='").append(link).append("'>").append(Util.formatFileSize(size, locale)).append("</a></td>");
  	buffer.append("<td class='numeric fit'>").append(Util.formatFileSize(maxQuotaValue, locale)).append("</td>");
  	buffer.append("<td class='text-right ").append(element.isAlert()?"alert":"").append((element.getQuota() > element.getQuotaMaxValue())?" exceeded":"");
  	buffer.append("'>").append(generateQuotaBar(size, maxQuotaValue, element.getAlertThreshold(), element.isAlert(), element.isOver())).append("</td>");
  } else {
     buffer.append("<td class='listValue' colspan='2'>").append(glp("ui.adm.mn.files.view-quota.data-computation-in-progress")).append("</td>");
  } 		 
  buffer.append("</tr>");
  return buffer.toString();
}
%>