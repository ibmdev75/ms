<%--
  @Summary: Copyright
  @Category: Admin / Presentation
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: False
  @Requestable: True
  @Deprecated: False
  @Since: jcms-5.0.0
--%><%
%><%@ include file="/jcore/doInitPage.jspf" %><% 

 request.setAttribute("title", channel.getName() + " - Copyright");
 Calendar cal = Calendar.getInstance();
 request.setAttribute("year", String.valueOf(cal.get(Calendar.YEAR))); 

%><%@ include file="/jcore/doEmptyHeader.jspf" %>
<jsp:include page='<%= "/admin/copyright_" + (userLang.equals("fr") ? "fr" : "en") + ".jsp" %>'/>
<%@ include file="/jcore/doEmptyFooter.jspf" %>