<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  
  int boxStatus = Util.toInt(request.getAttribute("query.facets.categories"),0);
  if (boxStatus == 0){ return; }
  
  if (Util.isEmpty(channel.getSearchRootSet())){
    return;
  }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  QueryResultSet queryResultSet = (QueryResultSet) request.getAttribute("query.queryResultSet");
  
  boolean refine = "and".equals(qh.getCatMode()); // channel.getBooleanProperty("query.facets.refine.cids", true);
  
  
  Set<Category> rootSet = new TreeSet<Category>(Category.getNameComparator(userLang));
  rootSet.addAll(channel.getSearchRootSet());
  
  // Fill the set of retained categories
  Set<Category> retainedSet = new HashSet<Category>();
  if (refine && queryResultSet.getResultSize() > 0){
    Set<Publication> resultSet  = queryResultSet.getAsSortedSet();
    for (Publication itPub : resultSet){
      retainedSet.addAll(itPub.getCategorySet());
    }
    // Filter rootSet
    Set<Category> tmpSet = new HashSet<Category>();
    for (Iterator<Category> it = rootSet.iterator() ; it.hasNext() ; ){
      Category itRoot = it.next();
      for(Category itRetain : retainedSet){
        if (itRetain.hasAncestor(itRoot)){ 
          tmpSet.add(itRoot);
          break; 
        }
      }
    }
    rootSet.clear(); rootSet.addAll(tmpSet);
  }
  
  /* Add Collaborative Space Roots
  rootSet = new LinkedHashSet(rootSet);
  if (workspace != null && workspace.isCollaborativeSpace()){
    rootSet.add( ... );
  }*/
  
  Set<Category> usedCidSet = JcmsUtil.idCollectionToDataSet(qh.getAllCidSet(), Category.class);
%>
<jalios:foreach collection="<%= rootSet %>" name="rootCat" type="Category">
<%
  String icon   = Util.getString(rootCat.getIcon(), "category-tree");
  String suffix = "search_"+rootCat.getId();
  if (!rootCat.isLeaf()){
    
    // Open box with matching decendant
    if (boxStatus == 2) {
      if (Util.notEmpty(usedCidSet)) {
        for (Category itCat : usedCidSet) {
          if (!itCat.hasAncestor(rootCat)) {
            continue;
          }
          boxStatus = 1;
          break;
        }
      }
    }
%>
<jalios:accordion-panel title='<%= rootCat.getName(userLang) %>' picture="<%= icon %>" active="<%= boxStatus != 2 %>">
    
	  <jalios:treecatview 
	    prefix="<%= suffix %>"
	    input="cids" 
	    
	    opened="<%= (Collection)usedCidSet %>"
	    checked="<%= (Collection)usedCidSet %>"
	    highlighted="<%= (Collection)usedCidSet %>"
	    
	    collection="<%= rootCat.getChildrenSet() %>"
	    selectable="true" 
	    css="autocomplete"
	  />
    <%-- retainedCatSet='<%= retainedSet %>' --%>
    
</jalios:accordion-panel>
<% } %>
</jalios:foreach>