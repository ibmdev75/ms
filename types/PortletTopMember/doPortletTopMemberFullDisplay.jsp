<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% PortletTopMember box = (PortletTopMember) portlet;  %>
<table class='layout'>
	<tr>
		<td colspan="4" class='Title text-center'>
			<strong><% /* %>Member Top-X<% */ %><%= box.getTitleText(userLang) %></strong>
			<jalios:if predicate="<%= jcmsContext.isEditIcon() %>">
				<a href='<%= ServletUtil.getUrlWithUpdatedParam(request, "topMemberRefresh", "true") %>' class='editArea <%= jcmsContext.showEditIcon() ? "" : "hidden" %>'><jalios:icon src="refresh" alt='<%= "Force refresh." %>' /></a>
			</jalios:if>
		</td>
	</tr>
	<jalios:topmember max='<%=  channel.getDataSet(Member.class).size() < box.getMaxResults() ? channel.getDataSet(Member.class).size() :  box.getMaxResults() %>' ufreq="60">
	<tr class='Link'>
		<td width="1%"><% /* %>1<% */ %><%= itCounter %>.</td>
		<td><a href="<%= ResourceHelper.getQuery() %>?mids=<%= itMember.getId() %>" class='Link'><strong><% /* %>Member's name<% */ %><%= itMember.getFullName() %></strong></a></td>
		<td width="1%"><% /* %>10<% */ %><%= itMemberCount %></td>
		<td width="1%">
			<jalios:select>
				<jalios:if predicate='<%=(itMemberTrends.intValue() > 0)%>'><jalios:icon src="arrowup" /></jalios:if>
        <jalios:if predicate='<%=(itMemberTrends.intValue() < 0)%>'><jalios:icon src="arrowdown" /></jalios:if>
			  <jalios:default>&nbsp;</jalios:default>
			</jalios:select>
		</td>
	</tr>
	</jalios:topmember>
</table>
