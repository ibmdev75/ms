  <%@ include file='/jcore/doInitPage.jspf'                                   %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf'                       %><% 
%><%@ include file='/types/PortletSelection/doSelection.jspf'                %><%
 
%><% 
  PortletSelection box = (PortletSelection) portlet;
  if (Util.isEmpty(box.getChildren()) && !isPortletMode) {
    request.setAttribute("ShowPortalElement" , Boolean.FALSE);
    return;
  }
%><%

%><% ServletUtil.backupAttribute(pageContext , "ShowChildPortalElement");    %><%
%><%@ include file='/types/AbstractCollection/doIncludePortletCollection.jspf'%><%
%><% ServletUtil.restoreAttribute(pageContext , "ShowChildPortalElement");   %>

<table class='layout dashboard'>
<%
  // Clear buffer
  for(Iterator it = bufferList.iterator(); it.hasNext();) {
	  if (Util.isEmpty(it.next())) { it.remove(); }
	}
	
	// Cast to Array
  String[] buffers = (String[]) bufferList.toArray(new String[0]);
  
  // Split to rectangular table
  int count = buffers.length;
  int cols  = (int) Math.round(Math.sqrt(count+1)); // Works up to 10
  for (int i = 0 ; i < count || i%cols != 0; i++) {
  
%><% if (i%cols == 0) { %><tr><% } %>
  <td valign='top' width='<%= Math.round(100/cols) %>%'><%= Util.getString(buffers,i,"").trim() %></td>
<% if ((i+1)%cols == 0) { %></tr><% } %>
<% } %>
</table>