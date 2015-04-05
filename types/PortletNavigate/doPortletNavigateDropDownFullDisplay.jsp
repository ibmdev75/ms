<%@page import="com.jalios.jcms.taglib.menu.MenuInfo"%>
<%@page import="com.jalios.jcms.taglib.menu.MenuInfoFilter"%>
<%@page import="com.jalios.jcms.portlet.navigate.CategoryMenuInfo"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ include file='/types/PortletNavigate/doInitPortletNavigate.jspf' %>
<%
boolean display = rootCategory != null && rootCategory.isNode(loggedMember);
if (display && box.getHideWhenNoResults()) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}

int dropDownCounter = Util.toInt(Util.getString(request.getAttribute("dropDownCounter"), ""), 0); 
request.setAttribute("dropDownCounter", "" + (dropDownCounter + 1));

int maxDepthLevel = box.getLevels() - 1;
%>
<div class="dropDownMenu">
  <jalios:menu name='<%= "dropdown-" + dropDownCounter %>' maxDepthLevel="<%= maxDepthLevel %>">
    <%
    MenuInfoFilter<Category> menuInfoFilter = (MenuInfoFilter<Category>) request.getAttribute(MenuInfoFilter.MENU_INFO_FILTER_ATTR);
    MenuInfo<Category> menuInfo = new CategoryMenuInfo(rootCategory, ctxCategories, box.getNavigatePortlet(), maxDepthLevel, -1, null, menuInfoFilter, userLang, loggedMember, request);
    request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
    for (MenuInfo<Category> child : menuInfo.getChildren()) {
      if (child.isTreeNode() && Util.notEmpty(child.getChildren())) {
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, child);
        %><jalios:include jsp="jcore/menu/doIterateSubMenu.jsp" /><%
        request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
      } else {
        %><jalios:menuitem id="<%= child.getId() %>" label="<%= child.getLabel() %>" link="<%= child.getLink() %>" active="<%= child.isActive() %>" parentId="<%= child.getParent() != null ? child.getParent().getId() : null %>" htmlAttributes="<%= child.getHtmlAttributes() %>" /><%
      }
    }
    %>
  </jalios:menu>
</div>