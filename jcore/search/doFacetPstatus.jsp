<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  int boxStatus = Util.toInt(request.getAttribute("query.facets.pstatus"),0);
  if (boxStatus == 0){ return; }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  String lblPrefix = true ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  
  int[] dspPstatus = Util.toIntArray(qh.getPstatus(),0);
  if (dspPstatus != null) { 
    Arrays.sort(dspPstatus); // Required before calling Arrays.binarySearch() 
  } 
  Workflow wf = workspace.getWorkflow(Content.class); 
%>
<jalios:accordion-panel title='ui.work.search.tab.state' picture="workflow-green" active="<%= boxStatus != 2 %>">

  <ul class="facet-list">
  <jalios:foreach collection='<%= wf.getStateSet() %>' name='itState' type='WFState'>
  <%
    boolean checked = dspPstatus != null && Arrays.binarySearch(dspPstatus, itState.getPstatus()) >= 0;
    if (itState.getPstatus() != WorkflowManager.ARCHIVED_PSTATUS) {
  %>
  <li <%= checked ? "class='checked'" : "" %>>
    <% String pstatusInputId = FACET_PREFIX + "pstatus" + itState.getPstatus(); %>
    <input id="<%= pstatusInputId %>" type="checkbox" name="pstatus" value="<%= itState.getPstatus() %>" <%= checked ? "checked='checked'" : "" %> />
    <jalios:icon src="workflow-green" /> 
    <label for="<%= pstatusInputId %>" class='<%= checked ? "highlight" : "" %>'><%= itState.getLabel(userLang) %></label>
  </li>
  <% } %>
  </jalios:foreach>
  </ul>
  
</jalios:accordion-panel>