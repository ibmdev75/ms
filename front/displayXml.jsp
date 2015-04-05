<%@ include file='/jcore/doInitPage.jspf' %><%

  Data data = getDataParameter("id");
  sendRedirect("admin/exportXml.jsp?" + (data != null ? ("id=" + data.getId()) : "") );
%>
