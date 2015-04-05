<%
  response.setHeader("Content-Disposition", "attachment; filename=category.csv"); 
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/csv; charset=" + channel.getProperty("csv.charset"));
%><%@ include file='/jcore/doInitPage.jspf' %><%

if (!isLogged) {
  sendForbidden(request, response);
  return;
}

final Set catSet;
final boolean checkEachCategoryRight;

// 1. Categories in caddy
// => Check can manage on each category
if (hasParameter("caddy")) {
  catSet = new TreeSet(Caddy.getCaddy(request).getCategoryList());
  checkEachCategoryRight = true;
}
// 2. Descendant categories of a specified category
// => Check can manage on parent only
else if (hasParameter("cid")) {
  Category cat = getCategoryParameter("cid");
  if (!loggedMember.canManageCategory(cat)) {
    sendForbidden(request, response);
  }
  catSet = cat.getDescendantSet();
  checkEachCategoryRight = false;
}

// 3. All categories that can be managed by member
else {
  catSet = channel.getDataSet(Category.class);
  checkEachCategoryRight = true;
} 


// Check rights if required
if (checkEachCategoryRight) {
  JcmsUtil.applyDataSelector(catSet, new DataSelector() {
    public boolean isSelected(Data data) {
      Category cat = (Category ) data;
      return loggedMember.canManageCategory(cat);
    }
  });
}
 
JcmsUtil.exportCSV(catSet, userLang, out);
%>
