<%--
  @Summary: Search facet to extend search to sub Workspaces.
  @Deprecated: False
  @Customizable: False
  @Category: Search / Query
  @Since: jcms-7.1.3, jcms-8.0
--%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%

int boxStatus = Util.toInt(request.getAttribute("query.facets.workspaces"),0);

QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");

if (qh == null) {
  return;
}

// Have workspace any Sub workspaces ?
Workspace forcedWS = getWorkspaceParameter("wrkspc");
forcedWS = forcedWS != null ? forcedWS : workspace;
if (Util.isEmpty(forcedWS.getAllSubWorkspaces())) {
  return;
}
if (qh.getSearchInSubWorkspaces()){
  boxStatus = 1;
}

final String facetName = "searchInSubWorkspaces";
boolean isExactSpaceRefinement = getBooleanParameter(facetName, false);
%>
<jalios:accordion-panel title="ui.work.search.tab.ws" picture="work" active="<%= boxStatus != 2 %>">

    <ul class="facet-list list-unstyled">
      <% String exactSpaceInputId = FACET_PREFIX + facetName; %>
      <li class='stick <%= isExactSpaceRefinement ? "checked" : "" %>'>
        <input id="<%= exactSpaceInputId %>" type='checkbox' name='<%= facetName %>' value='true' <%= isExactSpaceRefinement ? "checked=\"checked\"" : ""%> />
        <label for="<%= exactSpaceInputId %>"><%= glp("ui.work.search.ws") %></label>
        <jalios:tooltip property='ui.work.search.ws.h' params='<%= new String[]{forcedWS.getTitle(userLang)} %>'/>
      </li>
    </ul>

</jalios:accordion-panel>
