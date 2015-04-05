<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/portal/doPortletParams.jspf' %>
<% PortletSignUp box = (PortletSignUp) portlet;  %>

<%
if (!channel.getBooleanProperty("channel.sign-up",false) || !channel.isDataWriteEnabled()){
  request.setAttribute("ShowPortalElement",Boolean.FALSE);
  return;
}
PortalInterface signupPortal = box.getDisplayPortal() != null ? box.getDisplayPortal() : portal;

String emailInputId = "SignUp_input_" + box.getId();
%>

<jalios:if predicate='<%= Util.notEmpty(box.getIntro(userLang)) %>'>
  <h5 class="Intro text-left"><%= box.getIntro(userLang) %></h5>
</jalios:if>

<form action="front/signup.jsp" method="get" class='form-horizontal'>
  <jalios:field label='<%= Util.getString(box.getLabel(userLang), "") %>' name='email'>
    <jalios:control settings='<%= new EmailSettings() %>' />
  </jalios:field>

  <p class="text-center">
    <button type="submit" name='imageField2' class="btn btn-primary" value="true"><%= glp("ui.com.btn.ok") %></button>
  </p>

  <input type="hidden" name="redirect" value="<%= ServletUtil.getUrl(request) %>"  />
  <input type="hidden" name="portal" value="<%= signupPortal.getId() %>"  />
</form>