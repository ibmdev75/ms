<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: SmallNews display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% SmallNews obj = (SmallNews)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay SmallNews <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field intro textareaEditor abstract <%= Util.isEmpty(obj.getIntro(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SmallNews.class, "intro", userLang) %><jalios:edit pub='<%= obj %>' fields='intro'/></td>
    <td class='field-data' <%= gfla(obj, "intro") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getIntro(userLang)) %>'>
            <jalios:wiki><%= obj.getIntro(userLang) %></jalios:wiki>
            </jalios:if>
    </td>
  </tr>
  <tr class="field content textareaEditor  <%= Util.isEmpty(obj.getContent(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(SmallNews.class, "content", userLang) %><jalios:edit pub='<%= obj %>' fields='content'/></td>
    <td class='field-data' <%= gfla(obj, "content") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getContent(userLang)) %>'>
            <jalios:wiki><%= obj.getContent(userLang) %></jalios:wiki>
            </jalios:if>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- KADXzOd4rhquE5WfXK1xzA== --%>