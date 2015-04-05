<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: SignUp display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% SignUp obj = (SignUp)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay SignUp <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field name textfieldEditor  <%= Util.isEmpty(obj.getName()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SignUp.class, "name", userLang) %><jalios:edit pub='<%= obj %>' fields='name'/></td>
    <td class='field-data' <%= gfla(obj, "name") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getName()) %>'>
            <%= obj.getName() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field firstName textfieldEditor  <%= Util.isEmpty(obj.getFirstName()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SignUp.class, "firstName", userLang) %><jalios:edit pub='<%= obj %>' fields='firstName'/></td>
    <td class='field-data' <%= gfla(obj, "firstName") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getFirstName()) %>'>
            <%= obj.getFirstName() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field email emailEditor  <%= Util.isEmpty(obj.getEmail()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SignUp.class, "email", userLang) %><jalios:edit pub='<%= obj %>' fields='email'/></td>
    <td class='field-data' <%= gfla(obj, "email") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getEmail()) %>'>
            <a href='mailto:<%= obj.getEmail() %>'><%= obj.getEmail()%></a>
            </jalios:if>
    </td>
  </tr>
  <tr class="field salutation enumerateEditor  <%= Util.isEmpty(obj.getSalutation()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SignUp.class, "salutation", userLang) %><jalios:edit pub='<%= obj %>' fields='salutation'/></td>
    <td class='field-data' <%= gfla(obj, "salutation") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getSalutation()) %>'>
            <%= obj.getSalutationLabel(obj.getSalutation(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field jobTitle textfieldEditor  <%= Util.isEmpty(obj.getJobTitle()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SignUp.class, "jobTitle", userLang) %><jalios:edit pub='<%= obj %>' fields='jobTitle'/></td>
    <td class='field-data' <%= gfla(obj, "jobTitle") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getJobTitle()) %>'>
            <%= obj.getJobTitle() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field favoriteLogin textfieldEditor  <%= Util.isEmpty(obj.getFavoriteLogin()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SignUp.class, "favoriteLogin", userLang) %><jalios:edit pub='<%= obj %>' fields='favoriteLogin'/></td>
    <td class='field-data' <%= gfla(obj, "favoriteLogin") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getFavoriteLogin()) %>'>
            <%= obj.getFavoriteLogin() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field message textareaEditor  <%= Util.isEmpty(obj.getMessage()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SignUp.class, "message", userLang) %><jalios:edit pub='<%= obj %>' fields='message'/></td>
    <td class='field-data' <%= gfla(obj, "message") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getMessage()) %>'>
            <%= obj.getMessage() %>
            </jalios:if>
    </td>
  </tr>
 
  <tr class="field submit-member member <%=  obj.getSubmitMember() != null ? "" : "empty" %>">
    <td class='field-label'>
      <% /* %>Submit member<% */ %><%= glp("ui.work.forms.lbl.submit-mbr") %>
    </td>
    <td class='field-data'>
      <jalios:if predicate='<%= obj.getSubmitMember() != null %>'>
      <a href="<%= ResourceHelper.getQuery() %>?mids=<%=  obj.getSubmitMember().getId() %>"><% /* %>John Smith<% */ %><%= obj.getSubmitMember() %></a>
      </jalios:if>
    </td>
  </tr>
  <tr class="field submit-remote-addr <%=  obj.getSubmitRemoteAddr() != null ? "" : "empty" %>">
    <td class='field-label'>
      <% /* %>IP address<% */ %><%= glp("ui.work.forms.lbl.submit-ip") %>
    </td>
    <td class='field-data'>
      <% /* %>10.10.10.10<% */ %><%= obj.getSubmitRemoteAddr() %>
    </td>
  </tr>
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- unDIL9fwI9xgfXlI5Wsm1A== --%>