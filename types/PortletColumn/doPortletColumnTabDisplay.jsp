<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
  
PortletColumn box = (PortletColumn) portlet;
if (Util.isEmpty(box.getChildren())) {
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
  return;
}

boolean isActive = false;
boolean isPortletToolbar = isPortletMode && loggedMember.canWorkOn(box);
String dndDIV = "id='"+box.getId()+"' class='nav nav-tabs dnd-container ID_"+box.getId()+" nobr' role='tablist'";
PortalElement tabElm = (PortalElement) channel.getData(PortalManager.receiveAction(request, box, "tabId"));

// Initialise Drag and Drop
// No DnD requires DIV instead of UL/LI
%>
<ul <%= dndDIV %>>
  <% PortalElement[] portlets = box.getChildren();
  int childrenCount = Util.getSize(portlets);
  for (int i = 0; i < childrenCount; i++) {
    PortalElement itChild = portlets[i];
    if (itChild == null) { continue; }
    if (tabElm == null) { tabElm = itChild; }
    if (tabElm == itChild) { isActive = true; }

    String childClasses = isPortletToolbar ? "ID_" + itChild.getId() : "";
    childClasses += tabElm == itChild ? " active" : "";
    childClasses = childClasses.trim();
    %>
    <li <%= Util.notEmpty(childClasses) ? "class=\""+childClasses+"\"" : "" %>>
      <a href="<%= PortalManager.sendAction(request, box, "tabId", itChild.getId()) %>" class="ajax-refresh"><%= itChild.getContentTitle(userLang) %></a>
    </li>
  <% } %>
</ul>
<% if (isActive && tabElm != null) { %>
<div class="tab-content">
  <div class="tab-pane active">
    <% displayPortlet = tabElm; request.setAttribute("ShowChildPortalElement",Boolean.TRUE); %>
    <%@ include file='/jcore/portal/doIncludePortlet.jspf' %>
  </div>
</div>
<% } %>
<% ServletUtil.restoreAttribute(pageContext , "ShowChildPortalElement"); %>