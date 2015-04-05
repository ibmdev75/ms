<%--
  @Summary: Query refine page 
  @Category: Search / Refine
  @Deprecated: False
  @Customizable: False
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

String hist = getUntrustedStringParameter("hist", null); // ENCODE !!
if (hist == null || hist.length() == 0 ) {
  sendRedirect(ResourceHelper.getSearch(), request, response);
  return;
}

// Compute the results for each categories and for each date range
com.jalios.jcms.handler.QueryHandler qh = new com.jalios.jcms.handler.QueryHandler(hist, request);
QueryResultSet resultSet = qh.getResultSet();
ObjectIntTreeMap sizeFromCategoryMap = new ObjectIntTreeMap();

long nowTime = System.currentTimeMillis();
Date lastDayDate = new Date(nowTime - JcmsConstants.MILLIS_IN_ONE_DAY);
Date lastWeekDate = new Date(nowTime - JcmsConstants.MILLIS_IN_ONE_WEEK);
Date lastMonthDate = new Date(nowTime - JcmsConstants.MILLIS_IN_ONE_MONTH);
int lastDayCount = 0;
int lastWeekCount = 0;
int lastMonthCount = 0;
for(Iterator it = resultSet.iterator(); it.hasNext();) {
  Publication pub = (Publication)it.next();
  Category[] categories = pub.getCategories();
  if (categories != null) {
    for(int i = 0; i < categories.length; i++) {
      sizeFromCategoryMap.inc(categories[i]);
      // increments all the ancestors
      for(Category itParent = categories[i].getParent(); itParent != null; itParent = itParent.getParent()) {
        sizeFromCategoryMap.inc(itParent);
      }
    }
  }
  if (pub.getCdate().after(lastDayDate)) {
    lastDayCount++;
  }
  if (pub.getCdate().after(lastWeekDate)) {
    lastWeekCount++;
  }
  if (pub.getCdate().after(lastMonthDate)) {
    lastMonthCount++;
  }
}
Set usedCidSet = qh.getAllCidSet();

request.setAttribute("title", glp("ui.fo.refine.title", "" + resultSet.getResultSize())); 

%><%@ include file='/jcore/doHeader.jspf' %><% 

  String adSearchTitle          = glp("ui.fo.refine.title", "" + resultSet.getResultSize());
  String actionUrl              = ResourceHelper.getQuery();
  String formCssClass           = "noSingleSubmitButton"; 

  boolean exactCatChecked            = false;
  boolean catModeAnd                 = true;
  boolean catWidgetDisableSelectable = true;
  Set catWidgetSelectedSet           = null;
  Set catHighlightCatSet             = null;
  Set searchCategoryRootSet          = channel.getAdvRefineRootSet();
  List typeList = Arrays.asList(channel.getClass(channel.getDefaultQueryTypesOff()));

  // HiddenParams  
  Map hiddenParams = new HashMap();
  {
    hiddenParams.put("id",     Util.addAll(getStringParameterValues("id", HttpUtil.DATAID_REGEX),     new TreeSet()));
    hiddenParams.put("portal", Util.addAll(getStringParameterValues("portal", HttpUtil.DATAID_REGEX), new TreeSet()));
    Set histSet = new TreeSet();
    histSet.add(hist);
    hiddenParams.put("hist",   histSet);
  }

  request.setAttribute("dstTypesOff",           typeList);
  request.setAttribute("dstReplaceFileDoc",     "false");
  request.setAttribute("dstShowEmptyType",      "false");
  request.setAttribute("dstShowAbstractType",   "false");

  request.setAttribute("refineSet", resultSet);

  ServletUtil.backupAttribute(pageContext , "adSearchTitle");            
  ServletUtil.backupAttribute(pageContext , "actionUrl");             
  ServletUtil.backupAttribute(pageContext , "formCssClass");             
  ServletUtil.backupAttribute(pageContext , "exactCatChecked");          
  ServletUtil.backupAttribute(pageContext , "catModeAnd");         
  ServletUtil.backupAttribute(pageContext , "catWidgetDisableSelectable");
  ServletUtil.backupAttribute(pageContext , "catWidgetSelectedSet");
  ServletUtil.backupAttribute(pageContext , "catHighlightCatSet");
  ServletUtil.backupAttribute(pageContext , "hiddenParams");
  ServletUtil.backupAttribute(pageContext , "searchCategoryRootSet");
  ServletUtil.backupAttribute(pageContext , "pubCountDisplayCat");
  ServletUtil.backupAttribute(pageContext , "pubCountDisplay");
  ServletUtil.backupAttribute(pageContext , "historyList");
  
  request.setAttribute("adSearchTitle",               adSearchTitle);
  request.setAttribute("actionUrl",                   actionUrl);
  request.setAttribute("formCssClass",                formCssClass); 
  request.setAttribute("exactCatChecked",             Boolean.valueOf(exactCatChecked));
  request.setAttribute("catModeAnd",                  Boolean.valueOf(catModeAnd));
  request.setAttribute("catWidgetDisableSelectable",  Boolean.valueOf(catWidgetDisableSelectable));
  request.setAttribute("catWidgetSelectedSet", catWidgetSelectedSet);
  request.setAttribute("catHighlightCatSet", catHighlightCatSet);
  request.setAttribute("hiddenParams", hiddenParams);
  request.setAttribute("searchCategoryRootSet", searchCategoryRootSet);
  request.setAttribute("pubCountDisplayCat",          Boolean.TRUE);
  request.setAttribute("pubCountDisplay",             Boolean.TRUE);
  request.setAttribute("historyList", qh.getHistoryList());
%><jsp:include page='<%= "/front/doSearch.jsp" %>' /><%
  ServletUtil.restoreAttribute(pageContext , "adSearchTitle");
  ServletUtil.restoreAttribute(pageContext , "actionUrl");
  ServletUtil.restoreAttribute(pageContext , "formCssClass");
  ServletUtil.restoreAttribute(pageContext , "exactCatChecked");
  ServletUtil.restoreAttribute(pageContext , "catModeAnd");
  ServletUtil.restoreAttribute(pageContext , "catWidgetDisableSelectable");
  ServletUtil.restoreAttribute(pageContext , "catWidgetSelectedSet");
  ServletUtil.restoreAttribute(pageContext , "catHighlightCatSet");
  ServletUtil.restoreAttribute(pageContext , "hiddenParams");
  ServletUtil.restoreAttribute(pageContext , "searchCategoryRootSet");
  ServletUtil.restoreAttribute(pageContext , "pubCountDisplayCat");
  ServletUtil.restoreAttribute(pageContext , "pubCountDisplay");
  ServletUtil.restoreAttribute(pageContext , "historyList");
%>
<%@ include file='/jcore/doFooter.jspf' %>
