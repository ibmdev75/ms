<%--
  @Summary: Form to perform a multi-criteria search
  @Category: Search / Query
  @Deprecated: False
  @Customizable: False
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

  request.setAttribute("title", glp("ui.work.search.txt.title")); 
  request.setAttribute("menu", "search"); 
  
%><%@ include file='/jcore/doHeader.jspf' %><% 

  String adSearchTitle      = glp("ui.work.search.txt.title");
  String actionUrl          = ResourceHelper.getQuery();
  String formCssClass       = "noSingleSubmitButton";

  boolean exactCatChecked            = false;
  boolean catModeAnd                 = true;
  boolean catWidgetDisableSelectable = true;
  Set<Category> catWidgetSelectedSet = getDataSetParameterValues("cids", Category.class);
  Set<Category> catHighlightCatSet   = null;
  List typeList = Arrays.asList(channel.getClass(channel.getDefaultQueryTypesOff()));

  // HiddenParams  
  Map hiddenParams = new HashMap();
  {
    hiddenParams.put("id",    Util.addAll(getStringParameterValues("id", HttpUtil.DATAID_REGEX),     new TreeSet()));
    hiddenParams.put("portal",Util.addAll(getStringParameterValues("portal", HttpUtil.DATAID_REGEX), new TreeSet()));
    hiddenParams.put("wrkspc",Util.addAll(getStringParameterValues("wrkspc", HttpUtil.DATAID_REGEX), new TreeSet()));
  }

  request.setAttribute("dstTypesOff",           typeList);
  request.setAttribute("dstReplaceFileDoc",     "false");
  request.setAttribute("dstShowEmptyType",      "false");
  request.setAttribute("dstShowAbstractType",   "false");

  ServletUtil.backupAttribute(pageContext , "adSearchTitle");            
  ServletUtil.backupAttribute(pageContext , "actionUrl");             
  ServletUtil.backupAttribute(pageContext , "formCssClass");             
  ServletUtil.backupAttribute(pageContext , "exactCatChecked");          
  ServletUtil.backupAttribute(pageContext , "catModeAnd");         
  ServletUtil.backupAttribute(pageContext , "catWidgetDisableSelectable");
  ServletUtil.backupAttribute(pageContext , "catWidgetSelectedSet");
  ServletUtil.backupAttribute(pageContext , "catHighlightCatSet");
  ServletUtil.backupAttribute(pageContext , "hiddenParams");
  
  request.setAttribute("adSearchTitle",               adSearchTitle);
  request.setAttribute("actionUrl",                   actionUrl);
  request.setAttribute("formCssClass",                formCssClass); 
  request.setAttribute("exactCatChecked",             Boolean.valueOf(exactCatChecked));
  request.setAttribute("catModeAnd",                  Boolean.valueOf(catModeAnd));
  request.setAttribute("catWidgetDisableSelectable",  Boolean.valueOf(catWidgetDisableSelectable));
  request.setAttribute("catWidgetSelectedSet", catWidgetSelectedSet);
  request.setAttribute("catHighlightCatSet", catHighlightCatSet);
  request.setAttribute("hiddenParams", hiddenParams);
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
%>
<%@ include file='/jcore/doFooter.jspf' %>
