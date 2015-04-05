<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

  PortletPortal box = (PortletPortal) portlet; 
  request.setAttribute("printView", "true"); 
  request.setAttribute(com.jalios.jcms.analytics.AnalyticsManager.PRINT_VIEW, "true");  
  request.setAttribute("title" , Util.getString(box.getPageTitle(userLang), box.getTitle(userLang)));
  jcmsContext.addCSSHeader(box.getCssFile());
  
  boolean displayPrintWindow = channel.getBooleanProperty("channel.print.auto", true);
  if (displayPrintWindow) {
    jcmsContext.addJavaScriptCode("window.print();");
  }
%>
<div>
	<h1><a href="index.jsp"><%= channel.getName() %></a></h1> 
  
	<hr/>
	
	<jalios:if predicate='<%= box.getChild() != null %>'>
		<%  displayPortlet = (PortalElement) box.getChild(); %>
		<%@ include file='/jcore/portal/doIncludePortlet.jspf' %>
	</jalios:if>
	
</div>