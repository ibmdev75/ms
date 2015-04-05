<%@ page contentType="text/html; charset=UTF-8" %><%
%><%-- This file has been automatically generated. --%><%
%><%--
  @Summary: PortletPortal display page
  @Category: Generated
  @Author: JCMS Type Processor
  @Customizable: True
  @Requestable: True
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><% PortletPortal obj = (PortletPortal)portlet; %><%
%><%@ include file='/front/doFullDisplay.jspf' %>
<div class="fullDisplay PortletPortal <%= obj.canBeEditedFieldByField(loggedMember) ? "unitFieldEdition" : "" %>">
<%@ include file='/front/publication/doPublicationHeader.jspf' %>
<table class="fields">
  <tr class="field pageTitle textfieldEditor  <%= Util.isEmpty(obj.getPageTitle(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "pageTitle", userLang) %><jalios:edit pub='<%= obj %>' fields='pageTitle'/></td>
    <td class='field-data' <%= gfla(obj, "pageTitle") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getPageTitle(userLang)) %>'>
            <%= obj.getPageTitle(userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field child linkEditor  <%= Util.isEmpty(obj.getChild()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "child", userLang) %><jalios:edit pub='<%= obj %>' fields='child'/></td>
    <td class='field-data' >
            <jalios:if predicate='<%= obj.getChild() != null && obj.getChild().canBeReadBy(loggedMember) %>'>
            <jalios:link data='<%= obj.getChild() %>'/>
            </jalios:if>
    </td>
  </tr>
  <tr class="field cssFile enumerateEditor  <%= Util.isEmpty(obj.getCssFile()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "cssFile", userLang) %><jalios:edit pub='<%= obj %>' fields='cssFile'/></td>
    <td class='field-data' <%= gfla(obj, "cssFile") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCssFile()) %>'>
            <%= obj.getCssFileLabel(obj.getCssFile(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field description textareaEditor abstract <%= Util.isEmpty(obj.getDescription(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "description", userLang) %><jalios:edit pub='<%= obj %>' fields='description'/></td>
    <td class='field-data' <%= gfla(obj, "description") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getDescription(userLang)) %>'>
            <jalios:wiki><%= obj.getDescription(userLang) %></jalios:wiki>
            </jalios:if>
    </td>
  </tr>
  <tr class="field portletImage imageEditor  <%= Util.isEmpty(obj.getPortletImage(userLang)) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "portletImage", userLang) %><jalios:edit pub='<%= obj %>' fields='portletImage'/></td>
    <td class='field-data' <%= gfla(obj, "portletImage") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getPortletImage(userLang)) %>'>
            <img src='<%= Util.encodeUrl(obj.getPortletImage(userLang)) %>' alt='' />
            </jalios:if>
    </td>
  </tr>
  <tr class="field cacheType enumerateEditor  <%= Util.isEmpty(obj.getCacheType()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "cacheType", userLang) %><jalios:edit pub='<%= obj %>' fields='cacheType'/></td>
    <td class='field-data' <%= gfla(obj, "cacheType") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCacheType()) %>'>
            <%= obj.getCacheTypeLabel(obj.getCacheType(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field cacheSensibility enumerateEditor  <%= Util.isEmpty(obj.getCacheSensibility()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "cacheSensibility", userLang) %><jalios:edit pub='<%= obj %>' fields='cacheSensibility'/></td>
    <td class='field-data' <%= gfla(obj, "cacheSensibility") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCacheSensibility()) %>'>
            <%= obj.getCacheSensibilityLabel(obj.getCacheSensibility(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field invalidClass enumerateEditor  <%= Util.isEmpty(obj.getInvalidClass()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "invalidClass", userLang) %><jalios:edit pub='<%= obj %>' fields='invalidClass'/></td>
    <td class='field-data' <%= gfla(obj, "invalidClass") %>>
        <% if (Util.notEmpty(obj.getInvalidClass())) { %>
            <ol>
            <jalios:foreach name="itString" type="String" array="<%= obj.getInvalidClass() %>">
            <jalios:if predicate='<%= Util.notEmpty(itString) %>'>
              <li>
            <%= obj.getInvalidClassLabel(itString, userLang) %>
              </li>
            </jalios:if>
            </jalios:foreach>
            </ol>
        <% } %>
    </td>
  </tr>
  <tr class="field invalidTime durationEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "invalidTime", userLang) %><jalios:edit pub='<%= obj %>' fields='invalidTime'/></td>
    <td class='field-data' >
            <jalios:duration time='<%= obj.getInvalidTime() * 1000L %>'/>
    </td>
  </tr>
  <tr class="field behaviorCopy enumerateEditor  <%= Util.isEmpty(obj.getBehaviorCopy()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "behaviorCopy", userLang) %><jalios:edit pub='<%= obj %>' fields='behaviorCopy'/></td>
    <td class='field-data' <%= gfla(obj, "behaviorCopy") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getBehaviorCopy()) %>'>
            <%= obj.getBehaviorCopyLabel(obj.getBehaviorCopy(), userLang) %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field cssId textfieldEditor  <%= Util.isEmpty(obj.getCssId()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "cssId", userLang) %><jalios:edit pub='<%= obj %>' fields='cssId'/></td>
    <td class='field-data' <%= gfla(obj, "cssId") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCssId()) %>'>
            <%= obj.getCssId() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field cssClasses textfieldEditor  <%= Util.isEmpty(obj.getCssClasses()) ? "empty" : "" %>">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "cssClasses", userLang) %><jalios:edit pub='<%= obj %>' fields='cssClasses'/></td>
    <td class='field-data' <%= gfla(obj, "cssClasses") %>>
            <jalios:if predicate='<%= Util.notEmpty(obj.getCssClasses()) %>'>
            <%= obj.getCssClasses() %>
            </jalios:if>
    </td>
  </tr>
  <tr class="field exactCategory booleanEditor  ">
    <td class='field-label'><%= channel.getTypeFieldLabel(PortletPortal.class, "exactCategory", userLang) %><jalios:edit pub='<%= obj %>' fields='exactCategory'/></td>
    <td class='field-data' >
            <%= obj.getExactCategoryLabel(userLang) %>
    </td>
  </tr>
 
</table>
<jsp:include page="/front/doFullDisplayCommonFields.jsp" />
</div><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- aCeQ4wstGQXB9Nf75vZd8w== --%>