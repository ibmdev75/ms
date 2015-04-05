<%@ include file='/jcore/doInitPage.jspf' %>
<% 

// Clean the query string (to be more cut&paste friendly)
com.jalios.jcms.handler.QueryHandler qh = new com.jalios.jcms.handler.QueryHandler(ServletUtil.getQueryString(request, false));
qh.setSort(null);
qh.setCatName(false);
qh.setDateType(null);
qh.setReplaceFileDoc(false);
qh.setSearchedFields(null);
if (qh.getBeginDay() < 1) {
  qh.setBeginYear(-1);
}
if (qh.getEndDay() < 1) {
  qh.setEndYear(-1);
}

sendRedirect("admin/exportXml.jsp?" + qh.getQueryString() ); 
%>
