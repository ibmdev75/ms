<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%

PortletLogin box = (PortletLogin) portlet;
PortalInterface loginPortal = box.getDisplayPortal() != null ? box.getDisplayPortal() : portal;

// Hide portlet if we show login page as full display
if (ResourceHelper.getLogin().equals(getUntrustedStringParameter("jsp", ""))) {
  request.setAttribute("ShowPortalElement", Boolean.FALSE);
  return;
}

jcmsContext.addCSSHeader("css/jalios/ux/jalios-login.css");

boolean showingPersistentOption = channel.getAuthMgr().isShowingPersistentOption();

ControlSettings loginSettings = new TextFieldSettings().placeholder(box.getLoginText(userLang));
ControlSettings passwordSettings = new PasswordSettings().placeholder(box.getPasswordText(userLang));
ControlSettings persistentSettings = new EnumerateSettings().checkbox().multiple().enumValues("true").enumLabels("ui.fo.login.lbl.remember");
%>
<% if (Util.notEmpty(box.getIntroduction(userLang))) { %>
  <h5 class="Intro text-left"><%= box.getIntroduction(userLang) %></h5>
<% } %>

<jalios:include target="PORTLET_LOGIN_FORM_HEADER" targetContext="div" />

<form action='<%= channel.getSecuredBaseUrl(request) %><%= JcmsUtil.getDisplayUrl() %>' method='post' name='login' class='form-horizontal login-form'>
  <jalios:field label='<%= box.getLoginText(userLang) %>' name='<%= channel.getAuthMgr().getLoginParameter() %>'>
    <jalios:control settings='<%= loginSettings %>' />
  </jalios:field>

  <jalios:field label='<%= box.getPasswordText(userLang) %>' name='<%= channel.getAuthMgr().getPasswordParameter() %>'>
    <jalios:control settings='<%= passwordSettings %>' />
  </jalios:field>

  <% if (showingPersistentOption) { %>
    <jalios:field name='<%= channel.getAuthMgr().getPersistentParameter() %>' value='<%= channel.getAuthMgr().getDefaultPersistentValue() %>' label=''>
      <jalios:control settings='<%= persistentSettings %>' />
    </jalios:field>
  <% } %>

  <p class="text-center">
    <button type='submit' name='<%= channel.getAuthMgr().getOpLoginParameter() %>' class='btn btn-primary' value='true'><%= box.getButtonText(userLang) %></button>
  </p>

  <input type='hidden' name='redirect' value='<%= ServletUtil.getUrl(request) %>' />
  <input type='hidden' name='jsp' value='<%= ResourceHelper.getLogin() %>' />
  <input type='hidden' name='portal' value='<%= loginPortal.getId() %>' />
  <% if (!showingPersistentOption) { %>
    <input type='hidden' name='<%= channel.getAuthMgr().getPersistentParameter() %>' value='<%= channel.getAuthMgr().getDefaultPersistentValue() %>' />
  <% } %>
</form>

<jalios:include target="PORTLET_LOGIN_FORM_FOOTER" targetContext="div" />
