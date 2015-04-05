<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% PortletPortalRedirect box = (PortletPortalRedirect) portlet;  
	if (Util.notEmpty(box.getRedirectURL(loggedMember))){
		request.setAttribute("redirect", box.getRedirectURL(loggedMember));
		return;
	}
%>
