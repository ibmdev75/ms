<%@ include file='/jcore/doInitPage.jspf' %>
<%
request.setAttribute("title", glp("ui.adm.type-edit.lbl.cat-ch"));
request.setAttribute("zone", "InternalUI");

TreeSet<Category> selectedCatSet = getDataSetParameterValues("cids", Category.class);
if (Util.isEmpty(selectedCatSet)) {
  selectedCatSet = new TreeSet<Category>(getDataListParameter("cidList", Category.class));
}

Workspace filterWS = getDataParameter("ws", Workspace.class);
boolean showOtherCategories = false;
Set<Category> wsCategorySet = null;
if (filterWS != null) {
  showOtherCategories = true;
  wsCategorySet = filterWS.getCatSet();
  if (wsCategorySet == null || Util.getFirst(wsCategorySet) == channel.getRootCategory()) {
    wsCategorySet = channel.getRootCategory().getChildrenSet();
    showOtherCategories = false;
  }
}

CategoryTreeSettings categorySettingsWS = new CategoryTreeSettings().root(channel.getRootCategory());
CategoryTreeSettings categorySettingsOther = null;

if ("POST".equals(request.getMethod()) && hasParameter("opSelect")) {
  %><jalios:javascript><%
    List<String> selectedCatIdList = new ArrayList<String>();
    List<String> selectedCatNameList = new ArrayList<String>();
    if (Util.notEmpty(selectedCatSet)) {
     for (Category category : selectedCatSet) {
       selectedCatIdList.add(encodeForJavaScript(category.getId()));
       selectedCatNameList.add(encodeForJavaScript(category.getName(userLang)));
     } 
    }
    %>Popup.callback('<%= Util.join(selectedCatIdList, " ") %>', '<%= Util.join(selectedCatNameList, ", ", 3, "...") %>'); window.close();<% // code of label joining is the same as doInitControl.jspf
  %></jalios:javascript><%
} else {
  String[] rootCategoryIds = getStringParameterValues("rootCids", HttpUtil.DATAID_REGEX);
  
  String filterParam = getStringEnumParameter("filter", "", EnumUtils.toStringArray(CategoryFilter.class));
  CategoryFilter categoryFilter = Util.notEmpty(filterParam) ? CategoryFilter.valueOf(filterParam) : null;

  boolean isRootCat = Util.isEmpty(rootCategoryIds) || Util.isSameContent(rootCategoryIds, new String[] {channel.getRootCategory().getId()});
  if (isRootCat) {
    categorySettingsWS.root(wsCategorySet).filter(categoryFilter);
  } else {
    categorySettingsWS.root(rootCategoryIds).filter(categoryFilter);
    showOtherCategories = false;
  }
  
      
  if (showOtherCategories) {
    categorySettingsOther = new CategoryTreeSettings().root(channel.getRootCategory().getChildrenSet()).removed(wsCategorySet).filter(categoryFilter);
  }

  boolean multiple = getBooleanParameter("multivalue", false);
  if(multiple) {
    categorySettingsWS.multiple();
    if (categorySettingsOther != null) {
      categorySettingsOther.multiple();
    }
  }
  
  boolean selectable = getBooleanParameter("selectable", false);
  if(!selectable) {
    categorySettingsWS.uncheckSelectable();
    if (categorySettingsOther != null) {
      categorySettingsOther.uncheckSelectable();
    }
  } 
}


%>
<%@ include file='/jcore/doEmptyHeader.jspf' %>
<form name="editForm" action="work/categoryChooser.jsp" method="POST">

    <jalios:field name="cids" label='<%= showOtherCategories ? "ui.work.form.lbl.ws-cat" : "" %>' value="<%= selectedCatSet %>" resource="field-vertical">
      <jalios:control settings='<%= categorySettingsWS %>' />
    </jalios:field>
    
    <% if (showOtherCategories) { %>
    <jalios:field name="cids" label="ui.work.form.lbl.other-cat" value="<%= selectedCatSet %>" resource="field-vertical">
      <jalios:control settings='<%= categorySettingsOther %>' />
    </jalios:field>      
    <% } %>


  <div class="navbar navbar-default navbar-fixed-bottom">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" name="opSelect" value="true" class='btn btn-primary navbar-btn'><%= glp("ui.work.query-ch.btn.select")%></button>
      </div>
    </div>
  </div>
</form>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
