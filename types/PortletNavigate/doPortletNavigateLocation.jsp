<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ include file='/types/PortletNavigate/doInitPortletNavigate.jspf' %>

<%
List<Category> ancestors  = currentCategory.getAncestorList();
	
for (Iterator<Category> it = rootCategory.getAncestorList().iterator() ; it.hasNext() ;) {
  ancestors.remove(it.next());
}

if (Util.isEmpty(ancestors) && box.getHideWhenNoResults()) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
  return;
}

Collections.reverse(ancestors);

ancestors.add(currentCategory);
	
String nofollow = box.getNavigatePortlet() ? "" : "rel='nofollow'";

int counter = 0;
%>

<ol class="breadcrumb">
<jalios:foreach collection="<%= ancestors %>" type="Category" name="itCategory">
  <% if((itCategory.hasAncestor(rootCategory) || itCategory.equals(rootCategory)) && (counter < box.getLevels())) { %>
    <li><a <%= nofollow %> href='<%= PortalManager.getUrlWithUpdateCtxCategories(itCategory , ctxCategories, request , !box.getNavigatePortlet()) %>'><%= itCategory.getName(userLang) %></a></li>
    <% counter++; %>
  <% } %>
</jalios:foreach>
</ol>

<% 
if (counter == 0) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
}
%>
