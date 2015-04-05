<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%@ page import='com.jalios.jcms.alert.*' %><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.alert.SendAlertHandler'><%--
--%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='*' /><%--
--%>  <jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>'/><%--
--%></jsp:useBean><%--
--%>
<% if (formHandler.validate()) { %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>

<jalios:modal title="alert.send-alert.lbl.title" formHandler="<%= formHandler %>" url="jcore/alert/sendAlert.jsp">

  <jalios:field label="alert.send-alert.lbl.alert-level" name="groups" value='<%= formHandler.getAvailableAlertLevelKey() %>'>
    <% for (Alert.Level itLevel: Alert.Level.values()) { %>
      <span class="badge alert-level alert-level-<%= itLevel.getKey() %>"><input type="radio" name="alertLevelKey" value="<%= itLevel.getKey() %>" id="alert-level-<%= itLevel.getKey() %>" <%= itLevel.getKey().equals(fieldValue) ? "checked='checked'" : ""  %>><label for="alert-level-<%= itLevel.getKey() %>"><%= itLevel.getLabel(userLang) %></label></span>&nbsp;
    <% } %>
  </jalios:field>   
  
  <jalios:field label="alert.send-alert.lbl.subject" name="subject" value='<%=  formHandler.getAvailableSubject() %>' required='true'>
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>
  
  <jalios:field label="alert.send-alert.lbl.message" name="message" value='<%=  formHandler.getAvailableMessage() %>' required='true'>
    <jalios:control settings='<%= new WikiAreaSettings().rows(2) %>' />
  </jalios:field>
  
  <%  
  jcmsContext.setAjaxRequestAttribute("ACContact", false);
  jcmsContext.setAjaxRequestAttribute("ACContactSet", null);
  
  Workspace refineWorkspace = formHandler.getAvailableRefineWorkspace();
  %>
  <jalios:field label="ui.com.lbl.members" name="members" value='<%=  formHandler.getAvailableMemberSet() %>' keyword="true">
    <jalios:control settings='<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT).workspace(refineWorkspace) %>' />
  </jalios:field>
  
  <jalios:field label="ui.com.lbl.groups" name="groups" value='<%=  formHandler.getAvailableGroupSet() %>' keyword="true">
    <jalios:control settings='<%= new GroupSettings().workspace(refineWorkspace) %>' />
  </jalios:field>
  
  <jalios:field label="alert.send-alert.lbl.alert-expiration" name="expiration" value="<%= formHandler.getAvailableExpiration() %>">
    <jalios:control settings='<%= new DateSettings().displayTime() %>' />
  </jalios:field>
  
  <jalios:buffer name="MODAL_BUTTONS">
    <button type="submit" class="btn btn-default" name="opCancel" onclick="return JCMS.window.Modal.close(false);"><%= glp("ui.com.btn.close") %></button>
    <button type="submit" class="ajax-refresh btn btn-primary" name="opSend"  value="true"><%= glp("ui.com.btn.send") %></button>
    <% if (refineWorkspace != null) { %><input type="hidden" name="refineWorkspace" value="<%= refineWorkspace.getId() %>"><% } %>
  </jalios:buffer>
  
</jalios:modal>

