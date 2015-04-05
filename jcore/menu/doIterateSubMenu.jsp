<%@page import="com.jalios.jcms.taglib.menu.MenuInfo"%>
<%@ include file='/jcore/doInitPage.jspf' %>
<% MenuInfo<Object> menuInfo = (MenuInfo<Object>) request.getAttribute(MenuInfo.MENU_INFO_ATTR); %>
<jalios:submenu id="<%= menuInfo.getId() %>" label="<%= menuInfo.getLabel() %>" link="<%= menuInfo.getLink() %>" depthLevel="<%= menuInfo.getDepthLevel() %>" maxDepthLevel="<%= menuInfo.getMaxDepthLevel() %>" active="<%= menuInfo.isActive() %>" parentId="<%= menuInfo.getParent() != null ? menuInfo.getParent().getId() : null %>" htmlAttributes="<%= menuInfo.getHtmlAttributes() %>">
  <%
  for (MenuInfo<Object> child : menuInfo.getChildren()) {    
    if (child.isTreeNode()) {
      request.setAttribute(MenuInfo.MENU_INFO_ATTR, child);
      %><jalios:include jsp="jcore/menu/doIterateSubMenu.jsp" /><%
      request.setAttribute(MenuInfo.MENU_INFO_ATTR, menuInfo);
    } else {
      %><jalios:menuitem id="<%= child.getId() %>" label="<%= child.getLabel() %>" link="<%= child.getLink() %>" active="<%= child.isActive() %>" parentId="<%= child.getParent() != null ? child.getParent().getId() : null %>" htmlAttributes="<%= child.getHtmlAttributes() %>" /><%
    }
  }
  %>
</jalios:submenu>