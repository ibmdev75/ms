<%--
  @Summary: Sign-up form
  @Category: Authentication
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%
 if (!channel.isDataWriteEnabled()){
 	sendRedirect("index.jsp", request, response);
 	return;
 }

 String signForm = channel.getProperty("channel.sign.form");
 if (Util.notEmpty(signForm)){
   String redirectUrl = "types/"+signForm+"/editForm"+signForm+".jsp?";
   // Append req if any
   String reqId = getUntrustedStringParameter("id", null); // ENCODE !!
   if (Util.notEmpty(reqId)) {
     redirectUrl += "id=" + encodeForURL(reqId);   
   }
   // Append email if any
   String email = getUntrustedStringParameter("email", null); // ENCODE !!
   if (Util.notEmpty(email)) {
     redirectUrl += (Util.notEmpty(reqId) ? "&amp;" : "") + "email=" + encodeForURL(email);   
   }
   // Redirect
 	 sendRedirect(redirectUrl, request, response);
 	 return;
 }
%>
<jsp:useBean id="extFormHandler" scope="page" class="generated.EditMemberExtensionHandler">
  <jsp:setProperty name="extFormHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="extFormHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="extFormHandler" property="*" />
  <jsp:setProperty name="extFormHandler" property='loggedMember' value='<%= channel.getDefaultAdmin() %>'/>
</jsp:useBean>
<jsp:useBean id="formHandler" scope="page" class="com.jalios.jcms.handler.EditMemberHandler">
  <jsp:setProperty name="formHandler" property="request" value="<%= request %>"/>
  <jsp:setProperty name="formHandler" property="response" value="<%= response %>"/>
  <jsp:setProperty name="formHandler" property="extFormHandler" value="<%= extFormHandler %>"/>
  <jsp:setProperty name="formHandler" property="*" />
  <jsp:setProperty name="formHandler" property='loggedMember' value='<%= channel.getDefaultAdmin() %>'/>
</jsp:useBean>
<% 
request.setAttribute("title", glp("ui.fo.signup.title"));
request.setAttribute("formHandler", formHandler);
request.setAttribute("extFormHandler", extFormHandler);
%> 
<%@ include file='/jcore/doHeader.jspf' %>
<% 
if (formHandler.validate()) {
  return;
}
%> 
<%@ include file='/jcore/doMessageBox.jspf' %>
<% int formElementCount  = 0; %>
<form action="<%= channel.getSecuredBaseUrl(request) %>front/signup.jsp" method="post" name="editForm" class="form-horizontal">

  <h2><%= glp("ui.fo.signup.title") %></h2>
        
  <%-- Login ------------------------------------------------------------ --%> 
  <jalios:field  name="login" label="ui.adm.mbr-edit.lbl.login" required='true' value='<%= formHandler.getAvailableLogin() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>

  <%-- PASSWORD ------------------------------------------------------------ --%> 
  <jalios:field  label="ui.adm.mbr-edit.lbl.pwd" required='true'>
    <jalios:control settings='<%= new PasswordSettings().name("password1").placeholder("ui.adm.mbr-edit.lbl.pwd") %>' />
    <jalios:control settings='<%= new PasswordSettings().name("password2").placeholder("ui.adm.mbr-edit.lbl.pwd-confirm") %>' />
  </jalios:field>

          
  <%-- NAME ------------------------------------------------------- --%>    
  <jalios:field  name="name" label="ui.adm.mbr-edit.lbl.name" required='true' value='<%= formHandler.getAvailableName() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>

  <%-- FIRST NAME ------------------------------------------------------- --%>
  <jalios:field  name="firstName" label="ui.adm.mbr-edit.lbl.f-name" required='true' value='<%=formHandler.getAvailableFirstName() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>

  <%-- JOB TITLE ------------------------------------------------------- --%> 
  <jalios:field  name="jobTitle" label="ui.adm.mbr-edit.lbl.job"  value='<%= formHandler.getAvailableJobTitle() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>


  <%-- E-MAIL ---------------------------------------------------------------- --%>
  <jalios:field  name="email" label="ui.adm.mbr-edit.lbl.mail" required='true' value='<%= formHandler.getAvailableEmail() %>'>
   <jalios:control type="<%= ControlType.EMAIL %>" />
  </jalios:field>

  <%-- E-MAIL VISIBLE -------------------------------------------------------- --%> 
  <% 
  String emailvisibleyesInputId = ServletUtil.generateUniqueDOMId(request, "emailvisibleyes");
  String emailvisiblenoInputId = ServletUtil.generateUniqueDOMId(request, "emailvisibleno");
  %>
  <jalios:field  name="emailVisible" label="ui.adm.mbr-edit.lbl.mail-vis" description="ui.adm.mbr-edit.txt.mail-vis" required='true' value='<%= formHandler.getAvailableEmailVisible() %>'>
    <jalios:control type="<%= ControlType.BOOLEAN %>" />
  </jalios:field>  

          
  <%-- PHONE ------------------------------------------------------- --%> 
  <jalios:field  name="phone" label="ui.adm.mbr-edit.lbl.phone" value='<%= formHandler.getAvailablePhone() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>
  
  <%-- MOBILE ------------------------------------------------------- --%>
  <jalios:field  name="mobile" label="ui.adm.mbr-edit.lbl.mobile" value='<%= formHandler.getAvailableMobile() %>'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>

  <%-- LANGUAGE ------------------------------------------------------------ --%> 
  <jalios:field  name="language" label="ui.com.lbl.language" value='<%= formHandler.getAvailableLanguage() %>'>
    <jalios:control settings='<%= new EnumerateSettings().multiple().enumValues(channel.getLanguageList()) %>' />
  </jalios:field>

      	  
  <%-- INFORMATIONS ------------------------------------------------------------ --%>
  <jalios:field  name="info" label="ui.adm.mbr-edit.lbl.info" value='<%=formHandler.getAvailableInfo() %>'>
    <jalios:control settings='<%= new TextAreaSettings().rows(2) %>' />
  </jalios:field>

          
  <%-- BUTTONS -------------------------------------------------------------------- --%> 
 <div class="form-group">
    <div class="col-sm-offset-3 col-sm-10">
      <button class="btn btn-primary" name="opSignup" value="true" type="submit"><%= glp("ui.fo.signup.btn.send") %></button>
      <input type='hidden' name='redirect' value='<%= ServletUtil.getBaseUrl(request) %>index.jsp' />
      <input type="hidden" name="portal" value="<%= encodeForHTMLAttribute(getDataIdParameter("portal")) %>" />
      <input type="hidden" name="jsp" value="front/signup.jsp" />
    </div>
  </div>
</form>
<%@ include file='/jcore/doFooter.jspf' %>
