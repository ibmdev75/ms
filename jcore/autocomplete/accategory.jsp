<%@ page import="java.util.regex.Pattern" %><%
  request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file="/jcore/doInitPage.jspf" %><%

  String autocomplete = getUntrustedStringParameter("autocomplete",""); // ENCODE !!
  if (Util.notEmpty(autocomplete) && autocomplete.startsWith("#")){
    autocomplete = autocomplete.substring(1);
  }
  
  autocomplete = JcmsUtil.escapeHtml(autocomplete);
  
  String filterParam = getStringEnumParameter("filter", "", EnumUtils.toStringArray(CategoryFilter.class));
  CategoryFilter filter = Util.notEmpty(filterParam) ? CategoryFilter.valueOf(filterParam) : null;
  boolean selectable = getBooleanParameter("selectable", true);
  Set<Category> parentSet = getDataSetParameterValues("rootCids", Category.class);
  Set<Category> removeSet = getDataSetParameterValues("rm", Category.class);
  Category ancestor = channel.getRootCategory();
  boolean add = getBooleanParameter("acadd", true);
  boolean opAdd = getBooleanParameter("opAdd", false);
  int skip = getIntParameter("skip", 0);
	
  Collection<Category> resultCollection = new TreeSet(Category.getNameComparator(userLang));
  if (Util.notEmpty(parentSet)) {
    for (Category cat : parentSet) {
      resultCollection.addAll(cat.getDescendantSet());
      resultCollection.add(cat);
      if (parentSet.size() == 1) {
        ancestor = cat;
      } else {
        ancestor = cat.getParent();
      }
    }
  }
  
  Set tmpSet = new HashSet();
  if (Util.notEmpty(removeSet)) {
    for (Iterator it = removeSet.iterator(); it.hasNext(); ) {
      Category itCategory = (Category) it.next();
      tmpSet.add(itCategory);
      tmpSet.addAll(itCategory.getDescendantSet());
    }
  }
  removeSet = tmpSet;
  
  // Handle live creation of categories 
  boolean canAdd = add && isLogged && loggedMember.canManageCategory(ancestor);
  
  Category itCat = new Category();
  itCat.setName(autocomplete);
  itCat.setParent(ancestor);
  itCat.setAuthor(loggedMember);

  ControllerStatus cs = itCat.checkCreate(loggedMember);
  boolean checkCreate = cs.isOK();
  
  if (canAdd && opAdd) {
    if (!checkCreate) {
      itCat = null;
      logger.warn("ERROR: "+cs.getMessage(userLang));
    } else {
      itCat.performCreate(loggedMember);
      resultCollection.add(itCat);
    }
  }
  
  String tmpPattern = autocomplete.replaceAll("\\(","\\\\(").replaceAll("\\)","\\\\)");
  String pattern = "s#("+Pattern.quote(tmpPattern)+")#<span class='match'>$1</span>#gi";
  DataSelector selector = new Category.NameSelector(autocomplete, userLang, true /* JCMS-3337 */);
  
  request.setAttribute("ACSelector", selector);
  request.setAttribute("ACResultCollection", resultCollection);
  int proposedResults = channel.getIntegerProperty("autocomplete.proposedresults.category", 
                        channel.getIntegerProperty("autocomplete.proposedresults", 
                        5));
  request.setAttribute("ACProposedResult", new Integer(proposedResults));
%>
<jalios:include target="AC_CATEGORY" targetContext="empty"/>
<%
  proposedResults = ((Integer) request.getAttribute("ACProposedResult")).intValue();
  selector = (DataSelector) request.getAttribute("ACSelector");
  resultCollection = (Collection) request.getAttribute("ACResultCollection");
  String prefix = glp("ui.com.lbl.under-path");
  int more = skip + proposedResults;
  
  // Build acurl
  String acurl = "jcore/autocomplete/accategory.jsp?autocomplete=" + encodeForURL(autocomplete);
  acurl += "&filter=" + filterParam + "&selectable=" + selectable + "&acadd=" + add;
  if (Util.notEmpty(parentSet)){ acurl += "&rootCids="+JcmsUtil.dataListToString(parentSet,"&rootCids="); }
  if (Util.notEmpty(removeSet)){ acurl += "&rm="+JcmsUtil.dataListToString(removeSet,"&rm="); }
  acurl += "&skip=";
  
%><ul class="dropdown-menu"><%
  if (skip > 0){ out.println("<li class='info results'><a href='#'>"+glp("ui.com.lbl.count-result",skip,(skip+proposedResults))+"</a></li>"); }
  if (skip > 0){ out.println("<li class='ajax-refresh previous'><a href='"+acurl+(skip - proposedResults)+"'>"+glp("ui.com.lbl.prev-result")+"</a></li>"); }
  
  int i = proposedResults; boolean match = false; boolean first = true;
  Iterator<Category> it = null;
  for(it = resultCollection.iterator(); it.hasNext() && i > 0;){
    Category itCategory = it.next();
    
    if (!selector.isSelected(itCategory)) { continue; }
    if (selectable && !itCategory.isSelectable()) { continue; }
    if (CategoryFilter.isFiltered(itCategory, loggedMember, filter)) { continue; }
    // if (!filter && !itCategory.canBeReadBy(loggedMember)){ continue; }
    // if ( filter && (loggedMember == null || !loggedMember.canUseCategory(itCategory))){ continue; }
    if (removeSet.contains(itCategory)) { continue; }
    if (skip > 0) { skip--; continue; }
    if (itCategory.getParent() == ancestor && itCategory.getName(userLang).equalsIgnoreCase(autocomplete)) { canAdd = false; }
    String ancestorStr = itCategory.getAncestorString(ancestor, " > ", false, userLang);
    String path  = Util.isEmpty(ancestorStr) ?  "" : "<br/><span class='meta-text info'>"+prefix+" "+encodeForHTML(ancestorStr)+"</span>";
    String cat   = Util.replace(encodeForHTML(itCategory.getName(userLang)), pattern);
    String clazz  = first ? "active " : "";
           clazz += (itCategory == itCat) ?  "select " : "";
           clazz  = Util.notEmpty(clazz)  ?  "class='"+clazz+"'" : "";
    
    match = true;
  %><li <%= clazz %> data-value='<%= itCategory.getId() %>' data-placeholder="<%= encodeForHTMLAttribute(itCategory.getName(userLang), true) %>"><a href="#"><%= cat %><%= path %></a></li>
  <% i--; first = false; } if (!match && !canAdd) { out.println("<li class='nomatch'><a href='#'>"+glp("ui.com.lbl.no-result")+"</a></li>"); } 
       else if (i == 0 && it.hasNext()) { out.println("<li class='ajax-refresh next'><a href='"+acurl+more+"'>"+glp("ui.com.lbl.next-result")+"</a></li>"); }
            if (canAdd && checkCreate) { out.println("<li class='ajax-refresh add'><a href='"+acurl+"&opAdd=true'>"+glp("ui.work.cat.lbl.add-asub-cat",encodeForHTML(autocomplete))+"</a></li>"); }
  %></ul>