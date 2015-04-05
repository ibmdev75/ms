<%--
  @Summary: Login form for private channel
  @Category: Authentication
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%

String redirect = Util.getString(getValidHttpUrl("redirect"), ServletUtil.getBaseUrl(request) + "index.jsp");
if (isLogged) {
  sendRedirect(redirect);
  return;
}

jcmsContext.setPageTitle(glp("ui.fo.login.title"));
jcmsContext.addCSSHeader("css/jalios/ux/jalios-login.css");

String inputIdLogin    = "PrivateLoginInputLogin";
String inputIdPassword = "PrivateLoginInputPassword";
String inputIdMemorize = "PrivateLoginInputMemorize";
String inputWidgetLoginCustomAttribute = "id=\"" + inputIdLogin + "\"";
String inputWidgetPasswordCustomAttribute = "id=\"" + inputIdPassword + "\"";

boolean showLostPassword = channel.getBooleanProperty("channel.login.show-lost-password-link", true);
boolean showPersistentOption = channel.getAuthMgr().isShowingPersistentOption();
String formAction = channel.getSecuredBaseUrl(request) + ResourceHelper.getPrivateLogin();
%>

<%@ include file='/jcore/doEmptyHeader.jspf' %>

<div class="authentication private-login container">
<div class="row">
<div class="login-panel well col-sm-6 col-lg-4 col-xs-10 col-xs-offset-1 col-sm-offset-3 col-lg-offset-4">
  <% if (channel.isMultilingual()) { %>
    <div class="lang-chooser">
      <jalios:lang display="menu"/>
    </div>
  <% } %>

  <jalios:include target="PRIVATE_LOGIN_FORM_HEADER" targetContext="div" />
  <form class="form-horizontal login-form" action="<%= formAction %>" method="post">
    <jalios:include target="PRIVATE_LOGIN_FORM_INNER_HEADER" targetContext="div" />

    <h1 class="form-title"><%= channel.getName() %></h1>

    <%@ include file='/jcore/doMessageBox.jspf' %>

    <jalios:field css="br" resource="field-light" label="ui.fo.login.lbl.login" name='<%= channel.getAuthMgr().getLoginParameter() %>' value='<%= getUntrustedStringParameter(channel.getAuthMgr().getLoginParameter(),"") %>'>
      <jalios:control settings='<%= new TextFieldSettings().placeholder(glp("ui.fo.login.lbl.login")).autofocus() %>' />
    </jalios:field>

    <jalios:field css="br" resource="field-light" label="ui.fo.login.lbl.passwd" name='<%= channel.getAuthMgr().getPasswordParameter() %>'>
      <jalios:control settings='<%= new PasswordSettings().placeholder(glp("ui.fo.login.lbl.passwd")) %>' />
    </jalios:field>

    <div class="form-actions">
      <input type="hidden" name="redirect" value="<%= encodeForHTMLAttribute(redirect) %>" class="Form" />
      <% if (!showPersistentOption) { %>
      <input type="hidden" name="<%= channel.getAuthMgr().getPersistentParameter() %>" value="<%= channel.getAuthMgr().getDefaultPersistentValue() %>" />
      <% } %>
      <div class="form-inline">
        <% if (showPersistentOption) { %>
        <div class="login-remember-me checkbox">
          <label>
            <input name="<%= channel.getAuthMgr().getPersistentParameter() %>" type="checkbox" value="true" <%= channel.getAuthMgr().getDefaultPersistentValue() ? "checked=\"checked\"" : "" %>> <%= glp("ui.fo.login.lbl.remember") %>
          </label>
        </div>
        <% } %>
        <input type="submit" name="<%= channel.getAuthMgr().getOpLoginParameter() %>" value="<%= glp("ui.fo.login.btn.login") %>" class='btn login-btn btn-primary' />
      </div>
    </div>

    <jalios:include target="PRIVATE_LOGIN_FORM_INNER_FOOTER" targetContext="div" />

  </form>
  
    <jalios:buffer name="customFooter">
      <jalios:include target="PRIVATE_LOGIN_FORM_FOOTER" targetContext="div" />
    </jalios:buffer>
    <% if (showLostPassword || Util.notEmpty(customFooter.toString().trim())) { %>
    <hr/>
    <div class="box-footer">
      <% if (showLostPassword) { %>
        <a href="<%= ResourceHelper.getPrivateMailPassword() %>"><%= glp("ui.fo.login.txt.lost") %></a>
      <% } %>
      <%= customFooter %>
    </div>
    <% } %>

</div><%-- EOF .login-panel --%>
</div><%-- EOF .row --%>
</div><%-- EOF .private-login --%>

<%@ include file='/jcore/doEmptyFooter.jspf' %>