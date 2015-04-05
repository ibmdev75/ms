<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<%@ include file='/types/PortletNavigate/doInitPortletNavigate.jspf' %>

<%
	if ((rootCategory == null) && box.getHideWhenNoResults()){
		request.setAttribute("ShowPortalElement",Boolean.FALSE);
    return;
	}
%>

<table class='layout SubNavigate'>
<jalios:categories root="<%= rootCategory.getId() %>" visiteroot="true" >
	<tr class='Level<%=itLevel.intValue()%>'>
		<td <%= (currentCategory == itCategory) ? "class='Selected'" : "" %> width='100%' nowrap="nowrap">
			<% for(int i = 0 ; i < itLevel.intValue() ; i++){ out.println("&nbsp;"); } %>
			<jalios:if predicate='<%= itCategory.isSelectable() %>'>
       <jalios:link data='<%= itCategory %>'><%= itLevel.intValue() > 0 ? "-" : "" %> <%= itCategory.getName() %></jalios:link>
      </jalios:if>
		</td>
	</tr>
</jalios:categories>
</table>
