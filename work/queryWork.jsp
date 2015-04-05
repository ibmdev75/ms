<%--
  @Summary: Work Area query page
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  @Category: Work Area / Query
  @Since: jcms-3.0
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  jcmsContext.addCSSHeader("css/queryresult.css");  
  String boQuerySortParam = Util.getString(channel.getProperty("query.sort.bo"), "mdate"); 
%>
<jsp:useBean id="queryHandler" scope="page" class="com.jalios.jcms.handler.QueryHandler">
  <jsp:setProperty name="queryHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="queryHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="queryHandler" property="*" />
  <jsp:setProperty name="queryHandler" property="checkPstatus" value="false"/>
  <jsp:setProperty name="queryHandler" property="sort" value="<%= boQuerySortParam %>"/>
</jsp:useBean>
<%

  request.setAttribute("title", glp("ui.fo.query.title"));
  request.setAttribute("publicationsWAMenu", "true");
  Date lastWeekDate = new Date(System.currentTimeMillis() - JcmsConstants.MILLIS_IN_ONE_WEEK);
  String redirect = ServletUtil.getUrl(request);
%>
<%@ include file='/work/doWorkHeader.jspf' %>
<%
  if (!wkspcFilter) {  
    queryHandler.setWrkspc(null);
  }

  queryHandler.setAttribute(QueryFilter.BACKOFFICE_SEARCH, Boolean.TRUE);
  // do Query
  QueryResultSet queryResultSet = queryHandler.getResultSet();
  int resultSize = queryResultSet.getResultSize();
%>
<jalios:pager name='plPagerHandler' declare='true' action='init' size='<%= resultSize %>' sort='<%= boQuerySortParam %>' showLastLink='<%= !queryResultSet.isHybrid() %>'/>
<%
  // Sort using pager param
  Class<? extends Publication> typesCommonSuperClass = com.jalios.jcms.handler.QueryHandler.getTypesCommonSuperClass(queryHandler);
  SortedSet<Publication> resultSet = queryResultSet.getAsSortedSet(typesCommonSuperClass, plPagerHandler.getSort(), plPagerHandler.isReverse());
  queryHandler.addHighlightAttributes(request);
  
  String escapedQueryString = ServletUtil.getQueryString(request, true);
%>
  <%@ include file='/jcore/doMessageBox.jspf' %>

  <%-- *** PLUGINS ******** --%>
  <jalios:include target="QUERY_WORK_HEADER" />

  <%-- *** DISPLAY THE RESULTS ******************************************* --%>
  <%@ include file='/work/doQueryWorkHeader.jspf' %>
  

  <%
     request.setAttribute("plShowCSVExport",    Boolean.TRUE);
     request.setAttribute("plQueryString",      escapedQueryString);
     request.setAttribute("plPubSet",           resultSet); 
     request.setAttribute("plQueryResultSet",   queryResultSet); 
     request.setAttribute("plShowRelevance",    Boolean.FALSE); 
     request.setAttribute("plShowWorkspace",    Boolean.valueOf(!wkspcFilter)); 
     String displayURLparams = PortalManager.getHightlightParams(request);
     request.setAttribute("plDisplayURLparams", displayURLparams);
     request.setAttribute("plIsHybrid",         Boolean.valueOf(queryResultSet.isHybrid()));
  %>
  <jsp:include page='/work/doPubList.jsp'/>
  
<%@ include file='/work/doWorkFooter.jspf' %>
