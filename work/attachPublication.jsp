<%@ page contentType="text/html; charset=UTF-8" %><%--
--%><%@ include file='/jcore/doInitPage.jspf' %><%--
--%><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
}
%><%--
--%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.AttachPublicationHandler'><%--
--%>  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%--
--%>  <jsp:setProperty name='formHandler' property='*' /><%--
--%></jsp:useBean><%--
--%>
<% if (formHandler.validate()) { %>
<% request.setAttribute("modal.redirect", formHandler.getAvailableTarget().getDisplayUrl(userLocale)); %>
<%@ include file="/jcore/modal/modalRedirect.jspf" %>
<% } %>
<jalios:modal title="ui.work.attach-pub.modal.title" 
              url="work/attachPublication.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg attach-to"
              >
              
<%-- STEP 1 --%>
<% if (formHandler.isStepPublication()) { %>
<jalios:message msg="ui.work.attach-pub.modal.info" title="" />
<jalios:field name="target" label="ui.work.attach-pub.modal.target" description="ui.work.attach-pub.modal.target.h" value="<%= formHandler.getAvailableTarget() %>">
  <jalios:control settings='<%= new PublicationSettings().superType(Content.class).noWorkspaceFilter() %>' />
</jalios:field>

<%-- STEP 2 --%>
<% } else if (formHandler.isStepField()) { %>
<jalios:field name="fieldName" label="ui.work.attach-pub.modal.field" description="ui.work.attach-pub.modal.field.h" value="<%= formHandler.getAvailableFieldName() %>" >
  <select name="fieldName" class="form-control" data-jalios-action="ajax-refresh">
    <jalios:foreach collection="<%= formHandler.getTypeFieldEntrySet() %>" type="TypeFieldEntry" name="tfe" >
    <option value="<%= tfe.getName() %>" <%= tfe.getName().equals(fieldValue) ? "selected='selected'" : ""%>><%= tfe.getLabel(userLang) %></option>
    </jalios:foreach>
  </select>
</jalios:field>
<jalios:field name="currentValue" label="ui.work.attach-pub.modal.field.value" >
  <% Collection<Publication> currentValueCollection = formHandler.getCurrentValueCollection(); %>
  <% if (Util.isEmpty(currentValueCollection)) { %>
  <p class="form-control-static"><%= glp("ui.work.attach-pub.modal.field.no-value") %></p>
  <% } else { %>
  <p class="form-control-static"><%= glp("ui.work.attach-pub.modal.field.list") %></p>
  <ol class="form-control-static">
  <jalios:foreach collection="<%= currentValueCollection %>" name="itPub" type="Publication">
    <li><jalios:dataicon data="<%= itPub %>" /> <jalios:link data="<%= itPub %>" />
  </jalios:foreach>
  </ol>
  <% } %>
</jalios:field>
<% } %>

</jalios:modal>