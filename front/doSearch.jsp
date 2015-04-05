<%@ include file='/jcore/doInitPage.jspf' %><%
  String adSearchTitle          = (String)request.getAttribute("adSearchTitle");
  String actionUrl              = (String)request.getAttribute("actionUrl");
  String formCssClass           = (String)request.getAttribute("formCssClass"); 

  boolean exactCatChecked       = !Boolean.FALSE.equals(request.getAttribute("exactCatChecked"));
  boolean catModeAnd            = Boolean.TRUE.equals(request.getAttribute("catModeAnd")); 
  boolean catWidgetDisableSelectable    = !Boolean.FALSE.equals(request.getAttribute("catWidgetDisableSelectable"));
  boolean pubCountDisplayCat    = Boolean.TRUE.equals(request.getAttribute("pubCountDisplayCat"));
  boolean pubCountDisplay       = Boolean.TRUE.equals(request.getAttribute("pubCountDisplay"));
  Set catWidgetSelectedSet      = (Set) request.getAttribute("catWidgetSelectedSet");
  Set catHighlightCatSet        = (Set) request.getAttribute("catHighlightCatSet");
  
  Set searchCategoryRootSet     = (Set) request.getAttribute("searchCategoryRootSet");
  searchCategoryRootSet = Util.isEmpty(searchCategoryRootSet) ? channel.getSearchRootSet() : searchCategoryRootSet;

  Map hiddenParams = (Map) request.getAttribute("hiddenParams");
  
  Set refineSet = (Set)request.getAttribute("refineSet");

  
  String ADVANCEDSEARCH_INPUT_ID_PREFIX = "SearchInputIdPrefix_";  
%>
<form action="<%= actionUrl %>" method="get" name="queryForm" class="form-horizontal hidden-print <%= (Util.isEmpty(formCssClass) ? "" :formCssClass) %>">
  <div class="navbar navbar-default">
    <div class="navbar-brand"><%= glp("ui.fo.adv-search.title") %></div>
    <div class="navbar-form">
      <div class="navbar-right">
        <button class='btn btn-primary' type="submit" value="true"><%= glp("ui.work.search.btn.search") %></button>
      </div>
    </div>
  </div>
  <%
    Calendar beginCalendar = Calendar.getInstance();
    Calendar endCalendar   = Calendar.getInstance();
    
    beginCalendar.setTime(new Date(System.currentTimeMillis()- 3*JcmsConstants.MILLIS_IN_ONE_MONTH));
    endCalendar.setTime(new Date());
    
    java.text.DateFormatSymbols dfs = new java.text.DateFormatSymbols(userLocale);
  
    
    List historyList = (List)request.getAttribute("historyList");
    boolean refineMode = Util.notEmpty(historyList); 
    String lblPrefix = refineMode ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
    if (refineMode) {
  %>
  <jalios:message title="">
    <p>
      <%= glp("ui.fo.refine.lbl.hist") %><br />
      <jalios:foreach name="itHistory" type="String" collection="<%= historyList %>">
        <%= itCounter %>. <%= encodeForHTML(itHistory) %><br/>                
      </jalios:foreach>
    </p>
  </jalios:message>
  <% } %>

<% int formElementCount = 0; %>
<div class="tab-pane" id="<%= refineMode ? "refine" : "search" %>-tab-pane">
  <%-- *** TEXT ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Enter a text to match<% */ %><%= glp(lblPrefix + "text") %></h2>
    <%@ include file='/jcore/search/doSearchText.jspf' %>
  </div>

  <%-- *** CATEGORY ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Select categories<% */ %><%= glp(lblPrefix + "cat") %></h2>
    <% request.setAttribute("dscCatSet", catWidgetSelectedSet); %>
    <% request.setAttribute("dscRootSet", channel.getSearchRootSet()); %>
    <%@ include file='/jcore/search/doSearchCategory.jspf' %>
  </div>

  <%-- *** DATE ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Select a date range<% */ %><%= glp(lblPrefix + "date") %></h2>

    <%@ include file='/jcore/search/doSearchDate.jspf' %>
  </div>

  <%-- *** TYPE ************************************** --%>
  <%
  ServletUtil.backupAttribute(pageContext, "dstRefineSet");
   if (Util.notEmpty(refineSet)) {
     request.setAttribute("dstRefineSet", refineSet);
   }
  %>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Select types<% */ %><%= glp(lblPrefix + "type") %></h2>
    <%@ include file='/jcore/search/doSearchType.jspf' %>
  </div>
  <% ServletUtil.restoreAttribute(pageContext, "dstRefineSet"); %>

  <%-- *** GROUP ************************************** --%>
  <jalios:if predicate='<%= isLogged %>'>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Select group<% */ %><%= glp(lblPrefix + "group") %></h2>
    <%@ include file='/jcore/search/doSearchGroup.jspf' %>
  </div>
  </jalios:if>

  <%-- *** LANG ************************************** --%>
  <jalios:if predicate='<%= channel.isMultilingual() %>'>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Select languages<% */ %><%= glp(lblPrefix + "lang") %></h2>
    <%@ include file='/jcore/search/doSearchLang.jspf' %>
  </div>
  </jalios:if>
  
  <%-- *** FileDocument kind ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Document kinds<% */ %><%= glp(lblPrefix + "kind") %></h2>
    <%@ include file='/jcore/search/doSearchKind.jspf' %>
  </div>

  <%-- *** WORKSPACE ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><% /* %>Workspace<% */ %><%= glp(lblPrefix + "ws") %></h2>
    <%@ include file='/jcore/search/doSearchWorkspace.jspf' %>
  </div>

  <%-- *** PLUGINS ********* --%>
  <jalios:include target="SEARCH" targetContext="tab-pag" />
  
</div>
<jalios:foreach name="itHiddenParam" type="Map.Entry" collection="<%= hiddenParams.entrySet() %>"><% 
 Object paramValue = itHiddenParam.getValue();
 if (paramValue instanceof String) { 
   %><input name="<%= itHiddenParam.getKey() %>" type="hidden" value="<%= encodeForHTMLAttribute((String) paramValue) %>" /><%
 } else if (paramValue instanceof Set) { 
   for (String itParamValue : ((Set<String>) paramValue)) {
     %><input name="<%= itHiddenParam.getKey() %>" type="hidden" value="<%= encodeForHTMLAttribute((String) itParamValue) %>" /><%     
   }
 } 
%></jalios:foreach>
</form>
