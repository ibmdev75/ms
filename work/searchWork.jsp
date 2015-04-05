<%--
  @Summary: Form to perform a multi-criteria search
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Summary: Form to perform a multi-criteria search
  @Category: Work Area / Query
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  Calendar beginCalendar = Calendar.getInstance();
  beginCalendar.setTime(new Date(System.currentTimeMillis()- 3*JcmsConstants.MILLIS_IN_ONE_MONTH));
  Calendar endCalendar = Calendar.getInstance();
  endCalendar.setTime(new Date());
  java.text.DateFormatSymbols dfs = new java.text.DateFormatSymbols(userLocale);

  request.setAttribute("title", glp("ui.work.search.txt.title")); 
  request.setAttribute("menu", "search"); 
  
  String ADVANCEDSEARCH_INPUT_ID_PREFIX = "SearchInputIdPrefix_";  
  
%><%@ include file='/work/doWorkHeader.jspf' %>

<div class="page-header"><h1><%= glp("ui.work.search.txt.title") %></h1></div>

<form action="work/queryWork.jsp" method="get" name='queryForm' class='noSingleSubmitButton form-horizontal'>
<div class="tab-pane" id="advsearchwork-tab-pane-1">

  <%-- *** TEXT ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.work.search.tab.text") %></h2>
    <%@ include file='/jcore/search/doSearchText.jspf' %>
  </div>

  <%-- *** CATEGORY ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.work.search.tab.cat") %></h2>
    <%@ include file='/jcore/search/doSearchCategory.jspf' %>     
  </div>

  <%-- *** DATE ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.work.search.tab.date") %></h2>
    <%@ include file='/jcore/search/doSearchDate.jspf' %>
   </div>

  <%-- *** TYPE ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.work.search.tab.type") %></h2>
    <% request.setAttribute("dstCheckPstatus", "false"); %>
    <%@ include file='/jcore/search/doSearchType.jspf' %>
  </div>

  <%-- *** GROUP ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.work.search.tab.group") %></h2>
    <%@ include file='/jcore/search/doSearchGroup.jspf' %>
  </div>

  <%-- *** STATE ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.work.search.tab.state") %></h2>
    <jalios:include jsp="/jcore/search/doSearchPstatus.jsp" />
  </div>

  <%-- *** LANG ************************************** --%>
  <jalios:if predicate='<%= channel.isMultilingual() %>'>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.work.search.tab.lang") %></h2>
    <%@ include file='/jcore/search/doSearchLang.jspf' %>
  </div>
  </jalios:if>
  
  <%-- *** FileDocument kind ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.work.search.tab.kind") %></h2>
    <%@ include file='/jcore/search/doSearchKind.jspf' %>
  </div>

  <%-- *** WORKSPACE ************************************** --%>
  <div class="tab-page">
    <h2 class="tab"><%= glp("ui.work.search.tab.ws") %></h2>
    <%@ include file='/jcore/search/doSearchWorkspace.jspf' %>
  </div>

  <%-- *** PLUGINS ************** --%>
  <jalios:include target="SEARCH_WORK" />
</div>


<div>
  <input type="hidden" name="wrkspc" value='<%= wkspcFilter ? workspace.getId() : "" %>' />
  <input type="submit" value='<%= glp("ui.work.search.btn.search") %>' class="btn btn-primary" />
</div>

<%@ include file='/work/doWorkFooter.jspf' %>
