<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: Tag display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% Tag obj = (Tag)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay Tag <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Tag.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getDescription(userLang)) %>'>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            </jalios:if>
    </td>
  </tr>
  <tr class="field couleurFond colorEditor  <%= Util.isEmpty(obj.getCouleurFond()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Tag.class, "couleurFond", userLang) %><jalios:edit pub='<%= obj %>' fields='couleurFond'/></td>
    <td class='field-data' <%= gfla(obj, "couleurFond") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCouleurFond()) %>'>
            <%= obj.getCouleurFond() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field couleurTexte colorEditor  <%= Util.isEmpty(obj.getCouleurTexte()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Tag.class, "couleurTexte", userLang) %><jalios:edit pub='<%= obj %>' fields='couleurTexte'/></td>
    <td class='field-data' <%= gfla(obj, "couleurTexte") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCouleurTexte()) %>'>
            <%= obj.getCouleurTexte() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field compteur intEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(Tag.class, "compteur", userLang) %><jalios:edit pub='<%= obj %>' fields='compteur'/></td>
    <td class='field-data' >
            <% /* %>123456789<% */ %><%= NumberFormat.getInstance(userLocale).format(obj.getCompteur()) %>
    </td>
  </tr>
  <tr class="field url linkEditor  <%= Util.isEmpty(obj.getUrl()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Tag.class, "url", userLang) %><jalios:edit pub='<%= obj %>' fields='url'/></td>
    <td class='field-data' >
            <jalios:if predicate='<%= obj.getUrl() != null && obj.getUrl().canBeReadBy(loggedMember) %>'>
            <jalios:link data='<%= obj.getUrl() %>'/>
            </jalios:if>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- b6ixhal3OBHUGiqNAice/w== --%>