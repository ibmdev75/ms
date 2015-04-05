<%-- 
  @Deprecated: False
  @Customizable: False
  @Summary: Caddy, redirect to appropriate caddy
--%>
<%@ include file='/jcore/doInitPage.jspf' %> 
<%
  Caddy caddy = Caddy.getCaddy(request); 
  String dataType = "publication";
  if (caddy.getPublicationListSize() > 0) {
    dataType = "publication";
  } else if (caddy.getCategoryListSize() > 0) {
    dataType = "category";
  } else if (caddy.getWorkspaceListSize() > 0) {
    dataType = "workspace";
  } else if (caddy.getGroupListSize() > 0) {
    dataType = "group";
  } else if (caddy.getMemberListSize() > 0) {
    dataType = "member";
  } else if (caddy.getDBMemberListSize() > 0) {
    dataType = "dbmember";
  }
  sendRedirect("work/caddy/" + dataType + "CaddyManager.jsp", request, response);
  
%>