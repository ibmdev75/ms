<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
PortletRow box = (PortletRow) portlet;
boolean isPortletToolbar = isPortletMode && loggedMember.canWorkOn(box);
if (isPortletToolbar) { %>
<jsp:include page="/types/PortletRow/doPortletRowFullDisplay.jsp"/>
<% } else {
ServletUtil.backupAttribute(pageContext, "ShowChildPortalElement");
ServletUtil.backupAttribute(pageContext, "RowToolbar");
%><%@ include file='/types/AbstractCollection/doIncludePortletCollection.jspf'%><%
ServletUtil.restoreAttribute(pageContext, "RowToolbar");
ServletUtil.restoreAttribute(pageContext, "ShowChildPortalElement");
int childrenCount = Util.getSize(box.getChildren());

String defaultCols = "";
if (childrenCount == 1) {
  defaultCols = "col-xs-12";
} 
else if (childrenCount == 2) {
  defaultCols = "col-xs-12 col-sm-6";
}
else if (childrenCount == 3) {
  defaultCols = "col-xs-12 col-sm-6 col-md-4";
}
else {
  defaultCols = "col-xs-12 col-sm-6 col-md-4 col-lg-" + (int)(12/childrenCount);
}

%>

<div class="row">

<% 
  for (int i = 0 ; i < childrenCount ; i++){
    PortalElement child = box.getChildren()[i];
    
    if (child != null && Util.isEmpty(bufferList.get(i))){ // cf. OJ: Skip row if a portlet is not displayed
      continue;
    }
    String cols = Util.getString(box.getCellWidth(), i,defaultCols);   
%><div class="<%= cols %>" ><%= bufferList.get(i) %></div>
<% } %>
</div>
<% } %>