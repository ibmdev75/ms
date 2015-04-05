<%--
  @Summary: Generic channel query page
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Category: Search / Query
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

   jcmsContext.addCSSHeader("css/queryresult.css");  
   jcmsContext.addCSSHeader("css/jalios/ux/jalios-search.css");
   
   String foQuerySortParam = getAlphaNumParameter("sort", Util.getString(channel.getProperty("query.sort.fo"), "relevance"));
   boolean foCatName       = channel.getBooleanProperty("query.facets.text.cat", true);
   boolean foSearchInFiles = channel.getBooleanProperty("query.facets.text.file",false);
   String[] types          = channel.getBooleanProperty("query.facets.ugcs",false) ? new String[]{"com.jalios.jcms.Content", "com.jalios.jcms.UserContent"} : new String[]{"com.jalios.jcms.Content"};
   
%><%
%><jsp:useBean id="queryHandler" scope="page" class="com.jalios.jcms.handler.QueryHandler"><%
  %><jsp:setProperty name="queryHandler" property="request"       value="<%= request %>"/><%
  %><jsp:setProperty name="queryHandler" property="response"      value="<%= response %>"/><%
  %><jsp:setProperty name="queryHandler" property="catName"       value="<%= foCatName %>"/><%
  %><jsp:setProperty name="queryHandler" property="searchInFiles" value="<%= foSearchInFiles %>"/><%  
  %><jsp:setProperty name="queryHandler" property="types"         value="<%= types %>"/><%
  %><jsp:setProperty name="queryHandler" property="*" /><%
  %><jsp:setProperty name="queryHandler" property="checkPstatus" value="true"/><%
  %><jsp:setProperty name="queryHandler" property="sort"         value="<%= foQuerySortParam %>"/><%
%></jsp:useBean><%
%><%

  request.setAttribute("title", glp("ui.fo.query.title")); 
  Date lastWeekDate = new Date(System.currentTimeMillis() - JcmsConstants.MILLIS_IN_ONE_WEEK);

%><%@ include file='/jcore/doHeader.jspf' %><%

  queryHandler.setAttribute(QueryFilter.FRONTOFFICE_SEARCH, Boolean.TRUE);
  if (queryHandler.getSearchInSubWorkspaces()) {
    request.setAttribute("query.result.showWs", Boolean.TRUE);
  }
  
  // do Query
  QueryResultSet queryResultSet = queryHandler.getResultSet();
  int resultSize = queryResultSet.getResultSize();
  request.setAttribute("query.queryHandler", queryHandler);
  request.setAttribute("query.queryResultSet", queryResultSet);
  
%><jalios:pager name='plPagerHandler' declare='true' action='init'
              size='<%= resultSize %>' sort='<%= foQuerySortParam %>'/><%
              
  // Sort using pager param
  Class<? extends Publication> typesCommonSuperClass = com.jalios.jcms.handler.QueryHandler.getTypesCommonSuperClass(queryHandler);
  SortedSet<Publication> resultSet = queryResultSet.getAsSortedSet(typesCommonSuperClass, plPagerHandler.getSort(), plPagerHandler.isReverse());
  String escapedQueryString = ServletUtil.getQueryString(request, true);  

%>
<%@ include file='/jcore/doMessageBox.jspf' %>

<%-- *** DISPLAY THE RESULTS ******************************************* --%>
<%
  ServletUtil.backupAttribute(pageContext , PortalManager.PORTAL_PUBLICATION);
  ServletUtil.backupAttribute(pageContext , "counter");
  ServletUtil.backupAttribute(pageContext , "isNew");
  ServletUtil.backupAttribute(pageContext , "score");
  ServletUtil.backupAttribute(pageContext , "maxScore");
  ServletUtil.backupAttribute(pageContext , "hasScore");
  request.setAttribute("maxScore", new Float(queryResultSet.getMaxScore())); 
  request.setAttribute("hasScore", Boolean.TRUE);
  queryHandler.addHighlightAttributes(request);
  ServletUtil.backupAttribute(pageContext , "displayURLparams");
  
  String actionUrl = Util.getString(request.getAttribute("actionUrl"),ResourceHelper.getQuery());
  
%>
<form action="<%= actionUrl %>" name="queryForm" method="get" class="layout">
  <div class="query row responsive">
    
    <%-- NAVBAR --%>
    <div class="col-sm-12">
    <%@ include file='/front/doQueryNavbar.jspf' %>
    </div>
     
    <%-- RESULTS --%>
    <div class="col-sm-9 search-main-column">
  		<%-- PLUGINS --%>
  		<jalios:include target="QUERY_HEADER" />
  
  		<%-- MEMBERS --%>
  		<jalios:include jsp="front/queryMembers.jsp" />
      
      <%-- PUBLICATIONS --%>
      <%@ include file='/front/doQueryResults.jspf' %>
    </div>
  		
    <%-- FACETS --%>
  	<div class="col-sm-3 search-sidebar">
  		<%@ include file='/front/doQueryFacets.jspf' %>
    </div>
    
  </div>
</form>   
<%
  ServletUtil.restoreAttribute(pageContext , PortalManager.PORTAL_PUBLICATION);
  ServletUtil.restoreAttribute(pageContext , "counter");
  ServletUtil.restoreAttribute(pageContext , "isNew");
  ServletUtil.restoreAttribute(pageContext , "score");
  ServletUtil.restoreAttribute(pageContext , "maxScore");
  ServletUtil.restoreAttribute(pageContext , "hasScore");
  queryHandler.clearHighlightAttributes(request);
  ServletUtil.restoreAttribute(pageContext , "displayURLparams");
%>
<jalios:pager name='plPagerHandler'/>

<%@ include file='/jcore/doFooter.jspf' %> 
