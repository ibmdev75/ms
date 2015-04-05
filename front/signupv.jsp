<%--
  @Summary: Sign-up validation message
  @Deprecated: False
  @Customizable: True
  @Requestable: True
  @Summary: Sign-up validation
  @Category: Sign-up
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.EditMemberHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="*" />
  <% String redirect = ServletUtil.getBaseUrl(request) + "front/signupv.jsp"; %>
  <jsp:setProperty name="formHandler" property="redirect" value="<%= redirect %>"/>
  <jsp:setProperty name="formHandler" property="opConfirmSignup" value='<%= "true" %>'/>
</jsp:useBean>
<% formHandler.validate(); %>
<% request.setAttribute("title", glp("ui.fo.sign-up.confirmation")); %>

<%@ include file='/jcore/doHeader.jspf' %>
<br /><br />

<%@ include file='/jcore/doMessageBox.jspf' %>

<jalios:if predicate='<%= formHandler.getShowCharter() %>'>
  <form method='post' action='<%= channel.getSecuredBaseUrl(request) %><%= JcmsUtil.getDisplayUrl() %>' >
  <center>
  <table class='layout charter'>
    <tr>
      <td>
      <%= glp("msg.sign-up.charter", channel.getName()) %>
      </td>
    </tr>
  </table><br /><br />
  <input type='hidden' name='id' value='<%= encodeForHTMLAttribute(getDataIdParameter("id")) %>' />
  <input type='hidden' name='jsp' value='front/signupv.jsp' />
  <input type='hidden' name='password1' value='<%= encodeForHTMLAttribute(getUntrustedStringParameter("password1", "")) %>' />
  <input type='hidden' name='signupKey' value='<%= encodeForHTMLAttribute(getUntrustedStringParameter("signupKey", "")) %>' />
  <input type='submit' name='charterAccepted' value='<%= glp("ui.fo.sign-up.charter-accept") %>' />
  <input type='submit' name='charterRefused' value='<%= glp("ui.fo.sign-up.charter-decline") %>' />
  </center>
  </form>
</jalios:if>

<%@ include file='/jcore/doFooter.jspf' %>