<%@ include file="/jcore/doInitPage.jspf" %>
<%@ include file="/admin/doAdminHeader.jspf" %>
<%
if (!isAdmin) {
  return;
}

WorkflowManager wfMgr = WorkflowManager.getInstance();

String prop = "query.default.pstatus";
int[] pstatusArray = channel.getIntArrayProperty(prop, null);
Set<Integer> oldVisiblePstatusSet = new HashSet<Integer>();
if (pstatusArray != null) {
  for(int pstatus: pstatusArray) {
    if (pstatus == 0) {
      continue;
    }
    oldVisiblePstatusSet.add(pstatus);
  }
}

Map<Workflow, Set<WFState>> map = new HashMap<Workflow, Set<WFState>>();
for(String wfid: wfMgr.getWorkflowMap().keySet()) {
  Workflow wf = wfMgr.getWorkflow(wfid);
  for(WFState state: wf.getStateSet()) {
    if (state.isSpecialState()) {
      continue;
    }
    if (state.isVisible() || oldVisiblePstatusSet.contains(state.getPstatus())) {
      Set<WFState> stateSet = map.get(wf);
      if (stateSet == null) {
        stateSet = new HashSet<WFState>();
        map.put(wf, stateSet);
      }
      stateSet.add(state);
    }
  }
}
%>

<%@ include file='/jcore/doMessageBox.jspf' %>


<h2>Workflow states with potential visibility issue</h2>
<table class="table-data auto">
  <tr>
    <th><%= glp("ui.com.lbl.workflow") %></th>
    <th><%= glp("ui.com.lbl.state") %></th>
    <th><%= glp("ui.adm.wf-edit.st.lbl.pstatus") %></th>
    <th>#Pub</th>
    <th></th>
  </tr>
  
<jalios:foreach collection="<%= map.keySet() %>" name="wf" type="Workflow">
  <jalios:foreach collection="<%= map.get(wf) %>" name="state" type="WFState" counter="c2">
  <% int pstatus = state.getPstatus(); %>
  <tr>
    <td><jalios:icon src="wf" /> <a href="admin/wfEditor.jsp?id=<%= wf.getId() %>"><%= wf.getLabel(userLang) %></a></td>
    <td><%= state.getLabelHtml(userLang) %></td>
    <td class="numeric"><%= pstatus %></td>
    <%
    int jstoreCount = Util.getSize(JcmsUtil.select(channel.getDataSet(Publication.class), Publication.getPstatusSelector(pstatus), null));
    int dbCount = HibernateUtil.queryCount(Publication.class, DBConstants.PSTATUS_FIELD, new Integer(pstatus));
    int pubCount = jstoreCount + dbCount;
    String promptMsg = 
        "<div class='alert alert-info'>" + 
        "<p>Convert " + glp("ui.com.lbl.n-pub", pubCount) + " with pstatus <code>" + pstatus + "</code> in workflow <code>" + wf.getId() + "</code>.</p>" +
        "</div>" + 
        "<p>Enter the new pstatus value:</p>"; 
    %>
    <td class="numeric"><a href="work/pubBrowser.jsp?workspaceFilter=false&mode=all&pstatus=<%= pstatus %>"><%= pubCount %></a></td>
    <td>
      <% if (pubCount > 0) { %>
      <a href="admin/tools/convertPstatus.jsp?wf=<%= wf.getId() %>&pstatus=<%= pstatus %>" class="modal prompt" title="Convert this state" data-jalios-text="<%= promptMsg %>" data-jalios-modal-default="<%= pstatus + 1 %>"><jalios:icon src="wf-visibility-options" /></a>
      <% } %>
    </td>
  </tr>  
  </jalios:foreach>
</jalios:foreach>
</table>


<% if (Util.notEmpty(oldVisiblePstatusSet)) { %>
<h2>Old visible pstatus</h2>
<code><%= prop %></code>
<ul>
<% for(int pstatus: pstatusArray) { %> 
  <li><%= pstatus %></li>
<% } %>
</ul>
<% } %>




<%@ include file="/admin/doAdminFooter.jspf" %>
