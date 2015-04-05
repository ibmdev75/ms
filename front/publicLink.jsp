<%@page import="com.jalios.jcms.authentication.handlers.AuthKeyAuthenticationHandler"%>
<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%

FileDocument doc = getDataParameter("docId", FileDocument.class);
if (doc == null || !doc.canBeReadBy(loggedMember) || !channel.getBooleanProperty("channel.public-link.enabled", true)) {
  sendForbidden(request, response);
  return;
}

long duration = channel.getLongProperty("channel.public-link.duration", JcmsConstants.MILLIS_IN_ONE_WEEK);

String durationStr = DateUtil.formatDuration(duration, userLocale);

String docUrl = doc.getDisplayUrl(userLocale);
String urlWithAuthKey = AuthKeyAuthenticationHandler.getInstance().getUrlWithAddedAuthKeyParam(channel.getUrl() + doc.getFilename(), loggedMember, duration, false);

String mailSubject = ServletUtil.encodeURL(doc.getTitle(userLang)).replace("+", "%20");
String mailBody = ServletUtil.encodeURL(glp("ui.fo.ui.public-link.mail-body", doc.getTitle(), durationStr, urlWithAuthKey)).replace("+", "%20");
%>


<jalios:modal title="ui.fo.ui.public-link"
              url="front/publicLink.jsp"
              css="modal-lg">

  <jalios:message msg='<%= glp("ui.fo.ui.public-link.info", doc.getTitle(userLang), durationStr, loggedMember.getFullName()) %>' dismissable="false" title="" />
  
  <jalios:field value="<%= urlWithAuthKey %>" resource="field-vertical">
    <jalios:control settings="<%= new TextAreaSettings().rows(3) %>" />
  </jalios:field>
  
  <jalios:buffer name="MODAL_BUTTON">
  <a class="btn btn-primary" href="mailto:?subject=<%= mailSubject %>&amp;body=<%=  mailBody %>"><%= glp("ui.fo.ui.public-link.lbl.send-mail") %></a>
  </jalios:buffer>

</jalios:modal>

