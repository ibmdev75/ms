<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ page import='com.jalios.jcms.handler.*' %><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.EditNotificationCriteriaHandler'><%--
--%><jsp:setProperty name='formHandler' property='request' value='<%=request%>' /><%--
--%><jsp:setProperty name='formHandler' property='response' value='<%=response%>' /><%--
--%><jsp:setProperty name='formHandler' property='*' /><%--
--%></jsp:useBean><%--
--%><% if (formHandler.validate()) { %>
<%   if (formHandler.isAjaxRequest()) { %>
<% request.setAttribute("modal.redirect", formHandler.getRedirect());  %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<%   } else { %>
<% sendRedirect(formHandler.getRedirect()); %>
<% } %>
<% } %>
<%
int step = formHandler.getFormStep();
int stepCount = formHandler.getFormStepCount();
jcmsContext.addCSSHeader("css/jalios/ux/jalios-notification.css");
%>
<jalios:modal css="editNotificationCriteria modal-lg" formHandler="<%= formHandler %>"  title="ui.work.notification.edit-criteria.title" picture="images/jalios/icons/notification32.png" url="jcore/notification/editNotificationCriteria.jsp">
	<%@ include file='/jcore/notification/editNotificationCriteria_criteria.jspf' %>
	<%@ include file='/jcore/notification/editNotificationCriteria_types.jspf' %>
</jalios:modal>
  