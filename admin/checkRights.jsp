<%@ include file='/jcore/doInitPage.jspf' %><%

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.CheckRightsHandler'><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

if (formHandler.validate()) {
  return;
}

boolean isAuthorized = formHandler.isAuthorized();
RightInfo rightInfo = formHandler.getRightInfo();

String selectedRight = formHandler.getAvailableRight();
Data data = formHandler.getAvailableData();
Member member = formHandler.getAvailableMember();
jcmsContext.addCSSHeader("css/jalios/ux/jalios-checkrights.css");
%>
<jalios:modal title="right-info.checker.title" 
              url="admin/checkRights.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg check-rights"
              picture=""
              op="opCheck"
              button="right-info.checker.btn.check">
              
              
  <%-- DATA CHOOSER --%>
  <table class="layout">
    <tr>
      <td>
    <jalios:field label="ui.com.lbl.member" name='<%= "member" %>' value='<%= member %>' css='accountOnly' resource="field-vertical">
      <jalios:control settings="<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT) %>" />
    </jalios:field> 
      </td>
      <td>
     <jalios:field label="right-info.checker.lbl.right" name='right' value='<%= selectedRight %>' resource="field-vertical">
      <jalios:control settings='<%= new EnumerateSettings().select().enumValues(formHandler.getRightList()).enumLabels(formHandler.getRightLabelList()) %>'/>
    </jalios:field>
      </td>
      <td>
    <jalios:field  label="ui.com.lbl.publication" name='<%= "data" %>' value='<%= data %>' resource="field-vertical">
      <jalios:control settings='<%= new PublicationSettings().superType(Publication.class) %>' />
    </jalios:field>                            
      </td>
    </tr>
  </table>

  
  <%-- RESULT --%>
  <% if (rightInfo != null) { %>
  <div class="result">
    <% String access = isAuthorized ? "access-granted" : "access-denied"; %>
    <div class="access <%= access %>">
      <% if (isAuthorized) { %><jalios:icon src="right-ok" /><% } else { %><jalios:icon src="right-ko" /><% } %>            
      <%= glp("right-info.explanation." + access) %>
    </div>
    <div class="explanation">
    <%= rightInfo.getExplanationMessage(userLang, userLocale, data, member) %>
    </div>
  </div>
  <% } %>
          
</jalios:modal>
