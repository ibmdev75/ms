<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: WebPage display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% WebPage obj = (WebPage)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay WebPage <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field url urlEditor  <%= Util.isEmpty(obj.getUrl()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(WebPage.class, "url", userLang) %><jalios:edit pub='<%= obj %>' fields='url'/></td>
    <td class='field-data' <%= gfla(obj, "url") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getUrl()) %>'>
            <a href='<%= obj.getUrl() %>' ><%= obj.getUrl()%></a>
            </jalios:if>
    </td>
  </tr>
  <tr class="field urlToShot urlEditor  <%= Util.isEmpty(obj.getUrlToShot()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(WebPage.class, "urlToShot", userLang) %><jalios:edit pub='<%= obj %>' fields='urlToShot'/></td>
    <td class='field-data' <%= gfla(obj, "urlToShot") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getUrlToShot()) %>'>
            <a href='<%= obj.getUrlToShot() %>' ><%= obj.getUrlToShot()%></a>
            </jalios:if>
    </td>
  </tr>
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(WebPage.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getDescription(userLang)) %>'>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            </jalios:if>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- AID5MYAY+2/k/3HBbKsHog== --%>