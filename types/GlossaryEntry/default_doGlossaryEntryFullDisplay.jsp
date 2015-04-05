<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: GlossaryEntry display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% GlossaryEntry obj = (GlossaryEntry)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay GlossaryEntry <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field definition textareaEditor abstract <%= Util.isEmpty(obj.getDefinition(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(GlossaryEntry.class, "definition", userLang) %><jalios:edit pub='<%= obj %>' fields='definition'/></td>
    <td class='field-data' <%= gfla(obj, "definition") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getDefinition(userLang)) %>'>
            <jalios:wiki><%= obj.getDefinition(userLang) %></jalios:wiki>
            </jalios:if>
    </td>
  </tr>
  <tr class="field seeAlso linkEditor  <%= Util.isEmpty(obj.getSeeAlso()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(GlossaryEntry.class, "seeAlso", userLang) %><jalios:edit pub='<%= obj %>' fields='seeAlso'/></td>
    <td class='field-data' >
            <% if (Util.notEmpty(obj.getSeeAlso())) { %>
            <ol>
              <jalios:foreach name="itData" type="generated.GlossaryEntry" array="<%= obj.getSeeAlso() %>">
              <jalios:if predicate='<%= itData != null && itData.canBeReadBy(loggedMember) %>'>
              <li>
              <jalios:link data='<%= itData %>'/>
              </li>
              </jalios:if>
              </jalios:foreach>
            </ol>
            <% } %>
    </td>
  </tr>
  <tr class="field glossary linkEditor  <%= Util.isEmpty(obj.getGlossary()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(GlossaryEntry.class, "glossary", userLang) %><jalios:edit pub='<%= obj %>' fields='glossary'/></td>
    <td class='field-data' >
            <jalios:if predicate='<%= obj.getGlossary() != null && obj.getGlossary().canBeReadBy(loggedMember) %>'>
            <jalios:link data='<%= obj.getGlossary() %>'/>
            </jalios:if>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- uyKX9kppq/EQFQ7MNJImmw== --%>