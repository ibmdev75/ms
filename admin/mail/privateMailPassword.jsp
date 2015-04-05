<%--
  @Summary: "Password Reset Request" form to ask for a new password for private channel
  @Category: Authentication
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

%><jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.ResetPasswordHandler"><%
  %><jsp:setProperty name="formHandler" property="request" value="<%= request %>"/><%
  %><jsp:setProperty name="formHandler" property="response" value="<%= response %>"/><%
  %><jsp:setProperty name="formHandler" property="*" /><%
%></jsp:useBean><%

if (formHandler.validate()) {
  return;
}

request.setAttribute("mailSubAdminMenu", "true");
jcmsContext.addCSSHeader("css/jalios/ux/jalios-login.css");

if (formHandler.isResetRequestFormDisplayed()) {
  request.setAttribute("title", glp("ui.fo.resetpass.request.title"));
} else if (formHandler.isResetFormDisplayed()) {
  request.setAttribute("title", glp("ui.fo.resetpass.reset.title"));
} else {
  request.setAttribute("title", glp("ui.fo.resetpass.request.title"));
}
String formAction = ResourceHelper.getPrivateMailPassword();
%>

<%@ include file='/jcore/doEmptyHeader.jspf' %>

<div class="authentication private-mail-password container">
<div class="row">
<div class="login-panel well col-sm-6 col-lg-4 col-md-5 col-xs-10 col-xs-offset-1 col-sm-offset-3 col-lg-offset-4 col-md-offset-4">

<% if (!formHandler.isResetRequestFormDisplayed() && !formHandler.isResetFormDisplayed()) { %>
  <%@ include file='/jcore/doMessageBox.jspf' %>
<% } %>

<%-- Password reset REQUEST --%>
<%
if (formHandler.isResetRequestFormDisplayed()) {

  String inputIdEmail = "ResetPasswordEmailInput";
  String inputWidgetEmailCustomAttribute = "id=\"" + inputIdEmail + "\"";

  if (channel.isMultilingual()) { %>
    <div class="lang-chooser">
      <jalios:lang display="menu"/>
    </div>
  <% } %>

  <form class="form-horizontal login-form" action="<%= formAction %>" method="post" name="requestResetForm">

    <h1 class="form-title"><% /* %>Login<% */ %><%= glp("ui.fo.resetpass.request.title") %></h1>

    <%@ include file='/jcore/doMessageBox.jspf' %>

    <jalios:message level="<%= MessageLevel.INFO %>" dismissable="false" title="">
      <%= glp("ui.fo.resetpass.request.txt") %>
    </jalios:message>

    <jalios:field css="br" resource="field-light" name='email' label='<%= glp("ui.fo.resetpass.request.email.label") %>' value='<%= formHandler.getEmail() %>'>
      <jalios:control settings='<%= new EmailSettings().placeholder("ui.fo.resetpass.request.email.placeholder") %>' />
    </jalios:field>

    <div class="form-actions">
      <input type="submit" name="opRequestReset" value="<%= glp("ui.fo.resetpass.request.btn.request") %>" class='btn btn-primary' />
    </div>

   <% if (channel.getBooleanProperty("channel.sign-up", false)) { %>
    <div class="clearfix"></div>
    <hr/>
     <div class="box-footer">
      <%=glp("ui.fo.login.txt.signup1")%>
      <a href="front/signup.jsp"><%=glp("ui.fo.login.txt.signup2")%></a>
    </div>
   <% } %>
  </form>
<%
} // isResetRequestFormDisplayed
%>

<%-- Password RESET --%>
<%
if (formHandler.isResetFormDisplayed()) {

  String inputIdPassword1 = "ResetPasswordPwd1Input";
  String inputWidgetPassword1CustomAttribute = "id=\"" + inputIdPassword1 + "\" autocomplete=\"off\"";
  String inputWidgetPassword2CustomAttribute = "autocomplete=\"off\"";
  Member resetMember = formHandler.getMember();
  if (channel.isMultilingual()) { %>
    <div class="lang-chooser">
      <jalios:lang display="menu"/>
    </div>
  <% } %>
  <form class="form-horizontal" action="<%= ResourceHelper.getPrivateMailPassword() %>" method="post" name="resetForm">
    <input type="hidden" name="passwordResetToken" value="<%= encodeForHTMLAttribute(formHandler.getPasswordResetToken()) %>" />

    <h1 class="form-title"><% /* %>Login<% */ %><%= glp("ui.fo.resetpass.reset.title") %></h1>

    <%@ include file='/jcore/doMessageBox.jspf' %>

    <jalios:message level="<%= MessageLevel.INFO %>" dismissable="false" title="">
      <%= glp("ui.fo.resetpass.reset.txt", encodeForHTML(resetMember.getFriendlyName()), encodeForHTML(resetMember.getLogin())) %>
    </jalios:message>

    <jalios:field name="password1" label="ui.fo.resetpass.reset.password1.label">
      <jalios:control settings='<%= new PasswordSettings().placeholder("ui.fo.resetpass.reset.password1.placeholder") %>' />
    </jalios:field>

    <jalios:field name="password2">
      <jalios:control settings='<%= new PasswordSettings().placeholder("ui.fo.resetpass.reset.password2.placeholder") %>' />
    </jalios:field>

    <div class="form-actions">
      <input type="submit" name="opReset" value="<%= glp("ui.fo.resetpass.reset.btn.reset") %>" class='btn btn-primary' />
    </div>

  </form>
<%
} // isResetFormDisplayed
%>

</div><%-- col-* --%>
</div><%-- row --%>
</div><%-- private-login --%>
<%@ include file='/jcore/doEmptyFooter.jspf' %>
