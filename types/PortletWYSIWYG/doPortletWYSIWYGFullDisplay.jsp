<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% PortletWYSIWYG box = (PortletWYSIWYG) portlet;  %>

<jalios:if predicate='<%= Util.notEmpty(box.getWysiwyg(userLang)) %>'>
	<jalios:wysiwyg><%= box.getWysiwyg(userLang) %></jalios:wysiwyg>
</jalios:if>