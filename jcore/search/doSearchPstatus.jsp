<%--
  @Summary: Pstatus search panel
  @Deprecated: False
  @Customizable: False
  @Requestable: False
  @Category: Search / Query
  @Since: jcms-4.0
--%>
<%@page import="com.jalios.util.Util"%>
<%@page import="com.jalios.jcms.HttpUtil"%>
<%@page import="com.jalios.jcms.Workflow"%>
<%@page import="com.jalios.jcms.WorkflowManager"%>
<%@page import="com.jalios.jcms.taglib.settings.impl.EnumerateSettings"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
String wfId = (String) request.getAttribute("dspWfId");
wfId = wfId == null ? HttpUtil.getUntrustedStringParameter(request, "wfId", null) : wfId;
Workflow wf = Util.notEmpty(wfId) ? WorkflowManager.getInstance().getWorkflow(wfId) : WorkflowManager.getInstance().getDefaultWorkflow();
%>
  <div class="ajax-refresh-div" data-jalios-ajax-refresh-url="jcore/search/doSearchPstatus.jsp">
  <%--
  <jalios:field name="wfId" label="ui.work.search.tab.wf" value="<%= wf %>" resource="field-vertical">
    <jalios:control settings='<%= new EnumerateSettings().select().required().enumValues(WorkflowManager.getInstance().getWorkflowSet()).dataAttribute("jalios-action", "ajax-refresh") %>' />
  </jalios:field>
  --%>
  <% if(wf != null) { %>
    <%
    int[] dspPstatus = (int[]) request.getAttribute("dspPstatus");
    List<Integer> pstatusList = new ArrayList<Integer>();
    if(dspPstatus != null) {
      for(int pstatus : dspPstatus) {
        pstatusList.add(pstatus);
      }
    }
    
    Map<String,String> wfStatusToLabelMap = new LinkedHashMap<String,String>();  
    for (WFState state : wf.getStateSet()) {
      pstatusList.remove((Integer) state.getPstatus());
      
      if (state.getPstatus() == WorkflowManager.ARCHIVED_PSTATUS) {
        continue;
      }
  
      wfStatusToLabelMap.put(String.valueOf(state.getPstatus()), state.getLabel(userLang) );
    }
    %>
    <jalios:field name="pstatus" label="ui.work.search.tab.state" value="<%= dspPstatus %>" resource="field-vertical">
      <jalios:control settings='<%= new EnumerateSettings().checkbox().enumValues(wfStatusToLabelMap.keySet()).enumLabels(wfStatusToLabelMap.values()) %>' />
    </jalios:field>
    
    <jalios:field name="pstatus" label="ui.work.search.tab.state.custom" value="<%= pstatusList %>" resource="field-vertical" mv="0">
      <jalios:control type="<%= ControlType.TEXTFIELD %>" />
    </jalios:field>
  <% } %>
</div>