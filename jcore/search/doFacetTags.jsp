<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  
  int boxStatus = Util.toInt(request.getAttribute("query.facets.tags"),0);
  if (boxStatus == 0){ return; }
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");  
  Set<Category> usedCidSet = JcmsUtil.idCollectionToDataSet(qh.getAllCidSet(), Category.class);
 
  Category rootCat = channel.getTagRoot(workspace);  
  if (rootCat == null || rootCat.isLeaf()){
    return;
  }
  
  String   icon    = Util.getString(rootCat.getIcon(), "tag");
  String   suffix  = "search_"+rootCat.getId();
  
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
<jalios:accordion-panel title="<%= rootCat.getName(userLang) %>" picture="<%= icon %>" active="<%= boxStatus != 2 %>">
  <jalios:field name='cids' value='<%= usedCidSet %>' keyword='true'>
    <jalios:control settings="<%= new CategorySettings().root(rootCat).filter(CategoryFilter.READ) %>"  />
  </jalios:field>
</jalios:accordion-panel>