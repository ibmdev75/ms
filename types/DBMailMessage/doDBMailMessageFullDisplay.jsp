<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ page import="com.jalios.jcms.mail.*" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><% 
DBMailMessage obj = (DBMailMessage)request.getAttribute(PortalManager.PORTAL_PUBLICATION);
ServletUtil.backupAttribute(pageContext , PortalManager.PORTAL_PUBLICATION);

Collection thread = obj.getMailMessageThread();
if (Util.isEmpty(thread)){
  return;
}
// Remove non authorized E-mails (JCMS-3938)
thread.removeAll(JcmsUtil.select(thread, new ReverseDataSelector(Publication.getAuthorizedSelector(loggedMember)), null));

boolean isPrintView = jcmsContext.isPrintView();
DBMailMessage root = (DBMailMessage) thread.iterator().next();
%>
<div class="Mail_<%= obj.getId() %> mail-thread">
  <h1>
    <jalios:link data='<%= root %>'><% /* %>Title<% */ %><%= root.getTitle(userLang) %><span class='thread-count'><%= thread.size() > 1 ? " ("+thread.size()+")" : "" %></span></jalios:link>
  </h1>
    
  <% StringBuilder css = new StringBuilder(); %>
  <jalios:foreach collection="<%= thread %>" name="itMsg" type="com.jalios.jcms.mail.MailMessage"><%
    css.append(itCounter.intValue() == 1 ? " first" : "");              // First ?
    css.append(itCounter.intValue() == thread.size() ? " last" : "");   // Last ?
    css.append((isPrintView || itMsg == obj) ? " block-email" : "");    // Detailled ?
    request.setAttribute(PortalManager.PORTAL_PUBLICATION, itMsg);
    request.setAttribute("wrapper", css.toString());
    request.setAttribute("mailMessageTotalCount", thread.size());
    request.setAttribute("mailMessageCounter", itCounter);
    %><jsp:include page='/types/DBMailMessage/doDBMailMessageDisplay.jsp' flush="true" /><%
    css = new StringBuilder();
  %></jalios:foreach>
</div><% 
ServletUtil.restoreAttribute(pageContext , PortalManager.PORTAL_PUBLICATION); %>