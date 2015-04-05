<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/admin/doAdminHeader.jspf' %>

<div class="page-header"><h1>Session Manager</h1></div>

<table class='layout'>
  <tr> 
    <td class='listHeader'><div class="text-center">Key</div></td>
    <td class='listHeader'><div class="text-center">Value</div></td>
  </tr>
  <%
		int cpt = 0;
		for (Enumeration enu = request.getSession().getAttributeNames() ; enu.hasMoreElements(); cpt++) { String itAttribute = (String)  enu.nextElement(); 
	%>
  <tr> 
    <td><%= itAttribute %></td>
    <td><%= request.getSession().getAttribute(itAttribute) %></td>
  </tr>
  <% } %>
</table>
<br />
<%@ include file='/admin/doAdminFooter.jspf' %>