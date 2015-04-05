<%--
  @Summary: Login form for public channel
  @Category: Authentication
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%><%
%><%@ page import="com.jalios.jcms.authentication.handlers.DelegationAuthenticationHandler" %><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
jcmsContext.addCSSHeader("css/jalios/ux/jalios-login.css");
%><%@ include file='/jcore/doHeader.jspf' %><%

request.setAttribute("title", glp("ui.fo.login.title"));
Data reqPortal = getDataParameter("portal");
String loginPortalId = reqPortal != null ? reqPortal.getId() : ((Data)request.getAttribute("Portal")).getId();

// We assume this JSP is not embedded twice in a page.
String inputIdLogin    = "FrontLoginInputLogin";
String inputIdPassword = "FrontLoginInputPassword";
String inputIdMemorize = "FrontLoginInputMemorize";
String inputWidgetLoginCustomAttribute = "id=\"" + inputIdLogin + "\"";
String inputWidgetPasswordCustomAttribute = "id=\"" + inputIdPassword + "\"";

boolean showPersistentOption = channel.getAuthMgr().isShowingPersistentOption();
String formAction = channel.getSecuredBaseUrl(request) + JcmsUtil.getDisplayUrl();
%>

<jalios:include target="LOGIN_FORM_HEADER" targetContext="div" />

<%-- Standard LOGIN --%>
<form class="public-login" action="<%= formAction %>" method="post" name="login">
<div class="panel panel-default login-panel login responsive">
  <div class="panel-body responsive">
    <h1 class="form-title"><% /* %>Login<% */ %><%= glp("ui.fo.login.title") %></h1>

    <%@ include file='/jcore/doMessageBox.jspf' %>

    <%-- Delegation LOGIN --%>
    <%
    Set<Member> delegationHolderSet = isLogged ? DelegationAuthenticationHandler.getInstance().filterExcludedMember(loggedMember.getDelegationHolderSet()) : null;
    %>
    <% if (Util.notEmpty(delegationHolderSet)) { %>
      <jalios:accordion>
        <jalios:accordion-panel title="ui.fo.login.txt.delegation">

          <p><%= glp("ui.fo.login.txt.delegation.h") %></p>
          <ul class="list-unstyled">
            <jalios:foreach collection="<%= delegationHolderSet %>" name="itMember" type="Member" counter="dmCounter">
            <li>
              <a href="<%= DelegationAuthenticationHandler.getSuLink(itMember) %>">
                <jalios:icon src="login" alt='<%= itMember.getLogin() %>'/>
                <jalios:memberphoto member="<%= itMember %>" size="<%= PhotoSize.ICON %>" link="false"/>
                <%= itMember.getDataName(userLang) %>
              </a>
            </li>
            </jalios:foreach>
          </ul>

        </jalios:accordion-panel>
      </jalios:accordion>
    <% } %>

    <div class="row">
      <jalios:field name="<%= channel.getAuthMgr().getLoginParameter() %>" label="ui.fo.login.lbl.login" value='<%= getUntrustedStringParameter(channel.getAuthMgr().getLoginParameter(),"") %>'>
        <jalios:control type="<%= ControlType.TEXTFIELD %>" />
      </jalios:field>
  
      <jalios:field name="<%= channel.getAuthMgr().getPasswordParameter() %>" label="ui.fo.login.lbl.passwd">
        <jalios:control type="<%= ControlType.PASSWORD %>" />
      </jalios:field>
    </div>

    <div class="form-actions">
      <button type="submit" name="<%= channel.getAuthMgr().getOpLoginParameter() %>" class='btn btn-primary'  value="true"><%= glp("ui.fo.login.btn.login") %></button>
      <% if (showPersistentOption) { %>
        <div class="login-remember-me checkbox">
          <label>
            <input name="<%= channel.getAuthMgr().getPersistentParameter() %>" type="checkbox" value="true" <%= channel.getAuthMgr().getDefaultPersistentValue() ? "checked=\"checked\"" : "" %>> <%= glp("ui.fo.login.lbl.remember") %>
          </label>
        </div>
      <% } %>
    </div>

    <input type="hidden" name="redirect" value="<%= encodeForHTMLAttribute(Util.getString(getValidHttpUrl("redirect"), ServletUtil.getBaseUrl(request) + "index.jsp")) %>" class="Form" />
    <input type="hidden" name="jsp" value="<%= ResourceHelper.getLogin() %>" />
    <input type="hidden" name="portal" value="<%= encodeForHTMLAttribute(loginPortalId) %>" />
    <% if (!showPersistentOption) { %>
    <input type="hidden" name="<%= channel.getAuthMgr().getPersistentParameter() %>" value="<%= channel.getAuthMgr().getDefaultPersistentValue() %>" />
    <% } %>
  </div>

  <%
  boolean showLostPassword = channel.getBooleanProperty("channel.login.show-lost-password-link", true);
  boolean showSignup = channel.getBooleanProperty("channel.sign-up", false);
  %>
  <% if (showLostPassword || showSignup) { %>
  <div class="panel-footer text-center">
    <% if (showLostPassword) { %>
    <span class='formInfo'><a href="<%= ResourceHelper.getMailPassword() %>?portal=<%= loginPortalId %>"><%= glp("ui.fo.login.txt.lost") %></a></span>
    <% } %>
    <% if (showSignup) { %>
      <br /><span class='formInfo'><%=glp("ui.fo.login.txt.signup1")%></span>&nbsp;<span class='formInfo'><a href="front/signup.jsp?<%= Util.notEmpty(jcmsContext.getPortal()) ? "portal=" + jcmsContext.getPortal().getId() : "" %>"><%=glp("ui.fo.login.txt.signup2")%></a></span>
    <% } %>
  </div>
  <% } %>
</div>
</form>
<jalios:include target="LOGIN_FORM_FOOTER" targetContext="div" />

<%@ include file='/jcore/doFooter.jspf' %>
