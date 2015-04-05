<%@page import="com.jalios.jcms.analytics.ui.ReportHandler.PredefinedPeriod"%><%
%><%@page import="com.jalios.jcms.analytics.*"%><%
%><%@page import="com.jalios.jcms.JcmsConstants"%><%
%><%@page import="com.jalios.util.ServletUtil"%><%
%><%@page import="java.util.ArrayList"%><%
%><%@page import="java.util.Collections"%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
String requestedAgentId = getUntrustedStringParameter("agentId", null);
if(requestedAgentId == null){
  return ;
}
boolean isActive = getBooleanParameter("active", false);
AnalyticsManager instance = AnalyticsManager.getInstance(); 
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.analytics.ui.ReportHandler'><%
 %><jsp:setProperty name='formHandler' property='request' value='<%= request %>' /><%
 %><jsp:setProperty name='formHandler' property='response' value='<%= response %>' /><%
 %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%
request.setAttribute("ui.analytics.current-report-handler", formHandler);
Set<Workspace> workspaceSet = AnalyticsManager.getCompatibleWorkspaceSet(loggedMember);
Workspace selectedWorkspace = getDataParameter( "analyticsWS",Workspace.class);
String selectedPredefinedPeriod = getStringEnumParameter("predefinedPeriod", null, formHandler.getPredefinedPeriodIds());
boolean isFirstDisplay =  formHandler.getAvailableBeginDate() == null && formHandler.getAvailableEndDate() == null && Util.isEmpty(selectedPredefinedPeriod);
formHandler.setAnalyticsWS(selectedWorkspace == null ? null : selectedWorkspace.getId());
String prefId = getAlphaNumParameter("prefId", null);
List<AbstractStatisticAgent> agentList = instance.getAgents();
int counter = 1;
List<AbstractStatisticAgent> displayedAgentList = new ArrayList<AbstractStatisticAgent>();	
for(AbstractStatisticAgent agent : agentList){
  String agentId = agent.getClass().getName().replaceAll("\\.","_");
	if(!requestedAgentId.equals(agentId)){
	 counter ++;
	 continue;
	}
  String jsEventDisplayName = "jalios:analytics:tab:"+agentId;
  ServletUtil.backupAttribute(pageContext, "jsDisplayEventName");
  request.setAttribute("jsDisplayEventName", jsEventDisplayName);
    %><jalios:include jsp="<%=agent.getDisplayJSP()%>" /><%
  ServletUtil.restoreAttribute(pageContext, "jsDisplayEventName");
	counter ++;
	  %><jalios:javascript>
    !function($){         
      <%if(isActive){%>
        //display pane
        var evt = jQuery.Event("jalios:analytics:tab:<%=agent.getClass().getName().replaceAll("\\.","_")%>");        
        $(document).trigger(evt);
      <%}else{ %>
        jQuery.jalios.ui.Tab.select();
      <%} %>
    }(window.jQuery);
    </jalios:javascript>    
 <%
}
%><%@ include file='/jcore/doAjaxFooter.jspf' %> 