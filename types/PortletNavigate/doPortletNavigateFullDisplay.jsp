<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ include file='/types/PortletNavigate/doInitPortletNavigate.jspf' %>

<%
Set navigateSet = new TreeSet(Category.getOrderComparator(userLang));
navigateSet.addAll(rootCategory.getChildrenSet());

if (Util.isEmpty(navigateSet) && box.getHideWhenNoResults()){
	request.setAttribute("ShowPortalElement",Boolean.FALSE);
  return;
}

String nofollow = box.getNavigatePortlet() ? "" : "rel='nofollow'";
%>
<jalios:if predicate='<%= Util.notEmpty(navigateSet) %>'>
  <%--
  <div class="btn-toolbar">
  <jalios:foreach collection='<%= navigateSet %>' type="Category" name="itCategory">
    <jalios:if predicate='<%= itCategory.canBeReadBy(loggedMember , true, true) %>'>
      <a class="btn btn-default" <%= nofollow %> href='<%= PortalManager.getUrlWithUpdateCtxCategories(itCategory , ctxCategories, request , !box.getNavigatePortlet()) %>'><%= itCategory.getName(userLang) %></a>
    </jalios:if>
  </jalios:foreach>
  </div>
  --%>
  <ul class="nav nav-pills">
    <jalios:foreach collection='<%= navigateSet %>' type="Category" name="itCategory">
      <jalios:if predicate='<%= itCategory.canBeReadBy(loggedMember , true, true) %>'>
        <li><a <%= nofollow %> href='<%= PortalManager.getUrlWithUpdateCtxCategories(itCategory , ctxCategories, request , !box.getNavigatePortlet()) %>'><%= itCategory.getName(userLang) %></a></li>
      </jalios:if>
    </jalios:foreach>
  </ul>
</jalios:if>