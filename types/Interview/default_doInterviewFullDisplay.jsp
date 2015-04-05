<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: Interview display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><% Interview obj = (Interview)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay Interview <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field summary textareaEditor abstract <%= Util.isEmpty(obj.getSummary(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Interview.class, "summary", userLang) %><jalios:edit pub='<%= obj %>' fields='summary'/></td>
    <td class='field-data' <%= gfla(obj, "summary") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getSummary(userLang)) %>'>
            <jalios:wiki><%= obj.getSummary(userLang) %></jalios:wiki>
            </jalios:if>
    </td>
  </tr>
  <tr class="field intro textareaEditor  <%= Util.isEmpty(obj.getIntro(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Interview.class, "intro", userLang) %><jalios:edit pub='<%= obj %>' fields='intro'/></td>
    <td class='field-data' <%= gfla(obj, "intro") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getIntro(userLang)) %>'>
            <jalios:wiki><%= obj.getIntro(userLang) %></jalios:wiki>
            </jalios:if>
    </td>
  </tr>
  <tr class="field bio textareaEditor  <%= Util.isEmpty(obj.getBio(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Interview.class, "bio", userLang) %><jalios:edit pub='<%= obj %>' fields='bio'/></td>
    <td class='field-data' <%= gfla(obj, "bio") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getBio(userLang)) %>'>
            <jalios:wiki><%= obj.getBio(userLang) %></jalios:wiki>
            </jalios:if>
    </td>
  </tr>
  <tr class="field questions textareaEditor  <%= Util.isEmpty(obj.getQuestions(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Interview.class, "questions", userLang) %><jalios:edit pub='<%= obj %>' fields='questions'/></td>
    <td class='field-data' <%= gfla(obj, "questions") %>>
        <% if (Util.notEmpty(obj.getQuestions(userLang))) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getQuestions(userLang) %>">
            <jalios:if predicate='<%= Util.notEmpty(itString) %>'>
              <li>
              <jalios:wiki><%= itString %></jalios:wiki>
              </li>
            </jalios:if>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field answers textareaEditor  <%= Util.isEmpty(obj.getAnswers()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Interview.class, "answers", userLang) %><jalios:edit pub='<%= obj %>' fields='answers'/></td>
    <td class='field-data' <%= gfla(obj, "answers") %>>
        <% if (Util.notEmpty(obj.getAnswers())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getAnswers() %>">
            <jalios:if predicate='<%= Util.notEmpty(itString) %>'>
              <li>
              <jalios:wiki><%= itString %></jalios:wiki>
              </li>
            </jalios:if>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field questionPrefix textfieldEditor  <%= Util.isEmpty(obj.getQuestionPrefix()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Interview.class, "questionPrefix", userLang) %><jalios:edit pub='<%= obj %>' fields='questionPrefix'/></td>
    <td class='field-data' <%= gfla(obj, "questionPrefix") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getQuestionPrefix()) %>'>
            <%= obj.getQuestionPrefix() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field answerPrefix textfieldEditor  <%= Util.isEmpty(obj.getAnswerPrefix()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Interview.class, "answerPrefix", userLang) %><jalios:edit pub='<%= obj %>' fields='answerPrefix'/></td>
    <td class='field-data' <%= gfla(obj, "answerPrefix") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getAnswerPrefix()) %>'>
            <%= obj.getAnswerPrefix() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field photo imageEditor  <%= Util.isEmpty(obj.getPhoto()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(Interview.class, "photo", userLang) %><jalios:edit pub='<%= obj %>' fields='photo'/></td>
    <td class='field-data' <%= gfla(obj, "photo") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getPhoto()) %>'>
            <img src='<%= Util.encodeUrl(obj.getPhoto()) %>' alt='' />
            </jalios:if>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- MNga3WhLF6DCsH1u5YB9KQ== --%>