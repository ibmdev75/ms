<%--
  @Summary: Display help about workflow
  @Category: Work Area / Workflow
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.1
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
String type = getStringParameter("type", null, HttpUtil.CLASSNAME_REGEX);
Publication pub = getPublicationParameter("id");
WFState currState = null;
Class clazz = null;
if (pub != null) {
  clazz = pub.getClass();
  currState = pub.getWFState();
} else if (type != null) {
  clazz = channel.getClass(type);
}

if (!isLogged || clazz == null) { 
  sendForbidden(request, response);
  return;
}
Workflow wf = pub == null ? workspace.getWorkflow(clazz) : pub.getWorkflow();
WFState initState = wf.getInitState(); 
%>
<% 
  request.setAttribute("title",glp("ui.work.wfh.title", channel.getTypeLabel(clazz, userLang))); 
  request.setAttribute("zone","InternalUI");
%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>

<div style="margin: 10px;">
<div class="page-header"><h1><%= glp("ui.work.wfh.title", channel.getTypeLabel(clazz, userLang)) %></h1></div>
<table class="table-data table-condensed">
  <tr>
    <th></th>
    <th><b><% /* %>Status<% */ %><%= glp("ui.com.lbl.state") %></b></th>
    <th><b><% /* %>Description<% */ %><%= glp("ui.work.wfh.lbl.desc") %></b></th>
    <th><b><% /* %>Target Status<% */ %><%= glp("ui.work.wfh.lbl.tgt") %></b></th>
  </tr>
  <jalios:foreach collection="<%= wf.getStateSet() %>" name="itState" type="WFState">
  <tr>
    <td class='vTop'>
      <% if (itState == currState) { %>
      <jalios:icon src="current-state" />
      <% } %>
      <% if (itState == wf.getInitState()) { %>
      <jalios:icon src="init-wf" />
      <% } %>
    </td>
    <td class='vTop' nowrap="nowrap">
      <%= itState.getLabelHtml(userLang) %>
    </td>
    <td class='vTop'><%= itState.getDescription(userLang) %></td>
    <td class='vTop' nowrap="nowrap">
    <ul class="list-unstyled">
    <jalios:foreach collection="<%= itState.getTransitionSet() %>" name="itTransition" type="WFTransition" counter="itCounter2">
    <li><%= itTransition.getTarget().getLabelHtml(userLang) %> 
    - 
    <jalios:foreach collection="<%= itTransition.getRoleSet() %>" name="itRole" type="WFRole" counter="itCounter3">
    <% if (itCounter3.intValue() != 1) { %>,<% } %>
    <% WKRole wkRole = workspace.getRole(itRole); %>
    <jalios:icon src="role" /> 
    <%= itRole.getName(userLang) %>
    <% if (loggedMember.belongsToRole(wkRole)) { %>
    <jalios:memberphoto member="<%= loggedMember %>" size="<%= PhotoSize.ICON %>"/>
    <% } %>
    </jalios:foreach>
    </li>
    </jalios:foreach>
    </ul>
    </td>
  </tr>
  </jalios:foreach>
</table>
<p>
<ul>
<jalios:if predicate='<%= currState != null %>'>
<li><jalios:icon src="current-state" /> <%= glp("ui.work.wfh.txt.curr") %></li>
</jalios:if>
<li><jalios:icon src="init-wf" /> <%= glp("ui.work.wfh.txt.init") %></li>
<li><jalios:memberphoto member="<%= loggedMember %>" size="<%= PhotoSize.ICON %>"/> <%= glp("ui.work.wfh.txt.roles") %></li>
</ul>
</p>
  </div>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
