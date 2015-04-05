<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% AbstractPortal abstractPortal = (AbstractPortal) portlet;  %>

<jalios:if predicate='<%= abstractPortal.getChild() != null %>'>
	<%  displayPortlet = (PortalElement) abstractPortal.getChild(); %>
	<%@ include file='/jcore/portal/doIncludePortlet.jspf' %>
</jalios:if>