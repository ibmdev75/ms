<%--
  
  @Summary: This JSP can be used to test the output of the notification
            HTML mail that will be sent to the current user.
  @Category: Notification
  @Deprecated: False
  @Customizable: False
  @Requestable: True
  
--%><%
  // set the proper content type for doInitPage
  request.setAttribute("ContentType", "text/html; charset=UTF-8"); 

%><%@ include file="/work/notification.jsp" %><%
%><jsp:include page='<%= "/custom/jcms/doNotificationHtml.jsp" %>' flush="true" />