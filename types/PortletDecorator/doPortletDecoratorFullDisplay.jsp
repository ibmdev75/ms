
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% 
	PortletDecorator box = (PortletDecorator) portlet;  
	ServletUtil.backupAttribute(pageContext , "ShowChildPortalElement");
%>

<jalios:if predicate='<%= box.getChild() != null %>'>
	<% displayPortlet = box.getChild(); request.setAttribute("ShowChildPortalElement",Boolean.TRUE); %>
	<jalios:buffer name='collectionBuffer'><%@ include file='/jcore/portal/doIncludePortlet.jspf' %></jalios:buffer>
	<jalios:if predicate='<%= ((Boolean)request.getAttribute("ShowChildPortalElement")).booleanValue() %>'>
		<%= collectionBuffer %>
	</jalios:if>
</jalios:if>

<% ServletUtil.restoreAttribute(pageContext , "ShowChildPortalElement"); %>