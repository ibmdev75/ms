<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% PortletIFrame box = (PortletIFrame) portlet;  %>

<%
	String iframe = box.getSource(userLang);

	// To prevent XSS and phishing attack : Do not allow iframe from request parameter.
	// If you need to enable this feature, make sure to check the parameter retrieved
  // against expected value 
  // iframe = Util.getString(getValidHttpUrl("iframe"),iframe);

	if (Util.isEmpty(iframe)){
		request.setAttribute("ShowPortalElement",Boolean.FALSE);
		return;
	}
%>

<iframe src="<%= iframe %>" width="<%= box.getFrameWidth() %>" height="<%= box.getFrameHeight() %>" frameborder="0">
  <a href="<%= iframe %>"><%= iframe %></a>
</iframe>
