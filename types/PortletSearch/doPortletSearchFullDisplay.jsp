<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% PortletSearch box = (PortletSearch) portlet;  %><%
%><%
  String searchDisplayId = box.getDisplayPortal() != null ? 
                                      box.getDisplayPortal().getId() : 
                                      currentCategory.getId();
  request.setAttribute("searchMode",            box.getSearchWith());
  request.setAttribute("catName",               Util.arrayContains(box.getSearchIn(), "catName") ? Boolean.TRUE: Boolean.FALSE);
  request.setAttribute("searchInFiles",         Util.arrayContains(box.getSearchIn(), "searchInFiles") ? Boolean.TRUE: Boolean.FALSE);
  request.setAttribute("searchInMembers",      Util.arrayContains(box.getSearchIn(), "searchInMembers") ? Boolean.TRUE: Boolean.FALSE);

%><%@ include file='doQueryHandler.jsp' %><%

  String adSearchTitle          = Util.getString(box.getTitleText(userLang),glp("ui.work.search.txt.title"));
  String actionUrl              = box.getQueryPortlet() != null ? JcmsUtil.getDisplayUrl() : ResourceHelper.getQuery();
  String formCssClass           = null; 

  boolean exactCatChecked       = Util.notEmpty(formHandler) && formHandler.getExactCat();
  boolean catModeAnd            = Util.isEmpty(formHandler) || !"or".equals(formHandler.getCatMode());  
  boolean catWidgetDisableSelectable    = false;
  Set catWidgetSelectedSet           = formHandler == null ? null : formHandler.getCategorySet("cids");
  Set catHighlightCatSet             = formHandler == null ? null : formHandler.getCategorySet("cids");

  if (formHandler != null)  {
       request.setAttribute("dsdDateType",   formHandler.getDateType()); 
       request.setAttribute("dsdDateSince",  "" + formHandler.getDateSinceInt()); 
       Date[] beginAndEndDates = formHandler.getBeginAndEndDates();           
       request.setAttribute("dsdBeginDate",  beginAndEndDates[0]); 
       request.setAttribute("dsdEndDate",    beginAndEndDates[1]); 
  }

  List typeList = Arrays.asList(channel.getClass(channel.getDefaultQueryTypesOff()));
  request.setAttribute("dstTypesOff", typeList);
  if (formHandler != null)  {
    request.setAttribute("dstReplaceFileDoc",  "" + formHandler.getReplaceFileDoc());
    request.setAttribute("dstExactType",  "" + formHandler.getExactType());
    request.setAttribute("dstClassSet", formHandler.getClassSet()); 
  }

  if (formHandler != null)  {
    request.setAttribute("dsgGroupSet", channel.getDataSet(formHandler.getGids())); 
    if (Util.notEmpty(formHandler.getMids())) {
      request.setAttribute("dsgMember", channel.getMember(formHandler.getMids()[0])); 
    }
  }

  if (formHandler != null) {
    request.setAttribute("dslLangs", formHandler.getUnresolvedLangs());
  }
  
  // HiddenParams  
  Map hiddenParams = new HashMap();
  {
    // cids
	  Set cidsSet = new TreeSet();
	  if ("Current".equals(box.getRefineQueries())) {
	    cidsSet.add(currentCategory.getId());
	  }
	  if ("Portal".equals(box.getRefineQueries())) {
	    cidsSet.add(portalCategory.getId());
	  }
	  if ("CurrentWS".equals(box.getRefineQueries())) {
	    hiddenParams.put("wrkspc", workspace.getId());
	  }
	  hiddenParams.put("cids", cidsSet);
	  if (box.getQueryPortlet() != null) {
      hiddenParams.put("portlet", 
                       Util.addAll(new String[]{box.getQueryPortlet().getId()},   new TreeSet()));
      hiddenParams.put(PortalManager.getActionParam(box.getQueryPortlet(),"DynamicQuery"), 
                       Util.addAll(new String[]{"true"},                          new TreeSet()));
      hiddenParams.put("id",    Util.addAll(getStringParameterValues("id", HttpUtil.DATAID_REGEX),     new TreeSet()));
      hiddenParams.put("portal",Util.addAll(getStringParameterValues("portal", HttpUtil.DATAID_REGEX), new TreeSet()));
      hiddenParams.put("cid",   Util.addAll(getStringParameterValues("cid", HttpUtil.DATAID_REGEX),    new TreeSet()));
	  } else {
      Set idSet = new TreeSet();
      idSet.add(searchDisplayId);
      hiddenParams.put("id", idSet);
	  }
  }
  
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
  request.setAttribute("catWidgetSelectedSet",        catWidgetSelectedSet);
  request.setAttribute("catHighlightCatSet",          catHighlightCatSet);
  request.setAttribute("hiddenParams",                hiddenParams);
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