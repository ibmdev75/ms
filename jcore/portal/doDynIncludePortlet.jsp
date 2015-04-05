<%@ include file='/jcore/doInitPage.jspf' %><%

 Object portlet = request.getAttribute("displayPortlet"); 

%><jalios:if predicate='<%= portlet != null && portlet instanceof PortalElement %>'><%

  displayPortlet = (PortalElement) portlet;
  %><%@ include file='/jcore/portal/doIncludePortlet.jspf' %><%

%></jalios:if>