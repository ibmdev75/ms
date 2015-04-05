<%@ include file='/jcore/doInitPage.jspf' %>
<% sendRedirect(ServletUtil.getBaseUrl(request) + ResourceHelper.getPrivateLogin() + "?redirect=admin/admin.jsp", request, response); %>
